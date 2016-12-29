# Install ActiveVOS - Jboss in Linux

##0 Prerequisitions
	
- Download JDK1.7 and install it
- Download activeVOS 9.2.4.2
- Download Jboss 7.1.1.Final
- Download oracle jdbc driver: ojdbc6.jar
- [Quick Start for ActiveVOS Server](http://infocenter.activevos.com/infocenter/ActiveVOS/v92/index.jsp?topic=/doc.server_install/jboss/html/Configuration_wizard.html)

##1 Set environment variables
- JAVA\_HOME
- JAVA\_OPTS="$JAVA_OPTS Xms256m -Xmx1024m -XX:MaxPermSize=384m"

##2  Create user in Oracle

> create user activevos identified by infa default tablespace infa_tbs;
	
> grant dba to activevos;

##3 uncompress jboss and configuration

- standalone-full.xml

            <security-domain name="jaas/ActiveVOS">
                <authentication>
                    <login-module code="RealmUsersRoles" flag="required">
                        <module-option name="usersProperties" value="${jboss.server.config.dir}/application-users.properties"/>
                        <module-option name="rolesProperties" value="${jboss.server.config.dir}/application-roles.properties"/>
                        <module-option name="realm" value="ApplicationRealm"/>
                        <module-option name="unauthenticatedIdentify" value="anonymous"/>
                    </login-module>
                </authentication>
            </security-domain>

- add-user.sh

		abAdmin,abTaskClient

##4 uncompress activeVOS and execute config_deploy.sh 

##5 start jboss

> standalone.sh -c standalone-full.xml -b 0.0.0.0

##6 login activeVOS

> http://localhost:8080/activevos


## Installation Video
[ActiveVOS JBoss Linux Installation Video](ActiveVOS_JBoss_Linux_Installation.mp4)