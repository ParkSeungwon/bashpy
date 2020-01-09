#!/usr/bin/python3

from selenium import webdriver
from bs4 import BeautifulSoup
import re, time

drv = webdriver.PhantomJS()
drv.get("https://ccei.creativekorea.or.kr/custom/notice_list.do")
time.sleep(5)
soup = BeautifulSoup(drv.page_source, 'lxml')
for a in soup.find_all('tr'):
    if(re.compile('입주').findall(a.text)):
        print(a.text)
