*** Settings ***
Library  BuiltIn
Library  OperatingSystem
Library  appiumConfig
Suite Setup     Init test
#Test Setup      Capture Screen Recording
#Test Teardown   End Screen Recording
Test Teardown  close application
Metadata  1.0

*** Keywords ***
Init test
    start appium  ${DEVICE_NAME}    ${OUTPUTDIR}
    BuiltIn.Sleep   3s
    @{DEVICE_INFO}      get device data    ${DEVICE_NAME}
    Set Global Variable     ${UDID}   ${DEVICE_INFO}[0]
    Set Global Variable     ${PORT}   ${DEVICE_INFO}[1]

Capture Screen Recording
    #Documentation     Saves screen recording for failing tests.
    #...               iPhone: requires ffmpeg installed on Mac where phones are conneted. Run: brew install ffmpeg
    #...               Android: recording is not working in all phones (does not cause test failures if recording is not supported)
    ${pass}             Run Keyword And Return Status   Start Screen Recording
    Run Keyword Unless  ${pass}     Log                 Could not start screen recording

End Screen Recording
    Run Keyword And Ignore Error    Remove Screen Recording If Pass

Remove Screen Recording If Pass
    ${filename}                     Stop Screen Recording
    Run Keyword If Test Passed      Remove File     ${filename}
    Run Keyword If Test Passed      Log             Screen recording not saved because test execution passed.
