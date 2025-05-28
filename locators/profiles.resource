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