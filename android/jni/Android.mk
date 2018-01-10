LOCAL_PATH := $(call my-dir)



#-----------------------------------------------------------------------------
include $(CLEAR_VARS)

LOCAL_MODULE := xmrig
XMRIG_SRC_PATH := ../../

LOCAL_SRC_FILES :=    \
    $(XMRIG_SRC_PATH)/src/api/Api.cpp \
    $(XMRIG_SRC_PATH)/src/api/ApiState.cpp \
    $(XMRIG_SRC_PATH)/src/api/NetworkState.cpp \
    $(XMRIG_SRC_PATH)/src/App.cpp \
    $(XMRIG_SRC_PATH)/src/Console.cpp \
    $(XMRIG_SRC_PATH)/src/log/ConsoleLog.cpp \
    $(XMRIG_SRC_PATH)/src/log/FileLog.cpp \
    $(XMRIG_SRC_PATH)/src/log/Log.cpp \
    $(XMRIG_SRC_PATH)/src/Mem.cpp \
    $(XMRIG_SRC_PATH)/src/net/Client.cpp \
    $(XMRIG_SRC_PATH)/src/net/Job.cpp \
    $(XMRIG_SRC_PATH)/src/net/Network.cpp \
    $(XMRIG_SRC_PATH)/src/net/strategies/DonateStrategy.cpp \
    $(XMRIG_SRC_PATH)/src/net/strategies/FailoverStrategy.cpp \
    $(XMRIG_SRC_PATH)/src/net/strategies/SinglePoolStrategy.cpp \
    $(XMRIG_SRC_PATH)/src/net/SubmitResult.cpp \
    $(XMRIG_SRC_PATH)/src/net/Url.cpp \
    $(XMRIG_SRC_PATH)/src/Options.cpp \
    $(XMRIG_SRC_PATH)/src/Platform.cpp \
    $(XMRIG_SRC_PATH)/src/Summary.cpp \
    $(XMRIG_SRC_PATH)/src/workers/DoubleWorker.cpp \
    $(XMRIG_SRC_PATH)/src/workers/Handle.cpp \
    $(XMRIG_SRC_PATH)/src/workers/Hashrate.cpp \
    $(XMRIG_SRC_PATH)/src/workers/SingleWorker.cpp \
    $(XMRIG_SRC_PATH)/src/workers/Worker.cpp \
    $(XMRIG_SRC_PATH)/src/workers/Workers.cpp \
    $(XMRIG_SRC_PATH)/src/xmrig.cpp \
    $(XMRIG_SRC_PATH)/src/App_unix.cpp \
    $(XMRIG_SRC_PATH)/src/Cpu_unix.cpp \
    $(XMRIG_SRC_PATH)/src/Mem_unix.cpp \
    $(XMRIG_SRC_PATH)/src/Cpu_arm.cpp \
    $(XMRIG_SRC_PATH)/src/crypto/c_keccak.c \
    $(XMRIG_SRC_PATH)/src/crypto/c_groestl.c \
    $(XMRIG_SRC_PATH)/src/crypto/c_blake256.c \
    $(XMRIG_SRC_PATH)/src/crypto/c_jh.c \
    $(XMRIG_SRC_PATH)/src/crypto/c_skein.c \
    $(XMRIG_SRC_PATH)/src/crypto/CryptoNight.cpp \
    $(XMRIG_SRC_PATH)/src/Platform_unix.cpp \
    $(XMRIG_SRC_PATH)/src/Rand_android.cpp

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../../src $(LOCAL_PATH)/../libuv/include $(LOCAL_PATH)/../../src/3rdparty

LOCAL_CPPFLAGS += -pthread  -frtti -std=c++11  -Wall -fno-exceptions -fno-rtti -Wno-missing-braces
LOCAL_CFLAGS   += -Ofast -funroll-loops -fmerge-all-constants -flax-vector-conversions
LOCAL_CPPFLAGS += -Ofast -funroll-loops -fmerge-all-constants -flax-vector-conversions
LOCAL_CFLAGS +=  -DXMRIG_ARM -DXMRIG_NO_HTTPD -DXMRIG_NO_API -DXMRIG_NO_LIBCPUID

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_CFLAGS   += -mfpu=neon -march=armv7-a
LOCAL_CPPFLAGS += -mfpu=neon  -march=armv7-a
else ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
LOCAL_CFLAGS   += -march=armv8-a
LOCAL_CPPFLAGS += -march=armv8-a
endif

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
LOCAL_CFLAGS += -DXMRIG_ARMv7
LOCAL_LDLIBS +=  -luv_armv7
else ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
LOCAL_CFLAGS += -DXMRIG_ARMv8 -DXMRIG_ARMv7
LOCAL_LDLIBS +=  -luv_armv8
endif

LOCAL_LDFLAGS += -L$(LOCAL_PATH)/../libuv/lib


LOCAL_CFLAGS += -fPIE -Wall
LOCAL_LDFLAGS += -fPIE -pie -llog
include $(BUILD_EXECUTABLE)