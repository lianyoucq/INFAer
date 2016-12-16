#参数化

停止硬编码，多使用参数。

在开发中，有很多的变数，例如时间，类型，各种条件限制。如何运筹帷幄，以不变应万变呢？这就需要使用到参数文件。

举个例子，在开发环境上使用的数据库连接叫XXX_DEV 和生成环境的数据库连接叫XXX_PRD 是不一样的,如果没有参数文件，那么迁移到生产环境上之后，还得修改Session里的连接。另外一种方式是，使用参数文件，只需要把参数里的数据库连接参数换成XXX_PRD就可以了。

同时，同一个workflow里，不同的session，worklet之间还可以共享参数或者变量。


##参数类型

在INFA中参数有两种类型

- 参数
	
	在整个ETL流中，都不会变修改。

- 变量
	
	在ETL流中可能会修改，可以使用Variables里的函数，例如，SetVariable.

##参数格式

在INFA中有两种格式，不过这些都不用太在意，因为你在定义这些参数或者变量时，会显示是一个还是两个$$。

- 一个$开头

	在INFA中以一个$开头基本都是系统预定义好的参数，例如,$PMMappingName；和数据库连接参数，例如，$DBConnection_SRC

- 两个$$开头

	两个$$开头的，基本上都是mapping级别的参数或者变量或者workflow级别上的变量。


##参数文件位置
参数文件可以设置在session级别上，也可以在Workflow级别上。一般来说，设置在Workflow上确实会省事点，如果workflow中有多个session。


##参数文件示例

- [Global] 

	全局设置。

- [Service:IntegrationService_Name] 
	
	指定集成服务，那么这个设置，只针对运行在这个集成服务的Workflow，session等实例。
	
	其中，**Service:**是规定的标记，代表后面是集成服务名。

- [Service:IntegrationService_Name.ND:Node_Name]

	指定集成服务和节点，然后只有运行在这个节点和这个集成服务的Workflow，session等实例上有效。

	其中，**.ND:**是规定的标记，代表后面是节点。

- [Folder_Name.WF:Workflow_Name] 
	
	指定Folder和workflow名，那么只有这个folder下的这个workflow才能取到。

	其中，**.WF:**是规定的标记，代表后面是Workflow。

- [Folder_Name.WF:Workflow_Name.WT:Worklet_Name] 
	
	指定Folder，Workflow和Worklet，那么只有这个folder下的这个workflow里的worklet可以取到。

	其中，**.WT:**是规定的标记，代表后面是Worklet。

- [Folder_Name.WF:Workflow_Name.WT:Worklet_Name.WT:Nested_Worklet_Name] 
	
	指定Folder，Workflow，worklet和worklet中嵌套的worklet，那么只有这个folder下的workflow里的这个worklet下的嵌套的这个worklet可以取到。	

- [Folder_Name.WF:Workflow_Name.WT:Worklet_Name.ST:Session_Name] 
	
	指定Folder，workflow，worklet和session。那么只有这个folder下的这个workflow里的worklet里的这个session可以获取到。

	其中，**.ST:**是规定的标记，代表后面是Session名。

- [Folder_Name.WF:Workflow_Name.ST:Session_Name] 

	指定Folder和workflow，Session。那么只有这个Folder下的Workflow里的这个Session可以获取到。

- [Folder_Name.ST:Session_Name] 

	指定folder和session。那么只有这个folder下的这个session可以获取到。

- [Session_Name]

	指定session。那么只有这个session可以获取到。


虽然写了这么多条，但是基本上用到的就那么几条，例如[Folder_Name.WF:Workflow_Name.ST:Session_Name] 。你可以根据自己的需求写相应的参数文件。


##注意事项

- infa用户有访问参数文件的权限。

- 如果使用到了GRID或者HA，那么最好把参数文件放到共享存储上。

