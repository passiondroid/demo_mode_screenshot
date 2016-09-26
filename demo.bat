@ECHO OFF

echo Android Demo Mode Tool											
echo.
echo Enabling Demo Mode
adb shell settings put global sysui_demo_allowed 1
adb shell am broadcast -a com.android.systemui.demo -e command enter
echo.
echo Setting clock to 8:00
adb shell am broadcast -a com.android.systemui.demo -e command clock -e hhmm 0800
echo.
echo Setting max wifi level
adb shell am broadcast -a com.android.systemui.demo -e command network -e wifi show -e level 4
echo.
echo Setting max battery level
adb shell am broadcast -a com.android.systemui.demo -e command battery -e level 100 -e plugged false
echo.
echo Hiding all notifications
adb shell am broadcast -a com.android.systemui.demo -e command notifications -e visible false
echo.
echo Taking screenshot
adb shell screencap -p /sdcard/screenshot.png
echo.
echo Moving screenshot to PC
adb pull /sdcard/screenshot.png
adb shell rm /sdcard/screenshot.png
echo.
echo Done! Exiting demo mode
