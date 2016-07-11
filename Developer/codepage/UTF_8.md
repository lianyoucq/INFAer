#UTF-8

| 范围(十六进制) | UTF-8(二进制) |
| -- | -- |
| 0000 0000-0000 007F | 0xxxxxxx | 
| 0000 0080-0000 07FF | 110xxxxx 10xxxxxx | 
| 0000 0800-0000 FFFF | 1110xxxx 10xxxxxx 10xxxxxx |
| 0001 0000-0010 FFFF | 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx |
| 0:6 | 1:6 |
| 0:7 | 1:7 |

 Char. number range    |        UTF-8 octet sequence
      (hexadecimal)    |              (binary)
   --------------------+---------------------------------------------
   0000 0000-0000 007F | 0xxxxxxx
   0000 0080-0000 07FF | 110xxxxx 10xxxxxx
   0000 0800-0000 FFFF | 1110xxxx 10xxxxxx 10xxxxxx
   0001 0000-0010 FFFF | 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx