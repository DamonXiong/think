<?php 

//文件的类型 
header('Content-type: text/html'); 
//下载显示的名字 
header('Content-Disposition: attachment; filename="泰世通直播室.html"'); 
echo '<script language="javascript">location.href="http://www.sxtst.cn/";</script>';
exit(); 