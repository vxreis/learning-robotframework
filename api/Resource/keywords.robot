*** Settings ***
Library  RequestsLibrary
Library  BuiltIn
Library  JSONLibrary
Library  Collections

*** Variables ***
${BASE_URL}             http://thetestingworldapi.com/
${FIELD_ID}             id
${FIELD_FIRT_NAME}      first_name
${FIELD_MIDDLE_NAME}    middle_name
${FIELD_LAST_NAME}      last_name
${FIELD_BIRTH_DATE}     date_of_birth


*** Keywords ***
Create api session
    Create session  GET_SESSION     ${BASE_URL}
    ${header}       Create Dictionary   Content-Type=application/json
    Set Suite Variable      ${HEADERS}     ${header}

it is called the student list function
    ${response}     get request     GET_SESSION     api/studentsDetails
    Set Test Variable      ${response}

a list will be returned containing all registered students
    Should Be Equal As Strings   ${response.status_code}  200

that the student data for the system is informed
    [Arguments]  ${name}    ${middle_name}    ${last_name}      ${birth_date}
    ${data}    Create Dictionary    ${FIELD_FIRT_NAME}=${name}    ${FIELD_MIDDLE_NAME}=${middle_name}
    ...     ${FIELD_LAST_NAME}=${last_name}     ${FIELD_BIRTH_DATE}=${birth_date}
    ${response}     Post Request    GET_SESSION     api/studentsDetails    data=${data}    headers=${HEADERS}
    Set Test Variable      ${response}
    Set Suite Variable      ${student_id}    ${response.json()['id']}

the system returns that it was successfully added
    Should Be Equal As Strings   ${response.status_code}  201

the last registered student is consulted
    ${response}     Get Request    GET_SESSION     api/studentsDetails/${student_id}
    Set Test Variable      ${response}

the name must be shown
    [Arguments]  ${name}
    Dictionary Should Contain Item  ${response.json()["data"]}  ${FIELD_FIRT_NAME}   ${name}

the middle name must be shown
    [Arguments]  ${middle_name}
    Dictionary Should Contain Item  ${response.json()["data"]}  ${FIELD_MIDDLE_NAME}   ${middle_name}

the last name must be shown
    [Arguments]  ${last_name}
    Dictionary Should Contain Item  ${response.json()["data"]}  ${FIELD_LAST_NAME}   ${last_name}

the date of birth must be shown
    [Arguments]  ${bith_date}
    Dictionary Should Contain Item  ${response.json()["data"]}  ${FIELD_BIRTH_DATE}   ${bith_date}

the student will be deleted from the list
    ${response}     Delete Request    GET_SESSION     api/studentsDetails/${student_id}
    Set Test Variable      ${response}

the student will no longer be shown
    ${response_json}     To Json     ${response.content}
    @{status_list}      Get Value From Json     ${response_json}     status
    ${status}      Get From List    ${status_list}  0
    Should Be Equal   ${status}  true
    Should Be Equal As Strings   ${response.status_code}  200

that student data is changed
    [Arguments]     ${name}    ${middle_name}    ${last_name}      ${birth_date}
    ${data}    Create Dictionary    ${FIELD_ID}=${student_id}    ${FIELD_FIRT_NAME}=${name}
    ...     ${FIELD_MIDDLE_NAME}=${middle_name}     ${FIELD_LAST_NAME}=${last_name}     ${FIELD_BIRTH_DATE}=${birth_date}
    ${response}     Put Request    GET_SESSION     api/studentsDetails/${student_id}    data=${data}    headers=${HEADERS}
    Should Be Equal As Strings   ${response.status_code}  200

the student is searched again
    ${response}     Get Request    GET_SESSION     api/studentsDetails/${student_id}
    Set Test Variable      ${response}
