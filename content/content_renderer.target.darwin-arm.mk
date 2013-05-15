# This file is generated by gyp; do not edit.

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE := content_content_renderer_gyp
LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE_TAGS := optional
gyp_intermediate_dir := $(call local-intermediates-dir)
gyp_shared_intermediate_dir := $(call intermediates-dir-for,GYP,shared)

# Make sure our deps are built first.
GYP_TARGET_DEPENDENCIES := \
	$(call intermediates-dir-for,GYP,content_content_resources_gyp)/content_resources.stamp \
	$(call intermediates-dir-for,GYP,jingle_jingle_glue_gyp)/jingle_glue.stamp \
	$(call intermediates-dir-for,STATIC_LIBRARIES,skia_skia_gyp)/skia_skia_gyp.a \
	$(call intermediates-dir-for,GYP,third_party_icu_icui18n_gyp)/icui18n.stamp \
	$(call intermediates-dir-for,GYP,third_party_icu_icuuc_gyp)/icuuc.stamp \
	$(call intermediates-dir-for,GYP,third_party_npapi_npapi_gyp)/npapi.stamp \
	$(call intermediates-dir-for,GYP,v8_tools_gyp_v8_gyp)/v8.stamp \
	$(call intermediates-dir-for,STATIC_LIBRARIES,webkit_support_glue_gyp)/webkit_support_glue_gyp.a \
	$(call intermediates-dir-for,STATIC_LIBRARIES,third_party_libphonenumber_libphonenumber_without_metadata_gyp)/third_party_libphonenumber_libphonenumber_without_metadata_gyp.a

GYP_GENERATED_OUTPUTS :=

# Make sure our deps and generated files are built first.
LOCAL_ADDITIONAL_DEPENDENCIES := $(GYP_TARGET_DEPENDENCIES) $(GYP_GENERATED_OUTPUTS)

LOCAL_CPP_EXTENSION := .cc
LOCAL_GENERATED_SOURCES :=

GYP_COPIED_SOURCE_ORIGIN_DIRS :=

LOCAL_SRC_FILES := \
	content/public/renderer/android_content_detection_prefixes.cc \
	content/public/renderer/content_renderer_client.cc \
	content/public/renderer/document_state.cc \
	content/public/renderer/navigation_state.cc \
	content/public/renderer/render_process_observer.cc \
	content/public/renderer/render_thread.cc \
	content/public/renderer/render_view_observer.cc \
	content/renderer/accessibility/accessibility_node_serializer.cc \
	content/renderer/accessibility/renderer_accessibility.cc \
	content/renderer/accessibility/renderer_accessibility_complete.cc \
	content/renderer/accessibility/renderer_accessibility_focus_only.cc \
	content/renderer/all_rendering_benchmarks.cc \
	content/renderer/android/address_detector.cc \
	content/renderer/android/content_detector.cc \
	content/renderer/android/email_detector.cc \
	content/renderer/android/phone_number_detector.cc \
	content/renderer/android/synchronous_compositor_output_surface.cc \
	content/renderer/device_orientation_dispatcher.cc \
	content/renderer/devtools/devtools_agent.cc \
	content/renderer/devtools/devtools_agent_filter.cc \
	content/renderer/devtools/devtools_client.cc \
	content/renderer/disambiguation_popup_helper.cc \
	content/renderer/dom_automation_controller.cc \
	content/renderer/dom_storage/dom_storage_dispatcher.cc \
	content/renderer/dom_storage/webstoragearea_impl.cc \
	content/renderer/dom_storage/webstoragenamespace_impl.cc \
	content/renderer/external_popup_menu.cc \
	content/renderer/gamepad_shared_memory_reader.cc \
	content/renderer/geolocation_dispatcher.cc \
	content/renderer/gpu/compositor_output_surface.cc \
	content/renderer/gpu/compositor_software_output_device.cc \
	content/renderer/gpu/input_event_filter.cc \
	content/renderer/gpu/input_handler_manager.cc \
	content/renderer/gpu/gpu_benchmarking_extension.cc \
	content/renderer/gpu/mailbox_output_surface.cc \
	content/renderer/gpu/stream_texture_host_android.cc \
	content/renderer/gpu/render_widget_compositor.cc \
	content/renderer/hyphenator/hyphenator.cc \
	content/renderer/idle_user_detector.cc \
	content/renderer/image_loading_helper.cc \
	content/renderer/internal_document_state_data.cc \
	content/renderer/java/java_bridge_channel.cc \
	content/renderer/java/java_bridge_dispatcher.cc \
	content/renderer/load_progress_tracker.cc \
	content/renderer/media/audio_device_factory.cc \
	content/renderer/media/audio_input_message_filter.cc \
	content/renderer/media/audio_message_filter.cc \
	content/renderer/media/audio_renderer_mixer_manager.cc \
	content/renderer/media/pepper_platform_video_decoder_impl.cc \
	content/renderer/media/render_media_log.cc \
	content/renderer/media/renderer_gpu_video_decoder_factories.cc \
	content/renderer/media/renderer_webaudiodevice_impl.cc \
	content/renderer/media/rtc_video_renderer.cc \
	content/renderer/media/stream_texture_factory_impl_android.cc \
	content/renderer/media/video_capture_impl.cc \
	content/renderer/media/video_capture_impl_manager.cc \
	content/renderer/media/video_capture_message_filter.cc \
	content/renderer/media/webmediaplayer_proxy_impl_android.cc \
	content/renderer/media/webrtc_logging_handler_impl.cc \
	content/renderer/media/webrtc_logging_message_filter.cc \
	content/renderer/memory_benchmarking_extension.cc \
	content/renderer/mhtml_generator.cc \
	content/renderer/mouse_lock_dispatcher.cc \
	content/renderer/paint_aggregator.cc \
	content/renderer/password_form_conversion_utils.cc \
	content/renderer/plugin_channel_host.cc \
	content/renderer/browser_plugin/browser_plugin.cc \
	content/renderer/browser_plugin/browser_plugin_backing_store.cc \
	content/renderer/browser_plugin/browser_plugin_bindings.cc \
	content/renderer/browser_plugin/browser_plugin_manager.cc \
	content/renderer/browser_plugin/browser_plugin_manager_impl.cc \
	content/renderer/browser_plugin/browser_plugin_compositing_helper.cc \
	content/renderer/date_time_formatter.cc \
	content/renderer/fetchers/alt_error_page_resource_fetcher.cc \
	content/renderer/fetchers/image_resource_fetcher.cc \
	content/renderer/fetchers/multi_resolution_image_resource_fetcher.cc \
	content/renderer/fetchers/resource_fetcher.cc \
	content/renderer/render_process_impl.cc \
	content/renderer/render_thread_impl.cc \
	content/renderer/render_view_impl.cc \
	content/renderer/render_view_impl_android.cc \
	content/renderer/render_view_impl_params.cc \
	content/renderer/render_view_linux.cc \
	content/renderer/render_view_mouse_lock_dispatcher.cc \
	content/renderer/render_view_pepper_helper.cc \
	content/renderer/render_widget.cc \
	content/renderer/render_widget_fullscreen.cc \
	content/renderer/renderer_clipboard_client.cc \
	content/renderer/renderer_date_time_picker.cc \
	content/renderer/renderer_main.cc \
	content/renderer/renderer_main_platform_delegate_android.cc \
	content/renderer/renderer_webapplicationcachehost_impl.cc \
	content/renderer/renderer_webcookiejar_impl.cc \
	content/renderer/renderer_webcolorchooser_impl.cc \
	content/renderer/renderer_webkitplatformsupport_impl.cc \
	content/renderer/rendering_benchmark.cc \
	content/renderer/skia_benchmarking_extension.cc \
	content/renderer/text_input_client_observer.cc \
	content/renderer/v8_value_converter_impl.cc \
	content/renderer/web_ui_extension.cc \
	content/renderer/web_ui_extension_data.cc \
	content/renderer/webplugin_delegate_proxy.cc \
	content/renderer/websharedworker_proxy.cc \
	content/renderer/websharedworkerrepository_impl.cc


# Flags passed to both C and C++ files.
MY_CFLAGS := \
	-fstack-protector \
	--param=ssp-buffer-size=4 \
	-Werror \
	-fno-exceptions \
	-fno-strict-aliasing \
	-Wall \
	-Wno-unused-parameter \
	-Wno-missing-field-initializers \
	-fvisibility=hidden \
	-pipe \
	-fPIC \
	-fno-tree-sra \
	-fuse-ld=gold \
	-Wno-psabi \
	-ffunction-sections \
	-funwind-tables \
	-g \
	-fstack-protector \
	-fno-short-enums \
	-finline-limit=64 \
	-Wa,--noexecstack \
	-U_FORTIFY_SOURCE \
	-Wno-extra \
	-Wno-ignored-qualifiers \
	-Wno-type-limits \
	-Os \
	-g \
	-fomit-frame-pointer \
	-fdata-sections \
	-ffunction-sections

MY_CFLAGS_C :=

MY_DEFS := \
	'-DCONTENT_IMPLEMENTATION' \
	'-D_FILE_OFFSET_BITS=64' \
	'-DUSE_LINUX_BREAKPAD' \
	'-DNO_TCMALLOC' \
	'-DDISABLE_NACL' \
	'-DCHROMIUM_BUILD' \
	'-DUSE_LIBJPEG_TURBO=1' \
	'-DUSE_PROPRIETARY_CODECS' \
	'-DENABLE_GPU=1' \
	'-DUSE_OPENSSL=1' \
	'-DENABLE_EGLIMAGE=1' \
	'-DENABLE_LANGUAGE_DETECTION=1' \
	'-DENABLE_JAVA_BRIDGE' \
	'-DPOSIX_AVOID_MMAP' \
	'-DSK_BUILD_NO_IMAGE_ENCODE' \
	'-DSK_DEFERRED_CANVAS_USES_GPIPE=1' \
	'-DGR_GL_CUSTOM_SETUP_HEADER="GrGLConfig_chrome.h"' \
	'-DGR_AGGRESSIVE_SHADER_OPTS=1' \
	'-DSK_ENABLE_INST_COUNT=0' \
	'-DSK_USE_POSIX_THREADS' \
	'-DSK_BUILD_FOR_ANDROID' \
	'-DU_USING_ICU_NAMESPACE=0' \
	'-DFEATURE_ENABLE_SSL' \
	'-DFEATURE_ENABLE_VOICEMAIL' \
	'-DEXPAT_RELATIVE_PATH' \
	'-DGTEST_RELATIVE_PATH' \
	'-DJSONCPP_RELATIVE_PATH' \
	'-DNO_MAIN_THREAD_WRAPPING' \
	'-DNO_SOUND_SYSTEM' \
	'-DANDROID' \
	'-DPOSIX' \
	'-DPROTOBUF_USE_DLLS' \
	'-DGOOGLE_PROTOBUF_NO_RTTI' \
	'-DGOOGLE_PROTOBUF_NO_STATIC_INITIALIZER' \
	'-D__STDC_CONSTANT_MACROS' \
	'-D__STDC_FORMAT_MACROS' \
	'-D__GNU_SOURCE=1' \
	'-DUSE_STLPORT=1' \
	'-D_STLP_USE_PTR_SPECIALIZATIONS=1' \
	'-DCHROME_BUILD_ID=""' \
	'-DDYNAMIC_ANNOTATIONS_ENABLED=1' \
	'-DWTF_USE_DYNAMIC_ANNOTATIONS=1' \
	'-D_DEBUG'

LOCAL_CFLAGS := $(MY_CFLAGS_C) $(MY_CFLAGS) $(MY_DEFS)

# Include paths placed before CFLAGS/CPPFLAGS
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH) \
	$(gyp_shared_intermediate_dir)/shim_headers/ashmem/target \
	$(gyp_shared_intermediate_dir)/shim_headers/icui18n/target \
	$(gyp_shared_intermediate_dir)/shim_headers/icuuc/target \
	$(LOCAL_PATH)/third_party/khronos \
	$(LOCAL_PATH)/gpu \
	$(gyp_shared_intermediate_dir)/content \
	$(LOCAL_PATH)/skia/config \
	$(LOCAL_PATH)/third_party/skia/src/core \
	$(LOCAL_PATH)/third_party/skia/include/config \
	$(LOCAL_PATH)/third_party/skia/include/core \
	$(LOCAL_PATH)/third_party/skia/include/effects \
	$(LOCAL_PATH)/third_party/skia/include/pdf \
	$(LOCAL_PATH)/third_party/skia/include/gpu \
	$(LOCAL_PATH)/third_party/skia/include/gpu/gl \
	$(LOCAL_PATH)/third_party/skia/include/pathops \
	$(LOCAL_PATH)/third_party/skia/include/pipe \
	$(LOCAL_PATH)/third_party/skia/include/ports \
	$(LOCAL_PATH)/third_party/skia/include/utils \
	$(LOCAL_PATH)/skia/ext \
	$(LOCAL_PATH)/third_party/WebKit/Source/Platform/chromium \
	$(LOCAL_PATH)/third_party/WebKit/Source/Platform/chromium \
	$(LOCAL_PATH)/third_party/hyphen \
	$(GYP_ABS_ANDROID_TOP_DIR)/external/icu4c/common \
	$(GYP_ABS_ANDROID_TOP_DIR)/external/icu4c/i18n \
	$(LOCAL_PATH)/third_party/libjingle/overrides \
	$(LOCAL_PATH)/third_party/libjingle/source \
	$(LOCAL_PATH)/testing/gtest/include \
	$(LOCAL_PATH)/third_party \
	$(LOCAL_PATH)/third_party/webrtc \
	$(GYP_ABS_ANDROID_TOP_DIR)/external/expat/lib \
	$(LOCAL_PATH)/third_party/jsoncpp/overrides/include \
	$(LOCAL_PATH)/third_party/jsoncpp/source/include \
	$(LOCAL_PATH)/third_party/npapi \
	$(LOCAL_PATH)/third_party/npapi/bindings \
	$(LOCAL_PATH)/v8/include \
	$(gyp_shared_intermediate_dir)/protoc_out/third_party/libphonenumber \
	$(LOCAL_PATH)/third_party/libphonenumber/src \
	$(gyp_shared_intermediate_dir)/protoc_out \
	$(LOCAL_PATH)/third_party/protobuf \
	$(LOCAL_PATH)/third_party/protobuf/src \
	$(GYP_ABS_ANDROID_TOP_DIR)/frameworks/wilhelm/include \
	$(GYP_ABS_ANDROID_TOP_DIR)/bionic \
	$(GYP_ABS_ANDROID_TOP_DIR)/external/stlport/stlport

LOCAL_C_INCLUDES := $(GYP_COPIED_SOURCE_ORIGIN_DIRS) $(LOCAL_C_INCLUDES)

# Flags passed to only C++ (and not C) files.
LOCAL_CPPFLAGS := \
	-fno-rtti \
	-fno-threadsafe-statics \
	-fvisibility-inlines-hidden \
	-Wsign-compare \
	-Wno-abi \
	-Wno-error=c++0x-compat \
	-Wno-non-virtual-dtor \
	-Wno-sign-promo

### Rules for final target.

LOCAL_LDFLAGS := \
	-Wl,-z,now \
	-Wl,-z,relro \
	-Wl,-z,noexecstack \
	-fPIC \
	-Wl,-z,relro \
	-Wl,-z,now \
	-fuse-ld=gold \
	-nostdlib \
	-Wl,--no-undefined \
	-Wl,--exclude-libs=ALL \
	-Wl,--icf=safe \
	-Wl,--gc-sections \
	-Wl,-O1 \
	-Wl,--as-needed


LOCAL_STATIC_LIBRARIES := \
	cpufeatures \
	skia_skia_gyp \
	webkit_support_glue_gyp \
	third_party_libphonenumber_libphonenumber_without_metadata_gyp

# Enable grouping to fix circular references
LOCAL_GROUP_STATIC_LIBRARIES := true

LOCAL_SHARED_LIBRARIES := \
	libstlport \
	libdl

# Add target alias to "gyp_all_modules" target.
.PHONY: gyp_all_modules
gyp_all_modules: content_content_renderer_gyp

# Alias gyp target name.
.PHONY: content_renderer
content_renderer: content_content_renderer_gyp

include $(BUILD_STATIC_LIBRARY)
