# This file is generated by gyp; do not edit.

include $(CLEAR_VARS)

LOCAL_MODULE_CLASS := STATIC_LIBRARIES
LOCAL_MODULE := components_autofill_browser_gyp
LOCAL_MODULE_SUFFIX := .a
LOCAL_MODULE_TAGS := optional
gyp_intermediate_dir := $(call local-intermediates-dir)
gyp_shared_intermediate_dir := $(call intermediates-dir-for,GYP,shared)

# Make sure our deps are built first.
GYP_TARGET_DEPENDENCIES := \
	$(call intermediates-dir-for,GYP,components_autofill_regexes_gyp)/autofill_regexes.stamp \
	$(call intermediates-dir-for,STATIC_LIBRARIES,components_autofill_risk_proto_gyp)/components_autofill_risk_proto_gyp.a \
	$(call intermediates-dir-for,STATIC_LIBRARIES,skia_skia_gyp)/skia_skia_gyp.a \
	$(call intermediates-dir-for,GYP,third_party_icu_icui18n_gyp)/icui18n.stamp \
	$(call intermediates-dir-for,GYP,third_party_icu_icuuc_gyp)/icuuc.stamp \
	$(call intermediates-dir-for,STATIC_LIBRARIES,third_party_libphonenumber_libphonenumber_without_metadata_gyp)/third_party_libphonenumber_libphonenumber_without_metadata_gyp.a \
	$(call intermediates-dir-for,STATIC_LIBRARIES,ui_ui_gyp)/ui_ui_gyp.a \
	$(call intermediates-dir-for,GYP,webkit_support_webkit_resources_gyp)/webkit_resources.stamp \
	$(call intermediates-dir-for,GYP,components_component_resources_gyp)/component_resources.stamp

GYP_GENERATED_OUTPUTS :=

# Make sure our deps and generated files are built first.
LOCAL_ADDITIONAL_DEPENDENCIES := $(GYP_TARGET_DEPENDENCIES) $(GYP_GENERATED_OUTPUTS)

LOCAL_CPP_EXTENSION := .cc
$(gyp_intermediate_dir)/autofill_regex_constants.cc: $(gyp_shared_intermediate_dir)/autofill_regex_constants.cc
	mkdir -p $(@D); cp $< $@
LOCAL_GENERATED_SOURCES := \
	$(gyp_intermediate_dir)/autofill_regex_constants.cc

GYP_COPIED_SOURCE_ORIGIN_DIRS := \
	$(gyp_shared_intermediate_dir)

LOCAL_SRC_FILES := \
	components/autofill/browser/address.cc \
	components/autofill/browser/address_field.cc \
	components/autofill/browser/autocheckout/whitelist_manager.cc \
	components/autofill/browser/autocheckout_manager.cc \
	components/autofill/browser/autocheckout_page_meta_data.cc \
	components/autofill/browser/autocheckout_request_manager.cc \
	components/autofill/browser/autocomplete_history_manager.cc \
	components/autofill/browser/autofill_country.cc \
	components/autofill/browser/autofill_data_model.cc \
	components/autofill/browser/autofill_download.cc \
	components/autofill/browser/autofill_download_url.cc \
	components/autofill/browser/autofill_external_delegate.cc \
	components/autofill/browser/autofill_field.cc \
	components/autofill/browser/autofill_manager.cc \
	components/autofill/browser/autofill_metrics.cc \
	components/autofill/browser/autofill_profile.cc \
	components/autofill/browser/autofill_regexes.cc \
	components/autofill/browser/autofill_scanner.cc \
	components/autofill/browser/autofill_type.cc \
	components/autofill/browser/autofill_xml_parser.cc \
	components/autofill/browser/contact_info.cc \
	components/autofill/browser/credit_card.cc \
	components/autofill/browser/credit_card_field.cc \
	components/autofill/browser/email_field.cc \
	components/autofill/browser/form_field.cc \
	components/autofill/browser/form_group.cc \
	components/autofill/browser/form_structure.cc \
	components/autofill/browser/name_field.cc \
	components/autofill/browser/password_autofill_manager.cc \
	components/autofill/browser/password_generator.cc \
	components/autofill/browser/personal_data_manager.cc \
	components/autofill/browser/phone_field.cc \
	components/autofill/browser/phone_number.cc \
	components/autofill/browser/phone_number_i18n.cc \
	components/autofill/browser/risk/fingerprint.cc \
	components/autofill/browser/state_names.cc \
	components/autofill/browser/validation.cc \
	components/autofill/browser/wallet/cart.cc \
	components/autofill/browser/wallet/encryption_escrow_client.cc \
	components/autofill/browser/wallet/full_wallet.cc \
	components/autofill/browser/wallet/instrument.cc \
	components/autofill/browser/wallet/required_action.cc \
	components/autofill/browser/wallet/wallet_address.cc \
	components/autofill/browser/wallet/wallet_client.cc \
	components/autofill/browser/wallet/wallet_items.cc \
	components/autofill/browser/wallet/wallet_service_url.cc \
	components/autofill/browser/wallet/wallet_signin_helper.cc \
	components/autofill/browser/webdata/autofill_change.cc \
	components/autofill/browser/webdata/autofill_entry.cc \
	components/autofill/browser/webdata/autofill_table.cc \
	components/autofill/browser/webdata/autofill_webdata_backend_impl.cc \
	components/autofill/browser/webdata/autofill_webdata_service.cc


# Flags passed to both C and C++ files.
MY_CFLAGS := \
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
	-m32 \
	-mmmx \
	-march=pentium4 \
	-msse2 \
	-mfpmath=sse \
	-fuse-ld=gold \
	-ffunction-sections \
	-funwind-tables \
	-g \
	-fno-short-enums \
	-finline-limit=64 \
	-Wa,--noexecstack \
	-U_FORTIFY_SOURCE \
	-Wno-extra \
	-Wno-ignored-qualifiers \
	-Wno-type-limits \
	-fno-stack-protector \
	-Os \
	-g \
	-fomit-frame-pointer \
	-fdata-sections \
	-ffunction-sections

MY_CFLAGS_C :=

MY_DEFS := \
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
	'-DPROTOBUF_USE_DLLS' \
	'-DGOOGLE_PROTOBUF_NO_RTTI' \
	'-DGOOGLE_PROTOBUF_NO_STATIC_INITIALIZER' \
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
	$(gyp_shared_intermediate_dir)/protoc_out \
	$(LOCAL_PATH)/third_party/protobuf \
	$(LOCAL_PATH)/third_party/protobuf/src \
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
	$(gyp_shared_intermediate_dir)/protoc_out/third_party/libphonenumber \
	$(LOCAL_PATH)/third_party/libphonenumber/src \
	$(gyp_shared_intermediate_dir)/webkit \
	$(gyp_shared_intermediate_dir)/component_resources \
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
	-Wno-error=c++0x-compat \
	-Wno-non-virtual-dtor \
	-Wno-sign-promo

### Rules for final target.

LOCAL_LDFLAGS := \
	-Wl,-z,now \
	-Wl,-z,relro \
	-Wl,-z,noexecstack \
	-fPIC \
	-m32 \
	-fuse-ld=gold \
	-nostdlib \
	-Wl,--no-undefined \
	-Wl,--exclude-libs=ALL \
	-Wl,--gc-sections \
	-Wl,-O1 \
	-Wl,--as-needed


LOCAL_STATIC_LIBRARIES := \
	components_autofill_risk_proto_gyp \
	skia_skia_gyp \
	third_party_libphonenumber_libphonenumber_without_metadata_gyp \
	ui_ui_gyp

# Enable grouping to fix circular references
LOCAL_GROUP_STATIC_LIBRARIES := true

LOCAL_SHARED_LIBRARIES := \
	libstlport \
	libdl

# Add target alias to "gyp_all_modules" target.
.PHONY: gyp_all_modules
gyp_all_modules: components_autofill_browser_gyp

# Alias gyp target name.
.PHONY: autofill_browser
autofill_browser: components_autofill_browser_gyp

include $(BUILD_STATIC_LIBRARY)
