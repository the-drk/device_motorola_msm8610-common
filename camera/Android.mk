#LOCAL_PATH := $(call my-dir)
#include $(CLEAR_VARS)
#
#LOCAL_C_INCLUDES := system/media/camera/include
#
#LOCAL_SRC_FILES := \
#    CameraWrapper.cpp
#
#LOCAL_SHARED_LIBRARIES := \
#    libhardware liblog libcamera_client libgui libutils libbase
#
#LOCAL_HEADER_LIBRARIES := libnativebase_headers
#
#LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
#LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)
#LOCAL_MODULE_TAGS := optional
#
#include $(BUILD_SHARED_LIBRARY)
ifeq ($(BOARD_BUILD_OP2_CAMERA),true)

MM_V4L2_DRIVER_LIST += msm8960
MM_V4L2_DRIVER_LIST += msm8974
MM_V4L2_DRIVER_LIST += msm8916
MM_V4L2_DRIVER_LIST += msm8226
MM_V4L2_DRIVER_LIST += msm8610
MM_V4L2_DRIVER_LIST += apq8084
MM_V4L2_DRIVER_LIST += mpq8092
MM_V4L2_DRIVER_LIST += msm_bronze
MM_V4L2_DRIVER_LIST += msm8916
MM_V4L2_DRIVER_LIST += msm8994
MM_V4L2_DRIVER_LIST += msm8084
MM_V4L2_DRIVER_LIST += msm8992

ifneq (,$(filter $(MM_V4L2_DRIVER_LIST),$(TARGET_BOARD_PLATFORM)))
  ifneq ($(strip $(USE_CAMERA_STUB)),true)
    ifneq ($(BUILD_TINY_ANDROID),true)
      include $(call all-subdir-makefiles)
    endif
  endif
endif

endif
