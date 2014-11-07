LOCAL_PATH := $(call my-dir)


#Creating Gralloc SymLink
include $(CLEAR_VARS)

LOCAL_MODULE := gralloc.omap4.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := FAKE

include $(BUILD_SYSTEM)/base_rules.mk

$(LOCAL_BUILT_MODULE): GRALLOC_FILE := gralloc.omap4430.so
$(LOCAL_BUILT_MODULE): SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/$(LOCAL_MODULE)
$(LOCAL_BUILT_MODULE): $(LOCAL_PATH)/Android.mk
$(LOCAL_BUILT_MODULE):
	$(hide) echo "Symlink: $(SYMLINK) -> $(GRALLOC_FILE)"
	$(hide) mkdir -p $(dir $@)
	$(hide) mkdir -p $(dir $(SYMLINK))
	$(hide) rm -rf $@
	$(hide) rm -rf $(SYMLINK)
	$(hide) ln -sf $(GRALLOC_FILE) $(SYMLINK)
	$(hide) touch $@

# Google goofed Invensense with Lollipop and made this part dependent on TARGET_DEVICE is tuna.
# TARGET_DEVICE gets set to the specific variant though, e.g. maguro or toro.
# Rather than fork hardware/invensense, just work around it here.
#include $(CLEAR_VARS)
#include $(LOCAL_PATH)/../../../hardware/invensense/60xx/Android.mk

#include $(CLEAR_VARS)
include $(call all-makefiles-under,$(LOCAL_PATH))