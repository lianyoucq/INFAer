# 第三方驱动安装与配置-MySQL

 `PowerCenter`自带的驱动是`DataDirect`提供的，有些驱动是没有的，而且也有一些限制，例如`MySQL Enterprise`不支持。这里就以`MySQL Community`为例
 > 简明的步骤
 > 1. 下载Server和Client对应的ODBC驱动，并安装
 > 2. 安装UnixODBC
 > 3. 在Linux环境下使用ldd命令验证库的完整性
 > 4. PowerCenter用户下ODBCINI文件里配置DSN信息
 > 5. 使用isql（UnixODBC自带的工具）或者ssgodbc（PowerCenter自带的工具）测试DSN

 >> 注意：
 > 如果使用第三方驱动，将无法得到`Informatica`技术支持
 
 
## 准备驱动
[MySQL ODBC 下载链接](https://dev.mysql.com/downloads/connector/odbc/)

### 下载`MySQL ODBC Driver` - `PowerCenter Server`
![](/assets/MySQL_ODBC_Linux.png)

### 下载`MySQL ODBC Driver` - `PowerCenter Client`
![](/assets/MySQL_ODBC_Client.png)


> 注意
> `PowerCenter Server` 使用的是64位驱动，`Client`使用的是32位驱动


## 安装驱动
在`Widnows`上安装直接一步步安装就可以了，这里就着重讲讲在`PowerCenter` Server 上安装驱动

> 注意:
> 在`PowerCenter` Server 上安装驱动之前，需要安装unixODBC

### 安装unixODBC
```shell
yum install -y unixODBC
```

### `PowerCenter Server`
将下载的驱动上传到服务器上，解压，然后将驱动库放到目录$INFA_HOME/ODBC<VERSION>/lib目录

```shell
[pwc102@infa210 lib]$ ls
libmyodbc5a.so  libmyodbc5S.so  libmyodbc5w.so
[pwc102@infa210 lib]$ pwd
/home/pwc102/mysql-connector-odbc-5.3.9-linux-el6-x86-64bit/lib
[pwc102@infa210 lib]$ ls
libmyodbc5a.so  libmyodbc5S.so  libmyodbc5w.so
[pwc102@infa210 lib]$ cp * /opt/infa/pwc/1020/ODBC7.1/
bin/              help/             locale/           ODBC64FIXES.TXT   odbc.csh          odbc.ini          odbc.sh           
DDDW.LIC          lib/              NOTICES.TXT       ODBC64README.TXT  .odbc.ini         odbcinst.ini      tools/            
[pwc102@infa210 lib]$ cp * $INFA_HOME/ODBC7.1/lib/
```

### 检查驱动的依赖库
```shell
ldd libmyodbc5w.so 
ldd libmyodbc5a.so
```
例如：
```shell
[pwc102@infa210 lib]$ ldd libmyodbc5w.so 
	linux-vdso.so.1 =>  (0x00007fff7b707000)
	libodbcinst.so.2 => /usr/lib64/libodbcinst.so.2 (0x00007feee89b4000)
	libpthread.so.0 => /lib64/libpthread.so.0 (0x00007feee8796000)
	librt.so.1 => /lib64/librt.so.1 (0x00007feee858e000)
	libdl.so.2 => /lib64/libdl.so.2 (0x00007feee838a000)
	libz.so.1 => /lib64/libz.so.1 (0x00007feee8173000)
	libm.so.6 => /lib64/libm.so.6 (0x00007feee7eef000)
	libstdc++.so.6 => /usr/lib64/libstdc++.so.6 (0x00007feee7be9000)
	libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007feee79d2000)
	libc.so.6 => /lib64/libc.so.6 (0x00007feee763e000)
	libltdl.so.7 => /usr/lib64/libltdl.so.7 (0x00007feee7435000)
	/lib64/ld-linux-x86-64.so.2 (0x00000033bf800000)
[pwc102@infa210 lib]$ ldd libmyodbc5a.so 
	linux-vdso.so.1 =>  (0x00007ffcd835c000)
	libodbcinst.so.2 => /usr/lib64/libodbcinst.so.2 (0x00007f2172f60000)
	libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f2172d42000)
	librt.so.1 => /lib64/librt.so.1 (0x00007f2172b3a000)
	libdl.so.2 => /lib64/libdl.so.2 (0x00007f2172936000)
	libz.so.1 => /lib64/libz.so.1 (0x00007f217271f000)
	libm.so.6 => /lib64/libm.so.6 (0x00007f217249b000)
	libstdc++.so.6 => /usr/lib64/libstdc++.so.6 (0x00007f2172195000)
	libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007f2171f7e000)
	libc.so.6 => /lib64/libc.so.6 (0x00007f2171bea000)
	libltdl.so.7 => /usr/lib64/libltdl.so.7 (0x00007f21719e1000)
	/lib64/ld-linux-x86-64.so.2 (0x00000033bf800000)

```
如果里面有一些库没有找到，有可能是没有安装或者没有配置好**LD_LIBRARY_PATH**环境变量就会解决问题。
配置好之后，再次执行上面的命令测试就行了。

### 配置`ODBCINI`
> 注意：
> 需要在环境变量里配置`ODBCINI`环境变量,
> 例如在Bash shell下设置ODBCINI环境变量:
>> export ODBCINI=$INFA_HOME/ODBC7.1/odbc.ini

```shell
[mysql_test]
Driver=/opt/infa/pwc/1020/ODBC7.1/lib/libmyodbc5w.so
DATABASE=test
DESCRIPTION=MySQL ODBC Connector Test
SERVER=infa210.sleety.com
UID=root
DriverUnicodeType=1
PASSWORD=
PORT=3306
```
具体的选项请参考官网

### 测试DNS
#### `isql`
```shell
isql <DSN> <USER> <PASSWORD> -v
```
例如：
```shell
[pwc102@infa210 ~]$ isql mysql_test root infa -v
+---------------------------------------+
| Connected!                            |
|                                       |
| sql-statement                         |
| help [tablename]                      |
| quit                                  |
|                                       |
+---------------------------------------+
SQL> 
```

#### ```PowerCenter```自带工具`ssgodbc`
```shell
$INFA_HOME/tools/debugtools/ssgodbc/linux64/ssgodbc.linux64 -d <DSN> -u <USER> -p <PASSWORD> -v
```
例如：
```shell
[pwc102@infa210 ~]$ $INFA_HOME/tools/debugtools/ssgodbc/linux64/ssgodbc.linux64  -d mysql_test -u root -p infa -v
Connected
ODBC version        = -03.52.0000-
DBMS name           = -MySQL-
DBMS version        = -5.5.58-MariaDB-wsrep-
Driver name         = -libmyodbc5w.so-
Driver version      = -05.03.0009-
Driver ODBC version = -03.00-

Enter SQL string: 
```



