*** Settings ***
Library     BuiltIn
Resource    ../pages/home_page.robot

*** Keywords ***
the user opens the main page
    [Return]  ""

eight products will be displayed
    ${number}   count products from home
    Should Be Equal As Integers     8   ${number}

the cart must be empty
    ${number}   number of items in the cart
    Log to console    ${number}
    Should Be Equal As Integers     0   ${number}
