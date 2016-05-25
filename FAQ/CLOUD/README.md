h#Cloud FAQ

##Salesforce
###Q
######Key Words: API_DISABLED_FOR_ORG

```
The test connection failed because of the following error: for SFDC_WALKINGNINE.[UnexpectedErrorFault [ApiFault exceptionCode='API_DISABLED_FOR_ORG' exceptionMessage='API is not enabled for this Organization or Partner' ] ] .
```
![SFDC Connection Error](SFDC_Connection_Error.jpg)

###A
将Service URL从https://login.salesforce.com/services/Soap/u/34.0 改成https://login.salesforce.com/services/Soap/u/31.0 解决问题

![SFDC Connection Successful](SFDC_Connection_successful.jpg)


##MySQL JDBC
###Q
######Key Words: MySQL JDBC
Jar包已经上传到了指定目录中，在使用MySQL JDBC连接时，出现如下错误。

![MySQL JDBC Connection faiulre](Cloud_JDBC_CONNECTION_Error.jpg)

###A
这种问题可能是Jar包的版本与MySQL数据库的版本不一致导致的。
```sql
mysql> select version();
+-----------+
| version() |
+-----------+
| 5.1.73    |
+-----------+
1 row in set (0.01 sec)
```

而数据库jar包的版本还是mysql-connector-java-5.0.8-bin.jar。

所以重新下载对应的版本的jar文件即可。例如mysql-connector-java-5.1.39-bin.jar

然后在重新测试一下。成功。

