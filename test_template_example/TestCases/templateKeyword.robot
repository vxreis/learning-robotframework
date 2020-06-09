*** Settings ***
Documentation   My first web test
Resource        ../Resource/keywords.robot
Test Setup      the page is open on  ${BROWSER}
Test Teardown   close webbrowser

*** Variables ***
${VALID USER}       tomsmith
${VALID PASSWORD}   SuperSecretPassword!

*** Test Cases ***
Check credentials
    [Template]  validate login
    invalid          ${VALID PASSWORD}        USER_FAILED
    ${VALID USER}    invalid                  PASSWORD_FAILED
    invalid          invalid                  USER_FAILED
    ${EMPTY}         ${VALID PASSWORD}        USER_FAILED
    ${VALID USER}    ${EMPTY}                 PASSWORD_FAILED
    ${EMPTY}         ${EMPTY}                 USER_FAILED
    ${VALID USER}    ${VALID PASSWORD}        LOGIN_SUCCESS
