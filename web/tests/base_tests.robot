*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}      https://marcelodebittencourt.com/demoprestashop/

*** Keywords ***
The page is open on
    [Arguments]  ${BROWSER}                 # options remove wornings do chromedriver
    Open Browser    ${url}   ${BROWSER}     options=add_experimental_option('excludeSwitches', ['enable-logging'])

Close session
    Capture Page Screenshot
    Close Browser
