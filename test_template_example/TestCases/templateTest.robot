*** Settings ***
Resource        ../Resource/keywords.robot
Suite Setup      the page is open on  ${BROWSER}
Suite Teardown   close webbrowser
Test Teardown    Run Keyword If Test Failed    Capture Page Screenshot
Test Template    validate login

*** Variables ***
${VALID USER}       tomsmith
${VALID PASSWORD}   SuperSecretPassword!

*** Test Cases ***                USERNAME         PASSWORD                 STATUS
Invalid User Name                 invalid          ${VALID PASSWORD}        USER_FAILED
Invalid Password                  ${VALID USER}    invalid                  PASSWORD_FAILED
Invalid User Name and Password    invalid          invalid                  USER_FAILED
Empty User Name                   ${EMPTY}         ${VALID PASSWORD}        USER_FAILED
Empty Password                    ${VALID USER}    ${EMPTY}                 PASSWORD_FAILED
Empty User Name and Password      ${EMPTY}         ${EMPTY}                 USER_FAILED
Valid User Name and Password      ${VALID USER}    ${VALID PASSWORD}        LOGIN_SUCCESS
