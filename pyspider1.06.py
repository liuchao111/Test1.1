# -*- coding: utf-8 -*-
from urllib import request
from bs4 import BeautifulSoup
import requests
import time
import sys


if __import__(name="__main__"):
    target_url = 'http://www.biqukan.com/1_1094/'
    filetxt = open('一念永恒123.txt', 'w', encoding='utf-8')
    head = {'User-Agent': 'Mozilla/5.0(Windows NT 10.0;WOW64; rv:61.0)Gecko/20100101 Firefox/61'}
    target_req = request.Request(url=target_url, headers=head)
    target_response = request.urlopen(target_req)
    target_html = target_response.read().decode('gbk', 'ignore')
    listmain_soup = BeautifulSoup(target_html, 'lxml')
    chapters = listmain_soup.find_all('div', class_='listmain')
    download_soup = BeautifulSoup(str(chapters), 'lxml')
    numbers = (len(download_soup.dl.contents) - 1) / 2 - 8
    begin_flag = False
    index = 1
    print("《一念永恒》开始下载:")
    for child in download_soup.dl.children:
        if child != '\n':
            if child.string == u"《一念永恒》正文卷":
                begin_flag = True
            if begin_flag is True and child.a is not None:
                download_url = "http://biqukan.com" + child.a.get('href')
                download_name = child.string
                filetxt.write(download_name+download_url+'\n')
                req = requests.get(url=download_url)
                html = req.text
                bf = BeautifulSoup(html, 'lxml')
                texts = bf.find_all('div', class_='showtxt')
                text1 = texts[0].text.replace('\xa0'*8, '\n\n')
                filetxt.write(text1)
                filetxt.write('\n\n')
                sys.stdout.write("已下载: %.3f%%" % float(index/numbers)+'\r')
                sys.stdout.flush()
                index +=1
print("下载完成!!!!!")
filetxt.close()
print("运行时间是: %s" % time.clock())