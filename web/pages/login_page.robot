*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TXT_EMAIL}      name:email
${TXT_PASSWORD}   name:password
${BTN_SUBMIT_SIGNIN}     id:submit-login

*** Keywords ***
fill email
    [Arguments]  ${user}
    Input Text  ${TXT_EMAIL}        ${user}

fill password
    [Arguments]  ${password}
    Input Text  ${TXT_PASSWORD}        ${password}

click sign in button
    Click Element   ${BTN_SUBMIT_SIGNIN}
