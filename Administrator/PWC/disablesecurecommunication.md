# 关闭Secure Communication

> Secure Communication 是指TLS或者SSL

## Domain上关闭Secure Communication

有两种方式，均需要在Domain运行状态下执行

* Administrator Console

  Domain &gt; Properties &gt; General Properties &gt; Enable Secure Communication

* Command

  ```shell
    $INFA_HOME/isp/bin/infacmd.sh updatedomainoptions -dn 《Domain_Name》 \
     -un 《Administrator》 -pd 《Administrator's Password》-do TLSMode=false
  ```

## Node上关闭Secure Communication

### Gateway Node

```shell
$INFA_HOME/isp/bin/infasetup.sh updategatewaynode -tls false
```

### Worker Node

```
$INFA_HOME/isp/bin/infasetup.sh updateworkernode -tls false
```

> 注意：
>
> 1. 上面示例中的命令需要在对应的服务器上执行，如果远程执行，需要指定相关节点信息等参数
> 2.  需要在Domain 服务停止状态执行

## Administrator Console关闭Secure Communication

### Gateway Node

```shell
$INFA_HOME/isp/bin/infasetup.sh updategatewaynode -hs 0
```

### Worker Node

```
$INFA_HOME/isp/bin/infasetup.sh updateworkernode -hs 0
```

> 注意：
>
> 1. 上面示例中的命令需要在对应的服务器上执行，如果远程执行，需要指定相关节点信息等参数
>
>     2. 需要在Domain 服务停止状态执行

### 如果此步骤没有执行，那么Administrator Console任然运行着https



