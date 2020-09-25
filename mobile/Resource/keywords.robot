*** Settings ***
Library    AppiumLibrary
Library    BuiltIn
Resource   variables.robot
Resource   locators_${PLATFORM}.robot

*** Variable ***
&{CAPABILITIES}     &{CAPABILITIES_ANDROID}
${PLATFORM}     android

*** Keywords ***
Open Youtube
    Run Keyword If      'iphone' in '''${DEVICE_NAME}'''    Set capabilitiy for iphone
    Open Application    ${REMOTE_URL}   &{CAPABILITIES}

Set capabilitiy for iphone
    Set Global Variable     &{CAPABILITIES}     &{CAPABILITIES_IOS}
    Set Global Variable     ${PLATFORM}     ios

Search about
    [Arguments]  ${word}
    Wait Until Element Is Visible   ${SEARCH_BUTTON}
    click element  ${SEARCH_BUTTON}
    input text  ${SEARCH_EDIT_TEXT}  ${word}
    PRESS KEYCODE  66  #android
    #input text  ${SEARCH_EDIT_TEXT}  \n  #ios
    wait until page contains element    ${FILTER_BUTTON}
