1. 解压系统至WEB访问目录；
2. 直播室数据库文件夹放到mysql/data下(或者把sql文件导入到数据库中)，编码请确认UTF-8格式；
3. 修改application\config\database.php
	$db['default']['hostname'] = 'localhost';
	$db['default']['username'] = '数据库帐号';
	$db['default']['password'] = '数据库访问密码';
	$db['default']['database'] = '数据库名';


后台地址：
index.php/admin/login
admin 123456

application\cache
application\cache\classes
application\cache\moni
application\cache\room
upload
（上面这些文件夹要写入权限）WIN系统一搬不用。
themes\v2\live/room.php模板文件

                          咨询系统问题或者购买永久使用权联系QQ： 76314154