#DDM换License

##停DDM服务
登录DDM的用户，到DDM的安装目录，停DDM服务
```bash
[ddm@infa210 98]$ server stop # ./stop
```

##备份
到cfg目录，备份过期的License。
```bash
[ddm@infa210 98]$ cd cfg/
[ddm@infa210 cfg]$ mv license.lic license.lic.expired
```

##启用新License
上传license到cfg目录下，修改license的文件名为license.lic

或者直接复制license的内容，放到license.lic下。

##启动DDM服务
```bash
[ddm@infa210 98]$ server start # ./start
```
