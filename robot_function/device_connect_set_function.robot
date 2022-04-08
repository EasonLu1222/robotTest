*** Settings ***
Library           AppiumLibrary
Library           Collections
Library           ../../../library/pylibs/pythonLibraryFunction.py



*** Variables ***
${ID_ATTR}        id
${PORT_ATTR}      appium_port
${OS_ATTR}        os
${DEVICE_NAME_ATTR}    device_name


*** Keywords ***
Get Android Device
    ${PORT}    Get Android Device Value From Set    appium_port
    ${ID}    Get Android Device Value From Set    id
    [Return]    ${PORT}  ${ID}

