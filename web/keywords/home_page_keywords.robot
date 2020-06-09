*** Settings ***
Library     BuiltIn
Resource    ../pages/home_page.robot

*** Keywords ***
that the user is on the home page
    [Return]  ""

eight products will be displayed
    ${number}   count products from home
    Should Be Equal As Integers     8   ${number}
