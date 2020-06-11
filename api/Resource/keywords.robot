*** Settings ***
Library  RequestsLibrary
Library  BuiltIn

*** Variables ***
${BASE_URL}     http://thetestingworldapi.com/

*** Keywords ***
Create api session
    Create session  GET_SESSION     ${BASE_URL}

it is called the student list function
    ${response}     get request     GET_SESSION     api/studentsDetails
    Set Test Variable      ${response}

a list will be returned containing all registered students
    Should Be Equal As Strings   ${response.status_code}  200
