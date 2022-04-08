*** Settings ***
Library           AppiumLibrary
Library           Collections
Library           ../../../library/pylibs/pythonLibraryFunction.py
Resource           device_connect_set_function.robot



*** Variables ***

*** Keywords ***
Connect Open Application
    ${PORT}  ${ID}   Get Android Device
    Open Application    http://localhost:${PORT}/wd/hub    platformName=android    udid=${ID}    appPackage=com.stellantis.space    appActivity=com.stellantis.space.ui.activities.SampleMainActivity
    Sleep    10s




