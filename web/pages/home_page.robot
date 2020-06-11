*** Settings ***
Library    BuiltIn
Library    String
Library    SeleniumLibrary

*** Variables ***
${BTN_SIGNIN}           css:div.user-info a
${USER_LOGGED}          xpath://a[@class='account']//span[@class='hidden-sm-down']
${PRODUCTS}             class:thumbnail-container
${NUMBER_IN_THE_CART}   class:cart-products-count
${PRODUCTS_NAME}        css:div.product-description a
${PRODUCTS_PRICE}       class:price

*** Keywords ***
click the login button
    Click Element   ${BTN_SIGNIN}

check user is logged
    [Arguments]     ${user}
    ${return}  Get Text  ${USER_LOGGED}
    [Return]  """${user.strip()}""" == """${return.strip()}"""

count products from home
    @{list_products}    Get Webelements     ${PRODUCTS_NAME}
    ${num}  Get Length  ${list_products}
    [Return]    ${num}

number of items in the cart
    ${number}   Get Text    ${NUMBER_IN_THE_CART}
    [Return]    ${number.replace("(", "").replace(")", "")}

get product name from index
    [Arguments]  ${index}
    @{list_products}    Get Webelements     ${PRODUCTS_NAME}
    ${name}     Get Text    ${list_products[${index}]}
    ${name}     Convert To Lower Case    ${name}
    [Return]    ${name}

get product price from index
    [Arguments]  ${index}
    @{list_products}    Get Webelements     ${PRODUCTS_PRICE}
    ${price}     Get Text    ${list_products[${index}]}
    [Return]    ${price.replace("$", "")}

select product from index
    [Arguments]  ${index}
    @{list_products}    Get Webelements     ${PRODUCTS_NAME}
    Click Element    ${list_products[${index}]}
