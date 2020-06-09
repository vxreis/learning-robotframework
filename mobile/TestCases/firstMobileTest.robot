*** Settings ***
Documentation    Test mobile example
Resource  ../Resource/keywords.robot
Metadata  1.0
Test Teardown  close application

*** Test Cases ***
Search Robot on Youtube
    [Tags]    DEBUG
    Open Youtube
    Search about  Robot Framework
