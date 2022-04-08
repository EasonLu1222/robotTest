*** Settings ***
Library            AppiumLibrary
Library            Collections
Library            ../../../library/pylibs/pythonLibraryFunction.py
Resource           ../../../../robot_function/device_connect_set_function.robot
Resource           ../../../../robot_function/open_application_function.robot
Resource           ../../../../robot_function/front_page_logo_wait.robot
Resource           ../../../../robot_function/get_Account_Info_function.robot



*** Variables ***
${ACCOUNT_ID}     1
${REGION}
${BRAND}
${LOGIN_ACCOUNT}
${LOGIN_PASSWORD}
${PIN}


*** Test Cases ***
Test Case 1
     ${region}    ${brand}    ${login_account}    ${login_password}    ${pin}    Get Account Info    ${ACCOUNT_ID}

Test Case 2
    Get Android Device

