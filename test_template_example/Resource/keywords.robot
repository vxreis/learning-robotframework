*** Settings ***
Library    SeleniumLibrary
Library    String
Resource  variables.robot
Resource   locators.robot
Library    ScreenCapLibrary

*** Keywords ***
the page is open on
    [Arguments]  ${browser}
    Open Browser    ${url}   ${browser}

close webbrowser
    Close Browser

validate login
    [Arguments]  ${user}    ${password}     ${validation}
    Given insert credentials  ${user}    ${password}
    Then credentials will be validated  ${${validation}}

insert credentials
    [Arguments]  ${user}  ${password}
    Input Text  ${USER_EDIT_TXT}        ${user}
    Input Text  ${PASSWORD_EDIT_TXT}    ${password}
    Click Element     class:fa-sign-in

credentials will be validated
    [Arguments]  ${validation}
    ${return}  Get Text  flash
    ${return}  Remove String   ${return}   ×
    Should Be Equal  ${validation.strip()}  ${return.strip()}
