### How to build:
1. Download and install android-ndk (need r11 version or later)
2. cd xmrig/android
3. Run ndk-build



##环境

1. NDK r18b
2. MACOS

### QA

1. 编译报错

```
/Volumes/WDH2/develop/android-ndk-r18b/build/core/add-application.mk:178: *** Android NDK: APP_STL gnustl_static is no longer supported. Please switch to either c++_static or c++_shared. See https://developer.android.com/ndk/guides/cpp-support.html for more information.    .  Stop.
```


 * 方法一： Android.mk 中修改成 APP_STL := c++_shared

 	这种方式必须把 libc++_shared.so 放到 /system/lib 下面
 
 * 方法二：Android.mk 中修改成 APP_STL := c++_static
	
	这种方式似乎更好
