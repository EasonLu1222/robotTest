*** Settings ***
Library            AppiumLibrary
Library            ../../../library/pylibs/pythonLibraryFunction.py


*** Keywords ***
Get Account Info
    [Arguments]    ${ACCOUNT_ID}
    ${REGION}    Get Account Attribute Value From Id    ${ACCOUNT_ID}    region
    ${BRAND}    Get Account Attribute Value From Id    ${ACCOUNT_ID}    brand
    ${ACCOUNT}    Get Account Attribute Value From Id    ${ACCOUNT_ID}    account
    ${PASSWORD}    Get Account Attribute Value From Id    ${ACCOUNT_ID}    password
    ${PIN}    Get Account Attribute Value From Id    ${ACCOUNT_ID}    pin
    [Return]    ${REGION}    ${BRAND}    ${ACCOUNT}    ${PASSWORD}    ${PIN}
