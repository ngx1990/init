#!/usr/bin/python
#coding:utf-8
import smtplib
from email.mime.text import MIMEText
import sys
mail_host = 'smtp.exmail.qq.com'
mail_user = 'admin@kuailexue.com'
mail_pass = 'Klx_12138'
mail_postfix = 'kuailexue.com'
def send_mail(to_list,subject,content):
        me = mail_user+"<"+mail_user+"@"+mail_postfix+">"
        msg = MIMEText(content)
        msg['Subject'] = subject
        msg['From'] = me
        msg['to'] = to_list
        try:
                s = smtplib.SMTP()
                s.connect(mail_host)
                s.login(mail_user,mail_pass)
                s.sendmail(me,to_list,msg.as_string())
                s.close()
                return True
        except Exception,e:
                print str(e)
                return False
#if __name__ == "__main__":
send_mail(sys.argv[1], sys.argv[2], sys.argv[3])