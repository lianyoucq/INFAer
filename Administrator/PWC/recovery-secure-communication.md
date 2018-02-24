# 恢复Secure Communication

如果在执行[关闭Secure Communication](/Administrator/PWC/disablesecurecommunication.md "关闭Secure Communication")之后又想恢复Secure Communication，可以参考下面的步骤


## 在Domain上开启Secure Communication
> 同关闭一样，也需要在Domain运行状态下执行

* Administrator Console

    Domain &gt; Properties &gt; General Properties &gt; Enable Secure Communication

* Command
```shell
$INFA_HOME/isp/bin/infacmd.sh updatedomainoptions -dn 《Domain_Name》 \
-un 《Administrator》 -pd 《Administrator's Password》-do TLSMode=true
```

## 开启Node和Administrator Console的Secure Communication

```shell
/opt/Informatica/arli1020/isp/bin/infasetup.sh updategatewaynode -tls true -hs 8843 -kf /opt/Informatica/arli1020/tomcat/conf/Default.keystore
```