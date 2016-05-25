#Cloud FAQ

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

