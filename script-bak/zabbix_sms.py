#!/usr/bin/env python
# encoding: utf-8

import sys
import urllib
import urllib2

def sendsms(mobile,content):
    """
    发送短信
    """
    account = 'cf_kuailexue'
    password = '11c0cda8077ffa37179488ef34eaa9b1'

    values = {'account':account,
              'password':password,
              'mobile':mobile,
              'content':content}

    data = urllib.urlencode(values)
    post_url = 'https://106.ihuyi.com/webservice/sms.php?method=Submit'
    try:
        conn = urllib2.urlopen(post_url,data)
        print conn.read()
    except Exception , e:
        print e

if __name__ == '__main__':

    mobile = sys.argv[1]
    content = sys.argv[2]

    sendsms(mobile,content)