*** Settings ***
Documentation    Suite API Tests
Resource  ../Resource/keywords.robot
Suite Setup  Create api session

*** Variables ***
${NAME}           Vanessa
${MIDDLE_NAME}    X
${LAST_NAME}      R
${BIRTH_DATE}     11/04/1986

*** Test Cases ***
List of students
    Given it is called the student list function
    Then a list will be returned containing all registered students

Include student
    Given that the student data for the system is informed
    ...     ${NAME}   ${MIDDLE_NAME}      ${LAST_NAME}    ${BIRTH_DATE}
    Then the system returns that it was successfully added

Student detail
    Given the last registered student is consulted
    Then the name must be shown     ${NAME}
    And the middle name must be shown     ${MIDDLE_NAME}
    And the last name must be shown     ${LAST_NAME}
    And the date of birth must be shown     ${BIRTH_DATE}

Change student data
    Given that student data is changed
    ...     Alessandra      B       ${LAST_NAME}    ${BIRTH_DATE}
    When the student is searched again
    Then the name must be shown     Alessandra
    And the middle name must be shown     B
    And the last name must be shown     ${LAST_NAME}
    And the date of birth must be shown     ${BIRTH_DATE}

Delete student from list
    Given the student will be deleted from the list
    Then the student will no longer be shown