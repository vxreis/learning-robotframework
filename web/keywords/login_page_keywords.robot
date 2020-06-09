*** Settings ***
Library     BuiltIn
Resource    ../pages/login_page.robot
Resource    ../pages/home_page.robot

*** Keywords ***
the user clicks the login button on the home page
    click the login button

user fill login and password
    [Arguments]     ${user}  ${password}
    fill email  ${user}
    fill password   ${password}
    click sign in button

user must be logged in
    [Arguments]     ${user}
    ${return}  check user is logged  ${user}
    Should Be True  ${return}
