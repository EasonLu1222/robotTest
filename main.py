from appium import webdriver
import time
import os




desired_caps = {}  # 空字典 需要給予測試手機相關資訊
desired_caps['platformName'] = 'Android'  # 測試的平台
desired_caps['platformVersion'] = '11.0'  # 手機os版本
desired_caps['deviceName'] = 'PNXGAP3882500122'  # 看你手機的名稱是什麼
driver = webdriver.Remote('http://localhost:4723/wd/hub', desired_caps)
print("driver",driver)


def click_test_app():
    space_btn_ele = driver.find_element_by_id('com.android.launcher3:id/Space')
    print("negative_btn_ele",space_btn_ele)

#click_test_app()