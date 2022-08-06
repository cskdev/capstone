from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.options import Options

import logging
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from webdriver_manager.firefox import GeckoDriverManager

try:
    options = Options()
    options.headless = True
    driver = webdriver.Chrome(executable_path=ChromeDriverManager().install(),chrome_options=options)
    #driver = webdriver.Firefox(executable_path=GeckoDriverManager().install())
    driver.get("http://192.168.56.102:8087/capstone/create_order.jsp")
    logging.info("Opening Webpage")
    assert "order" in driver.title
    name = driver.find_element_by_id("name")
    name.send_keys("synthetic script")
    email = driver.find_element_by_id("email")
    email.send_keys("synthetic@test.com")
    contact = driver.find_element_by_id("Contact")
    contact.send_keys("1234567890")
    address = driver.find_element_by_id("address")
    address.send_keys("Palasa Sasanam")
    brand = driver.find_element_by_id("brand")
    brand.send_keys("bisleri")
    quantity = driver.find_element_by_id("quantity")
    quantity.send_keys("1")
    submit = driver.find_element_by_name("btn_order")
    submit.click()
    element = driver.find_element_by_class_name("form-title-row")
    #to close the browser
    
    if "Order has been placed successfully...!" in element.text :
        print (element.text)
    else : 
        raise Exception("failed to place the order") 

    driver.close()  

except (Exception, ArithmeticError) as e:
    template = "An exception of type {0} occurred. Arguments:\n{1!r}"
    message = template.format(type(e).__name__, e.args)
    print (message)
