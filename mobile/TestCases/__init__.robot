*** Settings ***
Library  BuiltIn
Library  appiumConfig
Suite Setup     Init test

*** Keywords ***
Init test
    start appium  ${DEVICE_NAME}    ${OUTPUTDIR}
    BuiltIn.Sleep   3s
    @{DEVICE_INFO}      get device data    ${DEVICE_NAME}
    Set Global Variable     ${UDID}   ${DEVICE_INFO}[0]
    Set Global Variable     ${PORT}   ${DEVICE_INFO}[1]
