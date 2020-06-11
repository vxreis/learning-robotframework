*** Settings ***
Documentation    Suite API Tests
Resource  ../Resource/keywords.robot
Suite Setup  Create api session

*** Test Cases ***
List os students
    Given it is called the student list function
    Then a list will be returned containing all registered students
