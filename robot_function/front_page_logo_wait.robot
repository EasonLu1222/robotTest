*** Settings ***
Library           AppiumLibrary
Library           ../../../library/pylibs/pythonLibraryFunction.py
Resource          device_connect_set_function.robot
Resource          open_application_function.robot

*** Variables ***
${LOGO_ID}        com.stellantis.space:id/logoPicto
${STAGE_MOCK_CLASS}    android.widget.CompoundButton
${STAGE_MOCK_TEXT}    MOCK
${STAGE_PREPROD_CLASS}    android.widget.CompoundButton
${STAGE_PREPROD_TEXT}    PREPROD
${STAGE_PROD_CLASS}    android.widget.CompoundButton
${STAGE_PROD_TEXT}    PROD
${NONE_CLASS}     android.widget.CompoundButton
${NONE_TEXT}      NONE
${EMEA_CLASS}     android.widget.CompoundButton
${EMEA_TEXT}      EMEA
${NAFTA_CLASS}    android.widget.CompoundButton
${NAFTA_TEXT}     NAFTA
${LATAM_CLASS}    android.widget.CompoundButton
${LATAM_TEXT}     LATAM
${APP_CLASS}      android.widget.CompoundButton
${APP_TEXT}       APP
${THEME_CLASS}    android.widget.CompoundButton
${THEME_TEXT}     THEME
${BRAND_IMAGE_CLASS}    android.widget.ImageView



*** Keywords ***
SpaceApp.FrontPage.Wait until page has been loaded
    Wait Until Page Contains Element    id=${LOGO_ID}    timeout=30s



SpaceApp.FrontPage.Choose_region
    [Arguments]    ${region}
    SpaceApp.FrontPage.Toggle_region    ${region}

SpaceApp.FrontPage.Toggle_region
    [Arguments]    ${region}
    Run Keyword If    '${region}'=='EMEA'    SpaceApp.FrontPage.Toggle_EMEA
    Run Keyword If    '${region}'=='NAFTA'    SpaceApp.FrontPage.Toggle_NAFTA
    Run Keyword If    '${region}'=='LATAM'    SpaceApp.FrontPage.Toggle_LATAM

SpaceApp.FrontPage.Toggle_EMEA
    wait until element is visible    id=${LOGO_ID}
    ${mock}    Find Locator By Class Name And Text    ${EMEA_CLASS}    ${EMEA_TEXT}
    Click element    ${mock}

SpaceApp.FrontPage.Toggle_NAFTA
    wait until element is visible    id=${LOGO_ID}
    ${mock}    Find Locator By Class Name And Text    ${NAFTA_CLASS}    ${NAFTA_TEXT}
    Click element    ${mock}

SpaceApp.FrontPage.Toggle_LATAM
    wait until element is visible    id=${LOGO_ID}
    ${mock}    Find Locator By Class Name And Text    ${LATAM_CLASS}    ${LATAM_TEXT}
    Click element    ${mock}



SpaceApp.FrontPage.Choose_brand
    [Arguments]    ${brandName}
    SpaceApp.FrontPage.Toggle_preprod
    SpaceApp.FrontPage.Click_brand_image    ${brandName}

SpaceApp.FrontPage.Toggle_preprod
    wait until element is visible    id=${LOGO_ID}
    ${mock}    Find Locator By Class Name And Text    ${STAGE_PREPROD_CLASS}    ${STAGE_PREPROD_TEXT}
    Click element    ${mock}

SpaceApp.FrontPage.Click_brand_image
    [Arguments]    ${brandName}
    wait until element is visible    id=${LOGO_ID}
    ${brand_image_index}    Get brand image index    ${brandName}
    ${brand_image}    Find Locator By Class Name And Index    ${BRAND_IMAGE_CLASS}    ${brand_image_index}
    Run Keyword If    '${brand_image}'=='${NONE}'    swipe brand view bottom to up
    ${brand_image_index}    Run Keyword If    '${brand_image}'=='${NONE}'    Evaluate    ${brand_image_index} - 6
    ...    ELSE    Evaluate    '${brand_image_index}'
    ${brand_image}    Find Locator By Class Name And Index    ${BRAND_IMAGE_CLASS}    ${brand_image_index}
    Click element    ${brand_image}



SpaceApp.FrontPage.Toggle_mock
    wait until element is visible    id=${LOGO_ID}
    ${mock}    Find Locator By Class Name And Text    ${STAGE_MOCK_CLASS}    ${STAGE_MOCK_TEXT}
    Click element    ${mock}



SpaceApp.BrandPage.Toggle_prod
    wait until element is visible    id=${LOGO_ID}
    ${mock}    Find Locator By Class Name And Text    ${STAGE_PROD_CLASS}    ${STAGE_PROD_TEXT}
    Click element    ${mock}

