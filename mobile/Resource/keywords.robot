*** Settings ***
Library  AppiumLibrary
Library  BuiltIn
Resource  variables.robot
Resource  locators.robot 

*** Keywords ***
Open Youtube
    Open Application    ${REMOTE_URL}   &{CAPABILITIES_ANDROID}

Search about
    [Arguments]  ${word}
    Wait Until Element Is Visible   ${SEARCH_BUTTON}
    click element  ${SEARCH_BUTTON}
    input text  ${SEARCH_EDIT_TEXT}  ${word}
    PRESS KEYCODE  66  #android
    #input text  ${SEARCH_EDIT_TEXT}  \n  #ios
    wait until page contains element    ${FILTER_BUTTON}
