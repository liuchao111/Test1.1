# -*- coding: UTF-8 -*-
from urllib import request
from urllib import parse
import json


if __name__ == "__main__":
    while True:
        content = input('请输入要查询的英文按(1)退出: ')
        if content == '1':
            break
        Request_URL = 'http://fanyi.youdao.com/translate?smartresult=dict&smartresult=rule'
        form_data = {'to': 'AUTO', 'from': 'AUTO', 'i': content, 'doctype': 'json', 'version': '2.1',
                     'smartresult': 'dict', 'keyfrom': 'fanyi.web', 'client': 'fanyideskweb', 'action': 'FY_BY_REALTIME',
                     'typoResult': 'false'}
        data = parse.urlencode(form_data).encode('utf-8')
        response = request.urlopen(Request_URL, data)
        html = response.read().decode('utf-8')
        translate_results = json.loads(html)
        translate_results = translate_results['translateResult'][0][0]['tgt']
        print("翻译结果就是\n%s" % translate_results)
