# -*- coding: UTF-8 -*-
from urllib import request
from urllib import parse
import json


if __name__ == "__main__":
    Request_URL = 'http://fanyi.youdao.com/translate?smartresult=dict&smartresult=rule'
    form_data = {}
    form_data['to'] = 'AUTO'
    form_data['from'] = 'AUTO'
    form_data['i'] = input('请输入要查询的英文: ')
    form_data['doctype'] = 'json'
    form_data['version'] = '2.1'
    form_data['smartresult'] = 'dict'
    form_data['keyfrom'] = 'fanyi.web'
    form_data['client'] = 'fanyideskweb'
    form_data['action'] = 'FY_BY_REALTIME'
    form_data['typoResult'] = 'false'
    data = parse.urlencode(form_data).encode('utf-8')
    response = request.urlopen(Request_URL, data)
    html = response.read().decode('utf-8')
    translate_results = json.loads(html)
    translate_results = translate_results['translateResult'][0][0]['tgt']
    print("翻译结果就是\n%s" % translate_results)
