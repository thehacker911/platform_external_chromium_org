// Copyright (c) 2012 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#include "content/renderer/pepper/pepper_file_chooser_host.h"

#include "base/files/file_path.h"
#include "base/strings/utf_string_conversions.h"
#include "content/public/renderer/renderer_ppapi_host.h"
#include "content/renderer/render_view_impl.h"
#include "ppapi/c/pp_errors.h"
#include "ppapi/host/dispatch_host_message.h"
#include "ppapi/host/ppapi_host.h"
#include "ppapi/proxy/ppapi_messages.h"
#include "third_party/WebKit/public/platform/WebCString.h"
#include "third_party/WebKit/public/platform/WebString.h"
#include "third_party/WebKit/public/platform/WebVector.h"
#include "third_party/WebKit/public/web/WebFileChooserCompletion.h"
#include "third_party/WebKit/public/web/WebFileChooserParams.h"

namespace content {

class PepperFileChooserHost::CompletionHandler
    : public WebKit::WebFileChooserCompletion {
 public:
  CompletionHandler(const base::WeakPtr<PepperFileChooserHost>& host)
      : host_(host) {
  }

  virtual ~CompletionHandler() {}

  virtual void didChooseFile(
      const WebKit::WebVector<WebKit::WebString>& file_names) {
    if (host_.get()) {
      std::vector<PepperFileChooserHost::ChosenFileInfo> files;
      for (size_t i = 0; i < file_names.size(); i++) {
        files.push_back(PepperFileChooserHost::ChosenFileInfo(
            file_names[i].utf8(), std::string()));
      }
      host_->StoreChosenFiles(files);
    }

    // It is the responsibility of this method to delete the instance.
    delete this;
  }
  virtual void didChooseFile(
      const WebKit::WebVector<SelectedFileInfo>& file_names) {
    if (host_.get()) {
      std::vector<PepperFileChooserHost::ChosenFileInfo> files;
      for (size_t i = 0; i < file_names.size(); i++) {
        files.push_back(PepperFileChooserHost::ChosenFileInfo(
            file_names[i].path.utf8(),
            file_names[i].displayName.utf8()));
      }
      host_->StoreChosenFiles(files);
    }

    // It is the responsibility of this method to delete the instance.
    delete this;
  }

 private:
  base::WeakPtr<PepperFileChooserHost> host_;

  DISALLOW_COPY_AND_ASSIGN(CompletionHandler);
};

PepperFileChooserHost::ChosenFileInfo::ChosenFileInfo(
    const std::string& path,
    const std::string& display_name)
    : path(path),
      display_name(display_name) {
}


PepperFileChooserHost::PepperFileChooserHost(
    RendererPpapiHost* host,
    PP_Instance instance,
    PP_Resource resource)
    : ResourceHost(host->GetPpapiHost(), instance, resource),
      renderer_ppapi_host_(host),
      num_pending_file_resources_(0),
      handler_(NULL),
      weak_factory_(this) {
}

PepperFileChooserHost::~PepperFileChooserHost() {
}

int32_t PepperFileChooserHost::OnResourceMessageReceived(
    const IPC::Message& msg,
    ppapi::host::HostMessageContext* context) {
  IPC_BEGIN_MESSAGE_MAP(PepperFileChooserHost, msg)
    PPAPI_DISPATCH_HOST_RESOURCE_CALL(PpapiHostMsg_FileChooser_Show, OnShow)
  IPC_END_MESSAGE_MAP()
  return PP_ERROR_FAILED;
}

void PepperFileChooserHost::StoreChosenFiles(
    const std::vector<ChosenFileInfo>& files) {
  num_pending_file_resources_ = files.size();
  for (size_t i = 0; i < files.size(); i++) {
#if defined(OS_WIN)
    base::FilePath file_path(UTF8ToWide(files[i].path));
#else
    base::FilePath file_path(files[i].path);
#endif
    renderer_ppapi_host_->CreateBrowserResourceHost(
        pp_instance(),
        PpapiHostMsg_FileRef_CreateExternal(file_path),
        base::Bind(&PepperFileChooserHost::DidCreateResourceHost,
                   weak_factory_.GetWeakPtr(),
                   file_path,
                   files[i].display_name));
  }

  if (files.empty()) {
    reply_context_.params.set_result(PP_ERROR_USERCANCEL);
    std::vector<ppapi::FileRefCreateInfo> chosen_files;
    host()->SendReply(reply_context_,
                      PpapiPluginMsg_FileChooser_ShowReply(chosen_files));
    reply_context_ = ppapi::host::ReplyMessageContext();
    handler_ = NULL;  // Handler deletes itself.
  }
}

int32_t PepperFileChooserHost::OnShow(
    ppapi::host::HostMessageContext* context,
    bool save_as,
    bool open_multiple,
    const std::string& suggested_file_name,
    const std::vector<std::string>& accept_mime_types) {
  if (handler_)
    return PP_ERROR_INPROGRESS;  // Already pending.

  if (!host()->permissions().HasPermission(
          ppapi::PERMISSION_BYPASS_USER_GESTURE) &&
       !renderer_ppapi_host_->HasUserGesture(pp_instance())) {
    return PP_ERROR_NO_USER_GESTURE;
  }

  WebKit::WebFileChooserParams params;
  if (save_as) {
    params.saveAs = true;
    params.initialValue = WebKit::WebString::fromUTF8(
        suggested_file_name.data(), suggested_file_name.size());
  } else {
    params.multiSelect = open_multiple;
  }
  std::vector<WebKit::WebString> mine_types(accept_mime_types.size());
  for (size_t i = 0; i < accept_mime_types.size(); i++) {
    mine_types[i] = WebKit::WebString::fromUTF8(
        accept_mime_types[i].data(), accept_mime_types[i].size());
  }
  params.acceptTypes = mine_types;
  params.directory = false;

  handler_ = new CompletionHandler(AsWeakPtr());
  RenderViewImpl* render_view = static_cast<RenderViewImpl*>(
      renderer_ppapi_host_->GetRenderViewForInstance(pp_instance()));
  if (!render_view || !render_view->runFileChooser(params, handler_)) {
    delete handler_;
    handler_ = NULL;
    return PP_ERROR_NOACCESS;
  }

  reply_context_ = context->MakeReplyMessageContext();
  return PP_OK_COMPLETIONPENDING;
}

void PepperFileChooserHost::DidCreateResourceHost(
    const base::FilePath& file_path,
    const std::string& display_name,
    int32_t id) {
  num_pending_file_resources_--;
  ppapi::FileRefCreateInfo info = ppapi::MakeExternalFileRefCreateInfo(
      file_path, display_name, id);
  chosen_files_.push_back(info);
  if (num_pending_file_resources_ == 0) {
    reply_context_.params.set_result(PP_OK);
    host()->SendReply(reply_context_,
                      PpapiPluginMsg_FileChooser_ShowReply(chosen_files_));
    reply_context_ = ppapi::host::ReplyMessageContext();
    handler_ = NULL;  // Handler deletes itself.
  }
}

}  // namespace content

