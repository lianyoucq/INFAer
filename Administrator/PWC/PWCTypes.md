# PowerCenter 分类

PowerCenter里有很多分类，如果没有听过见过，可能会有点迷糊。这里就简单的概述一下，最容易迷糊的三个分类。

## 传统PowerCenter

传统PowerCenter是由Repository Service(RS)，Integration Service(IS)等基础服务，以及4个客户端(Repository,Designer,Workflow,Monitor)组成。 称作传统PowerCenter或者Classic PowerCenter。


## Mercury Platform 
Mercury Platform是由Model Repository Service(MRS), Data Integration Service(DIS)等基础服务，以及一个基于Eclipse的Developer客户端组成。  

Mercury是传统PowerCenter的NG(Next-generation，下一代), 个人觉得简化了客户端的复杂程度，同时使用起来更简单。另外，它支持JDBC，以及BDM等大数据产品。当然，传统PowerCenter也支持一些大数据产品，但是没有BDM使用方便，性能显著。


## BDM

BDM是基于Mercury Platform之上，同时需要在Hadoop Cluster的节点安装BDM包的产品。

它可以在Developer里设计Mapping和Workflow等jobs，然后这些jobs直接可以根据不同引擎无缝地转换成不同的Hadoop Job。

这样的好处在于，不需要懂Hadoop等各种产品的具体细节，也不需要精通Hadoop、Spark才能做这些事，只需要在Developer上通过拖拽对应的组件，设计满足自己的业务需求，然后直接在Hadoop或者Spark亦或者Blaze引擎上运行即可。

具体可以参考 [BDM概述](../BDM/README.md)


