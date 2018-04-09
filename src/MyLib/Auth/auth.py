import json
import hashlib
import re

def sha1(str):
    m = hashlib.sha1()
    m.update(str.encode('utf8'))
    return m.hexdigest()

    
class Auth(object):
    def __init__(self):
        pass

    def sign(self, accessId, accessKey, params):
        str = re.sub('[\{\}\"\':, ]','',json.dumps(params, sort_keys=True, ensure_ascii=False)) + accessKey
        sign = sha1(str).upper()
        return [{"appid": accessId, "sign": sign, "auth-type":0}, params]



if __name__ == '__main__':
    a = Auth()
    print(a.sign("station","NTA3ZTU2ZWM5ZmVkYTVmMDBkMDM3YTBi",{'lng':'116.123', 'lat':'93.111'}))
