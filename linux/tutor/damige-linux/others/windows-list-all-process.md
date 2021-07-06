# Windows查看端口占用情况

```bash
# 查看端口22的占用情况
netstat -ano | findstr "22"
# 查看PID对应的进程
tasklist | findstr "7372"
# 结束此进程
taskkill /f /t /im javaw.exe
```
