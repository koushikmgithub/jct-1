@echo on

FOR /F "tokens=1,2 delims==" %%G IN (serverStatus.properties) DO (set %%G=%%H)
set CATALINA_HOME=E:\apache-tomcat-7.0.50
set JAVA_HOME=C:\Program Files (x86)\Java\jre7
netstat -na | find "LISTENING" | find /C /I ":8080" > NUL
if %errorlevel%==0 goto :running

:gotorun
echo %errorlevel% %ant.server.status8080% tomcat is not running................................... 
if %ant.server.status8080%==True goto :start



:running

echo tomcat is Running...........%errorlevel%........................
goto :eof

:start
call E:\apache-tomcat-7.0.50\bin\startup.bat

echo tomcat is running
goto :eof

:eof