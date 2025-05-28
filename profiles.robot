*** Settings ***
Library    SeleniumLibrary
Resource   ./locators/profiles.resource
Variables   ./variables/variables.yaml

*** Variables ***
${ENV}        uat
${BROWSER}    chrome

# Search  and Assert Employee Profiles
@{EMPLOYEE_IDS}    0312    0360    0367
# @{JOB_TITLES}      CEO
# @{SUB_UNITS}       Administration

*** Test Cases ***
Search and Assert Employee profiles
    Open Browser And Login
    FOR   ${emp_id}    IN    @{EMPLOYEE_IDS}
        Get All Employee Profiles    ${emp_id}
    END
    [Teardown]    Close All Browsers

*** Keywords ***
Open Browser And Login
    Open Browser    ${utm}[${ENV}][url]    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${USERNAME_INPUT}  10s
    Input Text    ${USERNAME_INPUT}    ${utm}[${ENV}][username]
    Wait Until Page Contains Element    ${PASSWORD_INPUT}  10s
    Input Text    ${PASSWORD_INPUT}    ${utm}[${ENV}][password]
    Click Button    ${LOGIN_BUTTON}

Get All Employee Profiles
    [Documentation]    Retrieves all employee IDs from the PIM section.
    Wait Until Page Contains Element    ${PIM}  10s
    Click Element    ${PIM}

    [Arguments]    ${employee_id}
    Wait Until Page Contains Element    ${Employee_ID_PIM}  10s
    Input Text    ${Employee_ID_PIM}    ${employee_id}
    Click Element    ${Search_Button_PIM}
    Wait Until Element Is Visible   ${Result_Employee}  10s
    ${result} =    Get WebElements    ${Result_Employee}
    Click Element At Coordinates  ${Result_Employee}  0  0
