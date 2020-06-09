*** Settings ***
Documentation    Home suite tests
Resource    ../keywords/home_page_keywords.robot
Resource    base_tests.robot
Suite Setup  The page is open on  ${BROWSER}
Suite Teardown  Close Browser

*** Variables ***

*** Test Cases ***
Home page shows eight products
    [Tags]    home
    Given that the user is on the home page
    Then eight products will be displayed
