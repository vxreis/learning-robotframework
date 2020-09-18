*** Settings ***
Library     Collections

*** Variables ***
# Setup do device
${REMOTE_URL}          http://localhost:${PORT}/wd/hub

${APP_PACKAGE}         com.google.android.youtube
${APP_ACTIVITY}        com.google.android.youtube.HomeActivity
${APP}                 com.google.ios.youtube

&{CAPABILITIES_ANDROID}   platformName=Android
...     platformVersion=10.0
...     deviceName=${DEVICE_NAME}
...     appPackage=${APP_PACKAGE}
...     appActivity=${APP_ACTIVITY}
...     automationName=UiAutomator2
...     udid=${UDID}
...     newCommandTimeout=3000

&{CAPABILITIES_IOS}   platformName=iOS
...     platformVersion=12.2
...     deviceName=${DEVICE_NAME}
...     app=${APP}
...     automationName=XCUITest
...     udid=${UDID}
...     newCommandTimeout=3000
...     xcodeOrgId=#######
...     xcodeSigningId=#######