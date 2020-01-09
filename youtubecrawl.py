
# coding: utf-8

# In[29]:


from selenium import webdriver
import time, re, requests
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


# In[30]:


drv = webdriver.Firefox()
drv.get("https://accounts.google.com/signin/v2/identifier?service=youtube&uilel=3&passive=true&continue=https%3A%2F%2Fwww.youtube.com%2Fsignin%3Faction_handle_signin%3Dtrue%26app%3Ddesktop%26hl%3Den%26next%3D%252F&hl=en&ec=65620&flowName=GlifWebSignIn&flowEntry=ServiceLogin")
drv.find_element_by_id('identifierId').send_keys('zezeon1@gmail.com')
drv.find_element_by_id('identifierNext').click()
WebDriverWait(drv, 10).until(EC.presence_of_element_located((By.NAME, "password"))).send_keys('Qwer!234')
drv.find_element_by_id('passwordNext').click()
time.sleep(3)


# In[44]:


j=1
for url in re.compile('<img src="(https://i.ytimg.com/.+)">').findall(drv.page_source): 
    filename = '/tmp/' + str(j) + '.jpg'
    j+=1
    with open(filename, 'wb') as handler:
        handler.write(requests.get(url).content)


# In[ ]:


drv.close()

