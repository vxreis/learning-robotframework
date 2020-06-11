*** Settings ***
Library     BuiltIn
Resource    ../pages/home_page.robot
Resource    ../pages/product_page.robot

*** Keywords ***
the user opens the main page
    [Return]  ""

eight products will be displayed
    ${number}   count products from home
    Should Be Equal As Integers     8   ${number}

the cart must be empty
    ${number}   number of items in the cart
    Should Be Equal As Integers     0   ${number}

the user selects a product
    ${name_p_home}     get product name from index    0
    Set Test Variable   ${name_from_home}   ${name_p_home}
    ${price_p_home}    get product price from index   0
    Set Test Variable   ${price_from_home}  ${price_p_home}
    select product from index  0

the product data should persist
    ${name_from_detail}     get product name
    ${price_from_detail}        get product price
    Should Be Equal     ${name_from_home}   ${name_from_detail}
    Should Be Equal     ${price_from_home}   ${price_from_detail}
