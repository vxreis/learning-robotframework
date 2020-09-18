*** Settings ***
Library    BuiltIn
Library    String
Library    SeleniumLibrary

*** Variables ***
${BTN_SIGNIN}       css:div.user-info a
${NAME}             class:h1
${PRICE}            css:.current-price span:nth-child(1)
${SIZE}             group_1
${AMOUNT}           quantity_wanted
${COLOR_BLACK}      xpath://ul[@id='group_2']//input[@value='11']
${BTN_ADD_TO_CART}  class:add-to-cart

*** Keywords ***
get product name
    ${name}   Get Text    ${NAME}
    ${name}     Convert To Lower Case    ${name}
    [Return]    ${name}

get product price
    ${price}   Get Text    ${PRICE}
    [Return]    ${price.replace("$", "")}

find dropdown size

get list size

select size

select black color
    Click Element   ${COLOR_BLACK}

set amount

click add to card
    Click Element   ${BTN_ADD_TO_CART}
