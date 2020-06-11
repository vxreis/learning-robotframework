*** Settings ***
Library    BuiltIn
Library    SeleniumLibrary

*** Variables ***
${BTN_SIGNIN}       css:div.user-info a
${USER_LOGGED}      xpath://a[@class='account']//span[@class='hidden-sm-down']
${PRODUCTS}         class:thumbnail-container
${NUMBER_IN_THE_CART}  class:cart-products-count
${PRODUCTS_NAME}     css:div.product-description a
${PRODUCTS_PRICE}    class:price

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

get product name
    [Arguments]  ${index}
    @{list_products}    Get Webelements     ${PRODUCTS_NAME}
    [Return]    @{list_products[${index}]}

get product price
    [Arguments]  ${index}
    @{list_products}    Get Webelements     ${PRODUCTS_PRICE}
    [Return]    @{list_products[${index}]}

select product
    [Arguments]  ${index}
    @{list_products}    Get Webelements     ${PRODUCTS_NAME}
    Click Element    @{list_products[${index}]}
