*** Settings ***
Library    SeleniumLibrary
Resource   ./locators/profiles.resource
Variables   ./variables/variables.yaml

*** Variables ***
${ENV}        uat
${BROWSER}    chrome

# Search  and Assert Employee Profiles
@{EMPLOYEE_IDS}    E10158808
@{JOB_TITLES}      CEO
@{SUB_UNITS}       Administration

*** Test Cases ***
Search Employee Profiles and Assert Results
    [Documentation]    Searches for employee profiles and asserts the results.
    Open Browser    ${utm}[${ENV}][url]    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${USERNAME_INPUT}  10s
    Input Text    ${USERNAME_INPUT}    ${utm}[${ENV}][username]
    Wait Until Page Contains Element    ${PASSWORD_INPUT}  10s
    Input Text    ${PASSWORD_INPUT}    ${utm}[${ENV}][password]
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${PIM}  10s
    Click Element    ${PIM}
    Wait Until Page Contains Element    ${Employee_ID_PIM}  10s
    Input Text    ${Employee_ID_PIM}    ${EMPLOYEE_IDS}[0]
    Click Element    ${Search_Button_PIM}
    
    ${employee_id} =    Get Text    ${Employee_ID_PIM}
                                    
    [Teardown]    Close Browser
