*** Settings ***
Library    SeleniumLibrary
Resource   ./locators/profiles.resource

*** Variables ***
${ENV}        uat
${BROWSER}    chrome
${URL}        https://opensource-demo.orangehrmlive.com/web/index.php/dashboard/index
${USERNAME}   Admin
${PASSWORD}   admin123

${USERNAME_INPUT}    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input
${PASSWORD_INPUT}    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[2]/div/div[2]/input
${LOGIN_BUTTON}      //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

# Search  and Assert Employee Profiles
@{EMPLOYEE_IDS}    E10158808
@{JOB_TITLES}      CEO
@{SUB_UNITS}       Administration

*** Test Cases ***
Search Employee Profiles and Assert Results
    [Documentation]    Searches for employee profiles and asserts the results.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    ${USERNAME_INPUT}  10s
    Input Text    ${USERNAME_INPUT}    ${USERNAME}
    Wait Until Page Contains Element    ${PASSWORD_INPUT}  10s
    Input Text    ${PASSWORD_INPUT}    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains Element    ${PIM}  10s
    Click Element    ${PIM}
    Wait Until Page Contains Element    ${Employee_ID_PIM}  10s
    Input Text    ${Employee_ID_PIM}    ${EMPLOYEE_IDS}[0]
    Click Element    ${Search_Button_PIM}
    
    ${employee_id} =    Get Text    ${Employee_ID_PIM}
                                    
    [Teardown]    Close Browser
