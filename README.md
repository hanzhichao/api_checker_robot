 ## 特性
 1. 采用Robot Framework编写的接口测试框架
 2. 使用json文件存储api接口格式
 3. 内置绿化Python27环境,IDE和Run
 修改/env/win/Python27/Lib/site-packages/robotide/contrib/testrunner/runprofiles.py
```
 def get_command(self):
        python_path = os.sep.join(os.path.dirname(__file__).split(os.sep)[:-5])
        return os.path.join(python_path, "Scripts", "pybot.bat") if os.name == "nt" \
            else os.path.join(python_path, "Scripts", "pybot")
        # return "pybot.bat" if os.name == "nt" else "pybot"
```

修改/env/win/Python27/Scrips/*.bat的python路径为相对路径 %~dp0/../