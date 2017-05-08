#乱码问题

写了一些字符集编码的文章，但是遇到具体的问题，知道了本质原因，可能具体操作有点模糊。

这里就在字符集编码的基础上讲一些处理乱码问题的常规处理方式

在PowerCenter中，与字符集编码有关的地方有

- Integration Service的模式
- 源和目标Connection字符集编码
- ODBC连接的字符集编码
- 数据类型



针对Integration Service的模式，可以参考[DataMovementMode](is/datamovementmode.md)


针对源和目标Connection字符集编码,需要在Workflow Manager客户端里设置相关的字符集编码，一个通用的法则是，Connection字符集选择与对应的数据库编码保持一致，不过也有例外。
也请参考[DataMovementMode](is/datamovementmode.md)， 


针对ODBC连接的字符集编码，这个需要在ODBCINI环境变量对应的文件里设置IANAAppCodePage，其值为数字，具体可以参考[IANAAppCodePage](https://www.iana.org/assignments/character-sets/character-sets.xhtml)。一般其值与数据库的字符集编码一致。


针对数据类型，数据类型和n数据类型的区别，例如string和nstring，nstring的n应该是national的意思吧，即使unicode string。所以n系列的数据类型对非英文字符支持更好。


# 定位问题方法

## debug模式
在debug模式可以看到数据流动，所以可以看出那个地方出现了乱码字符。然后定位修改对应的字符集编码。

## log level
日志级别，将日志级别设置成verbose data，然后看reader，transformations和writer的字符是否出现乱码，如果哪里出现了乱码就可以定位问题了。


# 例外
有些系统或者平台或者数据库，会存在多字符集共存的情况，这种情况下要特殊分析。

