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

## 开启Node的Secure Communication
### GatewayNode
```shell
$INFA_HOME/isp/bin/infasetup.sh updategatewaynode -tls true
```

### WorkerNode
```shell
$INFA_HOME/isp/bin/infasetup.sh updateworkernode -tls true
```

## 开启Administrator Console的Secure Communication
### GatewayNode
```shell
$INFA_HOME/isp/bin/infasetup.sh updategatewaynode -hs 8443 -kf $INFA_HOME/tomcat/conf/Default.keystore
```

### WorkerNode
```shell
$INFA_HOME/isp/bin/infasetup.sh updateworkernode -hs 8443 -kf $INFA_HOME/tomcat/conf/Default.keystore
```


当然开启Node和Administrator Console的Secure Communication步骤可以一步执行。


## 