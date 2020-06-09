*** Settings ***
Documentation    Login suite tests
Resource    ../keywords/login_page_keywords.robot
Resource    base_tests.robot
Suite Setup  The page is open on  ${BROWSER}
Suite Teardown  Close Browser

*** Variables ***
${USER}         marcelo@teste.com
${PASSWORD}     marcelo

*** Test Cases ***
Test title
    [Tags]    login
    Given the user clicks the login button on the home page
    When user fill login and password   ${USER}     ${PASSWORD}
    Then user must be logged in     Marcelo Bittencourt
