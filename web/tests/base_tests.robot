*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}      https://marcelodebittencourt.com/demoprestashop/

*** Keywords ***
The page is open on
    [Arguments]  ${BROWSER}
    Open Browser    ${url}   ${BROWSER}
