// Copyright (c) 2012 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

#ifndef REMOTING_HOST_HOST_STARTER
#define REMOTING_HOST_HOST_STARTER

#include <string>

#include "base/callback.h"
#include "google_apis/gaia/gaia_oauth_client.h"
#include "remoting/base/rsa_key_pair.h"
#include "remoting/base/url_request_context.h"
#include "remoting/host/setup/daemon_controller.h"
#include "remoting/host/setup/service_client.h"

namespace remoting {

// A helper class that registers and starts a host.
class HostStarter : public gaia::GaiaOAuthClient::Delegate,
                    public remoting::ServiceClient::Delegate {
 public:
  enum Result {
    START_COMPLETE,
    NETWORK_ERROR,
    OAUTH_ERROR,
    START_ERROR,
  };

  typedef base::Callback<void(Result)> CompletionCallback;

  virtual ~HostStarter();

  // Creates a HostStarter.
  static scoped_ptr<HostStarter> Create(
      const std::string& chromoting_hosts_url,
      net::URLRequestContextGetter* url_request_context_getter);

  // Registers a new host with the Chromoting service, and starts it.
  // |auth_code| must be a valid OAuth2 authorization code, typically acquired
  // from a browser. This method uses that code to get an OAuth2 refresh token.
  void StartHost(const std::string& host_name,
                 const std::string& host_pin,
                 bool consent_to_data_collection,
                 const std::string& auth_code,
                 const std::string& redirect_url,
                 CompletionCallback on_done);

  // gaia::GaiaOAuthClient::Delegate
  virtual void OnGetTokensResponse(const std::string& refresh_token,
                                   const std::string& access_token,
                                   int expires_in_seconds) OVERRIDE;
  virtual void OnRefreshTokenResponse(const std::string& access_token,
                                      int expires_in_seconds) OVERRIDE;
  virtual void OnGetUserEmailResponse(const std::string& user_email) OVERRIDE;

  // remoting::ServiceClient::Delegate
  virtual void OnHostRegistered() OVERRIDE;
  virtual void OnHostUnregistered() OVERRIDE;

  // TODO(sergeyu): Following methods are members of all three delegate
  // interfaces implemented in this class. Fix ServiceClient and
  // GaiaUserEmailFetcher so that Delegate interfaces do not overlap (ideally
  // they should be changed to use Callback<>).
  virtual void OnOAuthError() OVERRIDE;
  virtual void OnNetworkError(int response_code) OVERRIDE;

 private:
  HostStarter(scoped_ptr<gaia::GaiaOAuthClient> oauth_client,
              scoped_ptr<remoting::ServiceClient> service_client,
              scoped_ptr<remoting::DaemonController> daemon_controller);

  void OnHostStarted(DaemonController::AsyncResult result);

  scoped_ptr<gaia::GaiaOAuthClient> oauth_client_;
  scoped_ptr<remoting::ServiceClient> service_client_;
  scoped_ptr<remoting::DaemonController> daemon_controller_;
  gaia::OAuthClientInfo oauth_client_info_;
  std::string host_name_;
  std::string host_pin_;
  bool consent_to_data_collection_;
  CompletionCallback on_done_;
  scoped_refptr<base::SingleThreadTaskRunner> main_task_runner_;
  std::string refresh_token_;
  std::string access_token_;
  std::string user_email_;
  scoped_refptr<remoting::RsaKeyPair> key_pair_;
  std::string host_id_;

  base::WeakPtrFactory<HostStarter> weak_ptr_factory_;
  base::WeakPtr<HostStarter> weak_ptr_;

  DISALLOW_COPY_AND_ASSIGN(HostStarter);
};

}  // namespace remoting

#endif  // REMOTING_HOST_HOST_STARTER
