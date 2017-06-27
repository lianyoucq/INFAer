# Mercury Platform元数据迁移

同传统的PowerCenter的元数据迁移一样， 如何没有看过的，可以查看
[PowerCenter元数据迁移](../PWC/MigrationA.md)，


演示环境
> Informatica 10.1.1
> 
> BDM 10.1.1
> 
> Cloudera 5.8

简短版
> 导出为XML
> 
> 相同版本之间的导入无障碍
> 
> 不同版本之间的导入需要一些设置
> 
> Mapping/Maplet可以在BDM与PowerCenter之间实现跨版本迁移

## 导出

点击对应的对象，然后右键，在菜单里选择Export，根据不同的对象和要求，可以在后续菜单做操作。

![Export](BDM_EXPORT_1.png)

一般使用最多的就是Export Object Metadata File了，它可以将对应的对象导出为XML文件。

## 相同版本之间的导入

如果PowerCenter BDM版本一样的话，可以直接相互之间导出再导入。


## 从低版本导入到高版本

> 不建议直接通过XML文件方式将低版本导入到高版本，可能会导致数据丢失或者不一致。这里只是提供一种建议。

因为Mercury平台上启动的强验证模式，所以低版本默认是无法导入到高版本。不过有时又需要导入到高版本去，需要做如下修改：

- 调整serializationSpecVersion

|            版本            | serializationSpecVersion | 
| -------------------------- | ------------------------ |
| PowerCenter 9.6.0          | 5.0 |
| PowerCenter 9.6.1          | 6.0 |
| PowerCenter 10.1.0         | 8.0 |
| PowerCenter 10.1.1.X       | 9.0 |

> 这里我列举了我知道的版本。
> 
> PowerCenter 10.1.1.X 值到是 10.1.1，10.1.1Update2或者10.1.1Hotfix1

将导出的XML文件使用文本编辑器打开，找到serializationSpecVersion，将其修改为目标版本号。例如，我从10.1.0升级到10.1.1 Update2版本，就需要将serializationSpecVersion的8.0修改为9.0。

- 关闭CRC验证

此选项需要在Developer客户端的配置文件developerCore.ini文件最后一行添加-DskipCrcValidation=true即可。

例如此文件在我的安装目录里：C:\Informatica\10.1.1\clients\DeveloperClient\developerCore.ini

```java
-vm
..\java\bin\javaw.exe
-vmargs
-Xmx768M
-Xms256M
-Xss512k
-XX:MaxMetaspaceSize=256M
-DINFA_HADOOP_DIST_DIR=hadoop\cloudera_cdh5u8
-DINFA_THIRDPARTY_LIB=.
-Dfile.encoding=UTF-8
-DSSOCredentialRenewalTime=10
-XX:+HeapDumpOnOutOfMemoryError
-DINFA_JDBC_EXTERNAL_JARS=..\externaljdbcjars\*
-DskipCrcValidation=true
```

## BDM与PowerCenter之间迁移

在Developer里可以实现Mapping/Maplet在Mercury和PowerCenter之间跨版本导入或者导出