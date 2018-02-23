# 开启Secure Communication之后的配置

如果开启了Secure Communication，那么需要在客户端配置环境变量才可以使用，如果要使用一些命令，例如在服务端或者Command line utilities时，也需要配置环境变量才能使用。



## INFA\_TRUSTSTORE

* 默认的路径是服务器上的`$INFA\_HOME/services/shared/security`

* 如果没有使用Informatica默认的选项，那么需要指定自己所定义的目录

* 在客户端或者Command line utilities的机器上，需要将服务器上`$INFA\_HOME/services/shared/security/infa\_truststore.jks`  和`$INFA\_HOME/services/shared/security/infa\_truststore.pem` 两个文件下载到默认目录《Client安装目录》\clients\shared\security或者自定义目录，例如c:\\security\\infa10.2.0

* 在windows用户下或者Command line utilities的用户下设置**INFA_TRUSTSTORE**为第三步下载文件的目录，例如，第三步自定义目录：c:\\security\\infa10.2.0

## INFA\_TRUSTSTORE\_PASSWORD

> 如果是使用Informatica默认的选项，那么此参数不用设置。

* 使用pmpasswd工具加密原始的truststore 密码
```shell
$INFA_HOME/server/bin/pmpasswd 《truststore_password》 -e CRYPT_SYSTEM
```
* 设置 **INFA\_TRUSTSTORE\_PASSWORD**为上一步加密之后的密码

## 重启客户端让环境变量生效
 



