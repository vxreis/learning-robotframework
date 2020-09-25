*** Settings ***
Documentation    Test mobile example
Resource  ../Resource/keywords.robot

*** Test Cases ***
Search Robot on Youtube
    [Tags]    DEBUG
    Open Youtube
    Search about  Robot Framework
