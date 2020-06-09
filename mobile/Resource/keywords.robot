*** Settings ***
Library  AppiumLibrary
Resource  variables.robot
Resource  locators.robot

*** Keywords ***
Open Youtube
    Open Application    ${REMOTE_URL}
    ...     platformName=${PLATFORM_NAME}
    ...     platformVersion=${PLATFORM_VERSION}
    ...     deviceName=${DEVICE_NAME}
    ...     appPackage=${APP_PACKAGE}
    ...     appActivity=${APP_ACTIVITY}
    ...     automationName=${AUTOMATION_NAME}
    ...     udid=${UDID}

Search about
    [Arguments]  ${word}
    click element  ${SEARCH_BUTTON}
    input text  ${SEARCH_EDIT_TEXT}  ${word}
    PRESS KEYCODE  66
    wait until page contains element    com.google.android.youtube:id/voice_search
