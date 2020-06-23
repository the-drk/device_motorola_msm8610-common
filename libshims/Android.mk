#
# Copyright (C) 2016 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

CAMERA_CLIENT_LOCAL_PATH:= $(call my-dir)
include $(call all-subdir-makefiles)

# motorola logging
include $(CLEAR_VARS)
LOCAL_SRC_FILES := moto_log.c
LOCAL_MODULE := libmoto
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

# libqc-opt
include $(CLEAR_VARS)
LOCAL_SRC_FILES := icu53.c
LOCAL_SHARED_LIBRARIES := libicuuc libicui18n
LOCAL_MODULE := libshim_qcopt
LOCAL_MODULE_TAGS := optional

include $(CLEAR_VARS)

LOCAL_PATH := $(CAMERA_CLIENT_LOCAL_PATH)

LOCAL_SRC_FILES:= \
	Camera.cpp \
	CameraMetadata.cpp \
	CaptureResult.cpp \
	CameraParameters2.cpp \
	ICamera.cpp \
	ICameraClient.cpp \
	ICameraService.cpp \
	ICameraServiceListener.cpp \
	ICameraServiceProxy.cpp \
	ICameraRecordingProxy.cpp \
	ICameraRecordingProxyListener.cpp \
	camera2/ICameraDeviceUser.cpp \
	camera2/ICameraDeviceCallbacks.cpp \
	camera2/CaptureRequest.cpp \
	camera2/OutputConfiguration.cpp \
	CameraBase.cpp \
	CameraUtils.cpp \
	VendorTagDescriptor.cpp \
	CameraParameters.cpp

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	libutils \
	liblog \
	libbinder \
	libhardware \
	libui \
	libgui \
	libcamera_metadata

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/include \
	system/media/camera/include \
	system/media/private/camera/include

LOCAL_MODULE := libshim_camera

include $(BUILD_SHARED_LIBRARY)

# thermal engine
include $(CLEAR_VARS)
LOCAL_SRC_FILES := thermal.c
LOCAL_MODULE := libshims_thermal
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := atomic.cpp

LOCAL_MODULE := libshims_atomic
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := liblog

include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    sensorlistener/ISensorServer.cpp \
    sensorlistener/SensorManager.cpp \
    sensorlistener/moto_camera_misc.c

LOCAL_MODULE := libshims_sensorlistener
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES := \
    libnativeloader \
    libbinder \
    libcutils \
    libEGL \
    libGLESv2 \
    libsync \
    libui \
    libutils \
    liblog \
    libbase \
    libsensor

include $(BUILD_SHARED_LIBRARY)
