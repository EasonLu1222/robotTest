#!/usr/bin/python
# -*- coding: utf-8 -*-

import getpass
from robot.libraries.BuiltIn import BuiltIn
from appium.webdriver.common.appiumby import AppiumBy
from appium.webdriver.common.touch_action import TouchAction


#================================ device_connect_set_function =========================#
def get_variables(config_path):
    import configparser
    config = configparser.ConfigParser()
    config.read(config_path)

    variables = {}
    print(config.sections)
    for section in config.sections():
        for key, value in config.items(section):
            var = "%s.%s" % (section, key)
            variables[var] = value
    return variables


def get_android_device_value_from_set(key):
    USER_PATH = f'C:/Users/{getpass.getuser()}'
    path_all = f"{USER_PATH}" + "\\PycharmProjects\\robotTest\\resources\\shared_device"
    shared_device = get_variables(path_all)
    print(shared_device)
    for each_key, each_value in shared_device.items():
        if "tags" in each_key and 'android' == each_value.lower():
            found_section = each_key.split(".")[0]
            break
    return shared_device[f"{found_section}.{key}"]


#============================= front_page_logo_wait ==================================#
#============================= 控鍵選擇為index ========================================#
def get_brand_image_index(brand_name):
    if brand_name == "PEUGEOT":
        return 1
    elif brand_name == "DS_AUTOMOBILES":
        return 2
    elif brand_name == "CITROEN":
        return 3
    elif brand_name == "OPEL":
        return 4
    elif brand_name == "VAUXHALL":
        return 5
    elif brand_name == "ALFA_REOMEO":
        return 6
    elif brand_name == "FIAT":
        return 7
    elif brand_name == "MASERATI":
        return 8
    elif brand_name == "RAM":
        return 9
    elif brand_name == "JEEP":
        return 10
    elif brand_name == "WAGONEER":
        return 11
    elif brand_name == "DODGE":
        return 12
    elif brand_name == "CHRYSLER":
        return 13
    else:
        return None

#============================= 利用class找到text(綁定為一組) =============================#
def find_locator_by_class_name_and_index(class_name, index):
    """
    index start from 0.

    """
    appiumlib = BuiltIn().get_library_instance("AppiumLibrary")
    driver = appiumlib._current_application()
    el_list = driver.find_elements(by=AppiumBy.CLASS_NAME, value=class_name)
    for _id, _el  in enumerate(el_list):
        if _id == int(index):
            return _el
    return None


#============================= 利用class找到text(綁定為一組) =============================#
def swipe_brand_view_bottom_to_up():
    #BuiltIn 主要提供驗證，轉換等關鍵字，以及其他常用關鍵字,https://www.wrpypl.com/builtin.html
    appiumlib = BuiltIn().get_library_instance("AppiumLibrary")
    print("appiumlib", appiumlib)

    driver = appiumlib._current_application()

    #appium API 之 TouchAction(觸頻操作)，https://zhuanlan.zhihu.com/p/260958917
    TouchAction(driver).long_press(x=535, y=1792).move_to(x=535, y=592).release().perform()
    return True


#============================= 利用id找到resource_id(綁定為一組) =============================#
def find_locator_by_id_and_text(resource_id, text):
    appiumlib = BuiltIn().get_library_instance("AppiumLibrary")
    driver = appiumlib._current_application()
    el_list = driver.find_elements(by=AppiumBy.ID, value=resource_id)
    for _el  in el_list:
        if _el.text == text:
            return _el
    return None


#============================= 利用id and key找到(綁定為一組) =============================#
def get_account_attribute_value_from_id(id, key):
    USER_PATH = f'C:/Users/{getpass.getuser()}'
    path_all = f"{USER_PATH}" + "\\PycharmProjects\\robotTest\\resources\\shared_account"
    shared_device = get_variables(path_all)
    for each_key, each_value in shared_device.items():
        if f"account_{id}.{key}".lower() in each_key.lower():
            found_section = each_key
            break
    return shared_device[found_section]
