#GBK
在大陆，国标【GB】系列,例如，GBK, GB18030， GB2312.... 是使用最多的。但是现在互联网时代里，**UTF-8**使用的比较多。

不过，不得不说，现在中文版的windows默认是**GBK**编码的。

那今天就来看看属于中国自己的编码。

**GBK**使用了两个字节来存储字符。[GBK Code Tables](http://www.khngai.com/chinese/charmap/tblgbk.php?page=0)

前面我们说过**ASCII编码**,还记有个扩展的ASCII编码吗？

由于**ASCII**编码成了板上钉钉的标准了，但是扩展的ASCII，及最高位为1的编码却没有成为标准，所以大家都充分利用这个，例如很多欧洲希腊的字符集。当然了，中文的GBK也是如此。

这里我把GBK Code Tables 目录贴出来

|  GBK Character Map  |
| -- |
| 0x8140 - 0x8FFF |
| 0x9040 - 0x9FFF |
| 0xA040 - 0xAFFF |
| 0xB040 - 0xBFFF |
| 0xC040 - 0xCFFF |
| 0xD040 - 0xDFFF |
| 0xE040 - 0xEFFF |
| 0xF040 - 0xFEFF |

表1

从表1中可以看出，**GBK**就是把最高位设置为1，然后低位范围从40到FF。

这下就对中文的GBK字符集的清楚明白了。但是如果**GBK**的编码使用其它使用扩展位的ASCII的字符集来解码，就可能会显示为其它的字符。

