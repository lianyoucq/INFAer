#UTF-8
UTF-8字符集编码需要1到6个字节，当使用一个字节时，与ASCII编码保持一致。所以它是兼容ASCII编码的。而当它使用6个字节时，会占用31位，所以可以覆盖所有的Unicode的范围[注1]

| 范围(十六进制) | UTF-8(二进制) |
| -- | -- |
| 0000 0000-0000 007F | 0xxxxxxx | 
| 0000 0080-0000 07FF | 110xxxxx 10xxxxxx | 
| 0000 0800-0000 FFFF | 1110xxxx 10xxxxxx 10xxxxxx |
| 0001 0000-0010 FFFF | 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx |
| 0020 0000-03FF FFFF | 111110xx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx |
| 0400 0000-7FFF FFFF | 1111110x 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx 10xxxxxx |

