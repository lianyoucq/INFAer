#  Informatica repository manager encountered an improper argument

这个需要修改注册表

- 在cmd[快捷键Win+R]里输入： Regedit
- 备份部分注册表内容
  - 路径 HKEY_CURRENT_USER > Software > Informatica > PowerMart Client Tools > <<版本>> 
  - 右键选择 Export
- 删除部分注册表内容
  - 路径Open HKEY_CURRENT_USER > Software > Informatica > PowerMart Client Tools > <<版本>> > Repository Manager Options > Toolbars <<版本>>
- 重启电脑，让注册表生效
