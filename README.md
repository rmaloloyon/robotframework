# # 🚀 Robot Framework UI Test Automation

This project uses [Robot Framework](https://robotframework.org/) with the [SeleniumLibrary](https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html) to automate a web scenario:
1. Log in to a web application.
2. Search for specific content.
3. Assert that the expected details are displayed.

---

## 📁 Project Structure
```
.
├── README.md
├── locators
│   └── profiles.resource
├── profiles.robot
├── requirements.txt
├── results
│   ├── log.html
│   ├── output.xml
│   ├── report.html
│   ├── selenium-screenshot-1.png
│   ├── selenium-screenshot-2.png
│   ├── selenium-screenshot-3.png
│   └── selenium-screenshot-4.png
└── variables
    └── variables.yaml
```

## Using Virtual Environment
```

---

## 🔧 Prerequisites

- Python 3.7+
- Google Chrome or another supported browser
- WebDriver (e.g., ChromeDriver) installed and in your system PATH
- `pip` for installing Python packages

---

## 📦 Installation

```bash
# Create and activate a virtual environment (optional but recommended)
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

## Requirements
```
robotframework
robotframework-seleniumlibrary
```

## 🚦 How to run the test
```
robot tests/login_search_test.robot
```

## Results
```
==============================================================================
Robotframework
==============================================================================
Robotframework.Profiles
==============================================================================
Search and Assert Employee profiles
DevTools listening on ws://127.0.0.1:61782/devtools/browser/5f1a028c-ca9b-4c4f-be03-c673450bbcdf
WARNING: All log messages before absl::InitializeLog() is called are written to STDERR
I0000 00:00:1749041796.182917    9924 voice_transcription.cc:58] Registering VoiceTranscriptionCapability
.Created TensorFlow Lite XNNPACK delegate for CPU.
Attempting to use a delegate that only supports static-sized tensors with a graph that has dynamic-sized tensors (tensor#58 is a dynamic-sized tensor).
Search and Assert Employee profiles                                   | PASS |
------------------------------------------------------------------------------
Robotframework.Profiles                                               | PASS |
1 test, 1 passed, 0 failed
==============================================================================
Robotframework                                                        | PASS |
1 test, 1 passed, 0 failed
==============================================================================
Output:  .\robotframework\results\output.xml
Log:     .\robotframework\results\log.html
Report:  .\robotframework\results\report.html
```

## Profile Resources
```
*** Variables ***

# Login Credentials
${USERNAME_INPUT}    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input
${PASSWORD_INPUT}    //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[2]/div/div[2]/input
${LOGIN_BUTTON}      //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

# ManagementTab
${PIM}                //*[@id="app"]/div[1]/div[1]/aside/nav/div[2]/ul/li[2]/a/span
${Employee_ID_PIM}    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[2]/div/div[2]/input
${Result_Employee}    //*[@id="app"]/div[1]/div[2]/div[2]/div/div[2]/div[3]/div/div[2]/div/div/div[2]/div
${Job_Title_PIM}      //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[6]/div/div[2]/div/div/div[1]
${Sub_Unit_PIM}       //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[1]/div/div[7]/div/div[2]/div/div/div[1]
${Search_Button_PIM}  //*[@id="app"]/div[1]/div[2]/div[2]/div/div[1]/div[2]/form/div[2]/button[2]
```

## Variable Declarations
```
# Admin Credentials and URL for OrangeHRM
# This file contains the necessary variables for accessing the OrangeHRM application.
utm:
  uat:
    url: https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    username: Admin
    password: admin123
```

## Mail Robot File
### Settings
```
*** Settings ***
Library    SeleniumLibrary
Resource   ./locators/profiles.resource
Variables   ./variables/variables.yaml
```
### Variables
```
*** Variables ***
${ENV}        uat
${BROWSER}    chrome

# Search  and Assert Employee Profiles
@{EMPLOYEE_IDS}    0669    0657    0640
# @{JOB_TITLES}      CEO
# @{SUB_UNITS}       Administration
```
### 🧪 Test Cases
```
*** Test Cases ***
Search and Assert Employee profiles
    Open Browser And Login
    FOR   ${emp_id}    IN    @{EMPLOYEE_IDS}
        Get All Employee Profiles    ${emp_id}
    END
    Reload Page
    [Teardown]    Close All Browsers
```
### 🔑 Keywords
```
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
    [Documentation]    Search for employee profiles by ID and assert the results.
    Wait Until Page Contains Element    ${PIM}  10s
    Click Element    ${PIM}

    [Arguments]    ${employee_id}
    Wait Until Page Contains Element    ${Employee_ID_PIM}  10s
    Input Text    ${Employee_ID_PIM}    ${employee_id}
    Click Element    ${Search_Button_PIM}
    Wait Until Element Is Visible   ${Result_Employee}  10s
    ${result} =    Get WebElements    ${Result_Employee}
    Click Element At Coordinates  ${Result_Employee}  0  0
```

## 🧹 Clean Up
```
rm -rf output.xml log.html report.html results/
```

## ✅ Notes
- Ensure the correct WebDriver version for your browser is installed.
- You can enhance the framework by using variable files, data-driven tests, or CI integration.