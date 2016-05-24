#基础操作
##权限
讲个笑话，有天，我使用Administrator用户登录Windows，结果在删除一个垃圾文件时提示，请使用Administrator删除。:grinning:

现实生活中，学校一般有三个通道，教职工专有通道，外来人员通道和应急通道。一般来说，应急通道是关闭的，外来人员通道是需要检查的，而教职工专有通道是专门为教职工设置的，其它人都不能通过。

Linux也是类似的，最基础的权限是由三个部分组成：用户权限，组权限和其他人权限。和上面三个通道是对应的。

举个例子：
```bash
[root@infa100 ~]# ll install.log
-rwxr--r--. 1 root root 26583 May 22 11:40 install.log
```
将其对应下面的表格：

|类型|用户权限|组权限|其他人权限|用户名|组名|大小|修改时间|文件名| 
|-- |   --   | --  | --      | --  | -- | -- |--     |--  |
| - | rwx  | r-  | r-        | root|root| 26583| May 22 11:40|install.log|

类型的**-**表示这是一个常规文件。例如**d**表示是个目录。

每个权限又由三个字母组成，加一个没有权限的-组成

|中文:|读|写|执行|无权限|
|--|--|--|--|--|
|字母:|r|w|x|-|
|数字:|4|2|1|0|

所以用户权限就有读写执行。而这个文件的组权限就只有一个读权限，没有写权限和执行权限，所以用**-**表示。

当然了，你用数字表示权限，也是可以的。例如这个文件的用户权限，可以写成7.

###修改权限
######权限 
**chmod**

例如我这里使用数字的形式来改变这个文件的权限，使之用户权限为读写(6)，组为读(4)，没有其它权限(0)。
```bash
[root@infa100 ~]# chmod 640 install.log
[root@infa100 ~]# ll install.log
-rw-r-----. 1 root root 26583 May 22 11:40 install.log
```
######改变用户和组
**chown**

请看下面用户与组#目录##目录的拥有者和组

##用户与组
###创建组
这里创建infa这个组并不是必须的，不过在接触越来越多的**INFA**产品后，很有必要把他们加入到同一个组，这只是一个很好的管理方式而已。
```bash
[root@infa100 ~]# groupadd infa
```
###创建用户
因为我要安装的是**PowerCenter 961**，所以我这里创建了一个用户pwc961，同时加入到组infa中。
```bash
[root@infa100 ~]# useradd -G infa -g infa pwc961
```
###查看用户属性
```bash
[root@infa100 ~]# id pwc961
uid=500(pwc961) gid=501(infa) groups=501(infa)
```

##目录
一般来说，软件都没有指定要安装在哪个目录，不过在Linux上，每个根目录，都有其特定的含义。这里我们需要安装到/opt目录，当然，你也可以安装在/home目录下。不过/opt目录好像更规范一点。

###新建目录
mkdir命令是新建目录的，其中_-p_参数意思是如果父目录不存在，它就创建。
```bash
[root@infa100 ~]# cd /opt/
[root@infa100 opt]# ls
[root@infa100 opt]# mkdir -p /opt/infa/pwc/961
```
###目录的拥有者和组
目录的拥有者(Owner)和其组(Group)控制着这个目录的权限，这个很重要。
其中_R_参数意思是递归或者批量的意思。
``` bash
[root@infa100 opt]# chown -R pwc961.infa /opt/infa
```
###查看目录属性
```bash
[root@infa100 opt]# ll /opt/infa/
total 4
drwxr-xr-x. 3 pwc961 infa 4096 May 22 13:37 pwc
[root@infa100 opt]# 
```
