#!/usr/bin/python3
#LG uplus movie schedule crawler
#if any argument is present, then this get schedule of tomorrow
from selenium import webdriver
import time, re, sys

drv = webdriver.PhantomJS()
drv.get("https://www.uplus.co.kr/css/chgi/chgi/RetrieveTvContentsMFamily.hpi")
drv.find_element_by_id('3').click() #영화
time.sleep(1)

for i in [101, 103, 104, 105, 106, 107, 108, 109]:
    el = drv.find_element_by_id(str(i))
    print('\n', el.text)
    el.click()
    time.sleep(1)
    if len(sys.argv) != 1: 
        drv.find_element_by_class_name('next').click()
        time.sleep(1)
    html = drv.find_element_by_css_selector('table').get_attribute('innerHTML')
    regex = re.compile('<td class="txtC">(\S+)</td>\s*<td class="txtL">(.+)\n')
    for j in regex.findall(html): print (j[0], j[1])

