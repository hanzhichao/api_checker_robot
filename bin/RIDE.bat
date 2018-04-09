@echo off 
if "%1" == "h" goto begin 
mshta vbscript:createobject("wscript.shell").run("%~nx0 h",0)(window.close)&&exit 
:begin 

..\env\win\Python27\pythonw.exe -c "from robotide import main; main()"
