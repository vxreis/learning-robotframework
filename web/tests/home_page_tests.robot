*** Settings ***
Documentation    Home suite tests
Resource    ../keywords/home_page_keywords.robot
Resource    base_tests.robot
Default Tags  home
Suite Setup  The page is open on  ${BROWSER}
Suite Teardown  Close Browser

*** Variables ***

*** Test Cases ***
Home page shows eight products
    Given the user opens the main page
    Then eight products will be displayed

Home page shows the cart empty
    [Tags]    cart
    Given the user opens the main page
    Then the cart must be empty

Data consistency on the details page
    [Tags]   data
    Given the user selects a product
    Then the product data should persist
