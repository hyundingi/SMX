from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import time
import requests
import random
from bs4 import BeautifulSoup
from selenium.webdriver.chrome.options import Options
import pyautogui
import csv
# email 발송관련
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.application import MIMEApplication


smtpName = 'smtp.naver.com'
smtpPort = 587


# id, pw, 받는사람이메일주소
sendEmail = 'qo0723@naver.com'
pw = '1111'
recvEmail = 'bhj0723@gmail.com'

title = '제목 : 파이썬 이메일보내기 안내2'
content = '파일을 첨부합니다. '
msg = MIMEMultipart()
msg['Subject'] = title
msg['From'] = sendEmail
msg['To'] = recvEmail
msg.attach(MIMEText(content))

# 파일첨부
with open('c1025/nshop.csv','rb') as f:
  attachment = MIMEApplication(f.read())   # 파일 첨부
  attachment.add_header('Content-Disposition', 'attachment', filename='nshop.csv')
  msg.attach(attachment)

s = smtplib.SMTP(smtpName, smtpPort)
s.starttls()   # 보안 인증
s.login(sendEmail,pw)
s.sendmail(sendEmail,recvEmail,msg.as_string())
print('msg : ')
print(msg.as_string)
s.quit()

print('메일발송완료')