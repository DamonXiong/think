
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"/>
<title><?php echo $cfg['site_title']; ?></title>
<meta name="renderer" content="webkit">
<meta name="description" content="" />
<meta name="keywords" content="<?php echo $cfg['site_title']; ?>" />

<link href="/themes/v2/static/css/global.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="/themes/v2/static/css/jquery.mCustomScrollbar.css"/>
<link rel="stylesheet" href="/themes/v2/static/css/jquery.sinaEmotion.css"/>

<!--[if lt IE 9]>
<link href="/themes/v2/static/css/less.css" rel="stylesheet" type="text/css">
<script src="/themes/v2/static/js/css3-mediaqueries.js"></script>
<![endif]-->

<script type="text/javascript" src="/themes/v2/static/js/html5.js"></script>
<script type="text/javascript" src="/themes/v2/static/js/jquery-1.9.js"></script>

<script type="text/javascript" src="/themes/v2/js/layer/layer.min.js"></script>
<script type="text/javascript" src="/themes/v2/static/js/jquery.form.js"></script>
<script type="text/javascript" src="/themes/v2/static/js/jquery.mCustomScrollbar.js"></script>
<script type="text/javascript" src="/themes/v2/static/js/jquery.sinaEmotion.js"></script>

<script type="text/javascript" src="/themes/v2/static/js/tinybox2.js"></script>

<script type="text/javascript" src="/themes/v2/static/js/room.api.js"></script>
<script type="text/javascript" src="/themes/v2/static/js/room.init.js"></script>

<style>
	.bo_logo{background-image:url(<?php if (!empty($cfg['imgthumb'])) echo base_url($cfg['imgthumb']); ?>)}
</style>


</head>
<body>
    	       <style>
   .TipForm2 {
z-index: 999;
position: fixed;
_position: absolute;
top: 50%;
left: 50%;
width:800px;
margin: -150px 0 0 -400px;
   }
   .close{
	   position:absolute;
	   right: 0px;
top: 0px;
	 }
.top11{
	position:absolute;
	margin-top:-84px;
	padding-left:102px;
}

.tipForm22{
	z-index: 999;
position: fixed;
_position: absolute;
top: 50%;
left: 50%;
width:800px;
margin: -150px 0 0 -400px;
}
.tipForm23{
	z-index: 999;
position: fixed;
_position: absolute;
top: 50%;
left: 50%;
width:800px;
margin: -150px 0 0 -400px;
}
<?php if ($userinfo['ismaster'] != 26) {
	echo '#chataudit{display:none;}';
}
?>
</style>

<div class="tipForm22" id="ttipForm22" style="display:None">
<img src="<?php echo base_url($cfg['tpl']) ?>/images/kfbgtt.jpg" />
<img src="<?php echo base_url($cfg['tpl']) ?>/images/close.gif" class="close" onClick="$('#ttipForm22').hide()"/>
<span id="nen" style="position: absolute;margin-top: -209px;width: 100%;text-align: center;color: yellow;font-size: 20px;"></span>
<span id="topqq" class="top11" style="width: 794px;margin-left:-45px;"><span id="topqq1">
			<?php if (!empty($adlist[130])) {
			foreach ($adlist[130] as $k => $v) { ?>
			<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=<?php echo $v['link'] ?>&amp;site=qq&amp;menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<?php echo $v['link'] ?>:41" alt="<?php echo $v['title'] ?>" title="请加QQ：<?php echo $v['link'] ?>"></a>
			<?php 
	}
} ?>				
			</span>
</div>
<div class="tipForm23" id="ttipForm23" style="display:None">
<img src="<?php echo base_url($cfg['tpl']) ?>/images/kfbgtt1.jpg" />
<img src="<?php echo base_url($cfg['tpl']) ?>/images/close.gif" class="close" onClick="$('#ttipForm23').hide()"/>
<span id="nen" style="position: absolute;margin-top: -209px;width: 100%;text-align: center;color: yellow;font-size: 20px;"></span>
<span id="topqq" class="top11" style="width: 794px;margin-left:-45px;"><span id="topqq1">
			<?php if (!empty($adlist[130])) {
			foreach ($adlist[130] as $k => $v) { ?>
			<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=<?php echo $v['link'] ?>&amp;site=qq&amp;menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<?php echo $v['link'] ?>:41" alt="<?php echo $v['title'] ?>" title="请加QQ：<?php echo $v['link'] ?>"></a>
			<?php 
	}
} ?>				
			</span>
</div>
	<div id="zoomWallpaperGrid" class="zoomWallpaperGrid">
		<img src="/themes/v2/static/images/551121af96d13.jpg"/>
	</div>
	<header>
		<h1 class="bo_logo f_left" id="headlogo">金融在线</h1>
		<span class="f_left" id="favlink">
			<a href="/themes/v2/static/down.php">保存到桌面</a>
			<a href="javascript:void(0)" onClick="AddFavorite('/','金融在线')">收藏</a>

		</span>
		<span id="topqq" style="width: 611px;"><span id="topqq1"><i>在线客服：</i>
			<?php if (!empty($adlist[130])) {
			foreach ($adlist[130] as $k => $v) { ?>
			<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=<?php echo $v['link'] ?>&amp;site=qq&amp;menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:<?php echo $v['link'] ?>:41" alt="<?php echo $v['title'] ?>" title="请加QQ：<?php echo $v['link'] ?>"></a>
			<?php 
	}
} ?>	
			</span>

		</span>
		<span class="f_right" style="padding-top:1px;"><a href="javascript:initKefu4();" id="topqq2">联系我们</a></span>
		<span class="f_right" id="loginstatus"><span id="ykname"><img src="/themes/v2/static/images/17yk.png" title=""><a><?php echo $userinfo['name']; ?></a></span>
		<?php if ((!empty($userinfo)) && ($userinfo['level'] != '-1')) { ?>
			<a id="btlogout" href="/index.php/user/logout">退出</a> 
		<?php 
} else { ?>
			<a id="btreg" href="#" onClick="showRegForm()" >注册会员</a><a id="btlogin" onClick="showLoginForm();">登录</a> 
		<?php 
} ?>
		</span>


		<div class="clearfix"></div>
	</header>

<div id="main" class="clearfix ption_r" style="">

	<!-- 用户列表模块开始 -->
	<div id="user_use" class="f_left">

	<div class="mt">
	<ul>
	<li id="n_3" class="curr" onClick="vote_nav_switch(3);">黄金</li>  
	<li id="n_4" class="line" onClick="vote_nav_switch(4);">白银</li>  
	<li id="n_5" class="line" onClick="vote_nav_switch(5);">原油</li>
	</ul>
	</div>
	<div class="toupiao">
		<div id="w_3" class="show">
			<a class="t_up" href="javascript:void(0)" onClick="javascript:more_vote(2,3)">看涨<em id="kz3"><?php echo $vote_result[3][2]['v'] ?>%</em></a>
			<a class="t_leve" href="javascript:void(0)" onClick="javascript:more_vote(1,3)">盘整<em id="pz3"><?php echo $vote_result[3][1]['v'] ?>%</em></a>
			<a class="t_down" href="javascript:void(0)" onClick="javascript:more_vote(0,3)">看空<em id="kk3"><?php echo $vote_result[3][0]['v'] ?>%</em></a></div>

		<div id="w_4" class="hide">
			<a class="t_up" href="javascript:void(0)" onClick="javascript:more_vote(2,4)">看涨<em id="kz4"><?php echo $vote_result[4][2]['v'] ?>%</em></a>
			<a class="t_leve" href="javascript:void(0)" onClick="javascript:more_vote(1,4)">盘整<em id="pz4"><?php echo $vote_result[4][1]['v'] ?>%</em></a>
			<a class="t_down" href="javascript:void(0)" onClick="javascript:more_vote(0,4)">看空<em id="kk4"><?php echo $vote_result[4][0]['v'] ?>%</em></a></div>

		<div id="w_5" class="hide">
			<a class="t_up" href="javascript:void(0)" onClick="javascript:more_vote(2,5)">看涨<em id="kz5"><?php echo $vote_result[5][2]['v'] ?>%</em></a>
			<a class="t_leve" href="javascript:void(0)" onClick="javascript:more_vote(1,5)">盘整<em id="pz5"><?php echo $vote_result[5][1]['v'] ?>%</em></a>
			<a class="t_down" href="javascript:void(0)" onClick="javascript:more_vote(0,5)">看空<em id="kk5"><?php echo $vote_result[5][0]['v'] ?>%</em></a></div>
	</div>	
	<div id="hangqing" style="margin-top:5px;height:144px">
		<iframe src="/xinxi.php" height="170px" width="190px" scrolling="no" frameborder="0"></iframe></div>
	<div id="user_list">
	<div class="user_ti clearfix"><!--a href="javascript:void(0)" class="u_ty friend_u" title="我的好友" onClick="userlistcontainer.tabToType('follow')"></a--><a href="javascript:void(0)" class="u_ty manage_u" title="在线客服" onClick="userlistcontainer.tabToType('manager')"></a><a href="javascript:void(0)" class="u_ty all_u" title="所有成员" onClick="userlistcontainer.tabToType('all')"></a><span id="user_cutover">在线会员</span> <a href="javascript:void(0)" onClick="" id="user_count">[刷新]</a></div>

	<div class="user_sh clearfix"><input type="text" name="ukey" id="usearch"><a href="javascript:void(0)" onClick="ulistSearch()" title="搜索"></a></div>
	<!-- 用户列表 -->
	<div id="list_u" class="mCustomScrollbar _mCS_5" style="height: 170px;">
		<div class="mCustomScrollBox mCS-light" id="mCSB_5" style="position:relative; height:100%; overflow:hidden; max-width:100%;">
			<div class="mCSB_container" style="position: relative; top: 0px;">
				<ul id="all">
				</ul>

	</div><div class="mCSB_scrollTools" style="position: absolute; display: block; opacity: 0;"><a class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div class="mCSB_dragger" style="position: absolute; top: 0px; height: 30px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="position: relative; line-height: 30px;"></div></div><div class="mCSB_draggerRail"></div></div><a class="mCSB_buttonDown" oncontextmenu="return false;"></a>
	
	</div></div></div><!-- /用户列表 -->

	<script type="text/javascript">
		var onlineuptime;
		window.clearInterval(onlineuptime);
		onlineuptime = setInterval(useronline, 10000);

		function userflash()
		{
			$.ajax({url:'/index.php/module/live/useronline/getUsers'+'/'+ $("#masterid").val() + '?t=' + new Date().getTime(),
				 type: "GET",
				ifModified:true,
				success: function(d){
					$("#all").html(d);
				}
			});
		}

		function useronline()
		{
			$.ajax({url:'/index.php/userstatus/setUserOnline'+'/'+ $("#roomid").val() + '?t=' + new Date().getTime(),
				 type: "GET",
				ifModified:true,
				async:false,
				success: function(d){
					var ll = $('#all li');
					var l = $('#all li:last').is(":visible");
					if(l || ll.length == 0)
						$("#all").html(d);
				}
			});
		}
		$(function(){useronline();});
	</script>

	</div>

	</div><!-- /用户列表模块结束 -->

	<!-- 聊天模块开始 -->
	<div id="topic" class="ption_r" style="height: 464px;">
	<div class="notice">
	<marquee direction="left" id="notice" scrollamount="3">★系统咨询或购买请点击上方QQ交谈进行咨询↑↑↑★</marquee>
	</div>
	<!-- 聊天开始 -->
	<div class="topiccontent mCustomScrollbar _mCS_1" style="">
	
	<div class="mCustomScrollBox mCS-light" id="mCSB_1" style="position:relative; height:100%; overflow:hidden; max-width:100%;"><div class="mCSB_container" style="position: relative;">
	<div id="topicbox">
		<!--
		<div id="4405-1431414574" class="talk  public member">		<span><img class="roleimg" src="/Public/images/level/0/15hy.png" title="会员"></span>		<div class="talk_name"><a href="javascript:void(0)" class="u_mor" rid="224" uid="4405">有你很幸福</a><a class="time">[15:09]</a></div>		<div class="clear"></div>		<div class="talk_hua"><p>铜是不是要下来啊</p>		</div>		<div class="clear"></div>		</div>
		-->
		<?php $this->load->module('live/chat/getitem', array('masterid' => $masterinfo['masterid'])); ?>
	</div>
	</div><div class="mCSB_scrollTools" style="position: absolute; display: block; opacity: 0;"><a class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div class="mCSB_dragger" style="position: absolute; top: 268px; height: 33px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="position: relative; line-height: 33px;"></div></div><div class="mCSB_draggerRail"></div></div><a class="mCSB_buttonDown" oncontextmenu="return false;"></a></div></div></div>
	<!-- 聊天结束 -->
	<div id="warnmsg"><p style="">★咨询或购买喊单直播聊天系统请联系Q： 76314154★</p></div>
	<div id="topicinput" class="ption_a">
	<div class="tool_bar">
		<span>
			<a href="javascript:void(0)" id="bt_face" class="bar_2 bar" isface="2">表情</a>
			<a href="javascript:void(0)" class="bar_3 bar" id="bt_caitiao">彩条</a>
			<a href="javascript:void(0)" onClick="javascript:new_upImage()" class="bar_1 bar" id="bt_myimage">图片</a>
			<a href="javascript:void(0)" class="bar_4 bar" id="bt_qingping">清屏</a>
			<a href="javascript:void(0)" class="bar_5 bar" id="bt_gundong" select="true">滚动</a>	
			<a href="javascript:void(0)" class="bar_6 " id="bt_gundong" onClick="$('#ttipForm22').show()" ><img src="<?php echo base_url($cfg['tpl']) ?>/images/tubiao.png" style="height: 25px;margin-top: 5px;position: absolute;margin-left: 10px;" /></a>	
		</span>
		<span class="s_right"><!--input type="checkbox" id="shiliao" disabled=true/><label for="shiliao">私聊</label-->
		 </span></div>
	<!-- <form id="imgUpload" name="imgUpload" action="/index.php/Upload" method="post" enctype="multipart/form-data" target="frameFile"> -->
	<form id="imgUpload" name="imgUpload" action="/index.php/upload/multiupload/imgthumb/200/200" method="post" enctype="multipart/form-data" target="frameFile">
	<input id="filedata" contenteditable="false" type="file" style="display:none;" onChange="$('#imgUpload').attr('action','/index.php/upload/multiupload/imgthumb/200/200?' + new Date().getTime() );document.imgUpload.submit();" name="imgFile">
	</form>
	<iframe id="frameFile" name="frameFile" style="display: none;"></iframe>
	<div class="input_area">
		<?php $this->load->module('live/content/getlivedata', array(array($roominfo['cateid']), array($roominfo), array($hostinfo))); ?>
		<a href="javascript:void(0)" onClick="sendMsg()" class="sub_btn" style="background-color: rgb(244, 107, 10);">发送</a></div>
	</div>
	<div id="caitiao" class="hid ption_a" style="display: none;">				<dl id="c_pt" class="clearfix " isface="2" pack="3">
			<dd onClick="sendCaitiao('pt顶一个')">顶一个</dd><dd onClick="sendCaitiao('pt赞一个')">赞一个</dd><dd onClick="sendCaitiao('pt掌声')">掌声</dd><dd onClick="sendCaitiao('pt鲜花')">鲜花</dd><dd onClick="sendCaitiao('pt看多')">看多</dd><dd onClick="sendCaitiao('pt看空')">看空</dd><dd onClick="sendCaitiao('pt震荡')">震荡</dd>		</dl>
		
		<div class="clearfix"></div>
		<ul id="caitiaonav">
						<li rel="pt" class="f_cur" isnav="1" id="caitiao_nav_3">普通</li>		</ul></div>
	</div><!-- /聊天模块结束 -->

	<!-- 视频模块开始 -->
	<div id="me_use" class="ption_a">
	<div class="sp_ti"><span><a href="javascript:void(0);">视频直播</a></span><a href="javascript:showLive(Live_id)" style="margin-right:20px;">刷新</a>
	<!--marquee direction="left"   id="livenotice" scrollamount="3" ></marquee-->
	
	<div id="videolink"> <a href="javascript:void(0)" style="color:#ff0;font-weight:bold;" class="sidenav" rel="tiny" url="/News/TeacherVote/redirectLottery/room_id/7.html" pwidth="830" pheight="500">&lt;给老师点赞&gt;</a></div>
	</div>

	<div id="shiping">
		<embed width="100%" height="100%" align="middle" type="application/x-shockwave-flash" 
		wmode="transparent"   allowfullscreen="true" allowscriptaccess="never" quality="high" 
		src="http://weblbs.yystatic.com/s/<?php echo $roominfo['yy_channel']; ?><?php if (!empty($roominfo['yy_subchannel'])) {echo "/" . $roominfo['yy_subchannel'];} ?>/finscene.swf">
	</div>

	<div id="kefu" style="height: 7px;">
	<div class="kefu_ti"><a class="write" rel="kefu_gonggao">公告</a><!--a  rel='kefu_con'  >在线客服</a-->
		<a href="javascript:void(0);" rel="hd_con">操作建议</a>
		<a rel="banquan_con">版权声明</a>
	</div>
	<div id="kefu_gonggao" class="tab-pane mCustomScrollbar _mCS_4"><div class="mCustomScrollBox mCS-light" id="mCSB_4" style="position:relative; height:100%; overflow:hidden; max-width:100%;"><div class="mCSB_container mCS_no_scrollbar" style="position: relative; top: 0px;">
		<pre style="white-space: pre-wrap;
	word-wrap: break-word;margin:10px;color:#eee;font-family: Microsoft Yahei,Verdana, Geneva, sans-serif;">投资有风险，入市需谨慎，选择正规平台，营造绿色健康投资环境：
	第一：请认准省政府批文（省工商局批文,省金融办批文，市政府批文等均无效）
	第二：确保第三方资金银行托管
	第三：国内现货白银报价以国际价格为基础，综合中国人民银行人民币兑美元基准汇率，连续报出现货白银人民币买入价及卖出价。目前有实时汇率和固定汇率两种报价方式，两种报价方式的点位有一定差值，投资者需警惕。
	第四：理性分析，切记带好止损止盈，不骄不躁，把控风险。
	</pre>
	<div class="clearfix"></div>
	</div><div class="mCSB_scrollTools" style="position: absolute; display: none;"><a class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div class="mCSB_dragger" style="position: absolute; top: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="position:relative;"></div></div><div class="mCSB_draggerRail"></div></div><a class="mCSB_buttonDown" oncontextmenu="return false;"></a></div></div></div>
	<!--div id="kefu_con" class="tab-pane hid">

	<div class="f_right" id="kefunavdiv">
	<ul id ="kefunav">
	</ul>
	</div>
	<div class="clearfix"></div>
	</div-->

	<div id="hd_con" class="tab-pane hid">
	<div class="hd_input"><input name="hd_text" id="hd_text" type="text"><a href="javascript:void(0)" onClick="sendHd(this);">发布</a>
	</div>
	<ul id="hd_ul">

	</ul>
	<div class="clearfix"></div>
	</div>


	<div id="banquan_con" class="tab-pane hid mCustomScrollbar _mCS_3"><div class="mCustomScrollBox mCS-light" id="mCSB_3" style="position:relative; height:100%; overflow:hidden; max-width:100%;"><div class="mCSB_container mCS_no_scrollbar" style="position: relative; top: 0px;">
		<pre style="white-space: pre-wrap;
	word-wrap: break-word;margin:10px;color:#eee;font-family: Microsoft Yahei,Verdana, Geneva, sans-serif;">本直播室所有内容，包括文字、图像、音频、视频只供本公司或授权者使用，访问者可将本网站提供的内容或服务用于个人学习或欣赏，以及其他非商业性或非盈利性用途；没有本公司的书面授权，不得因任何目的，以任何方式如电子的、转载或其它方式，包括影印和记录，复制和传播本直播室的任何部分。</pre>
	<div class="clearfix"></div>
	</div><div class="mCSB_scrollTools" style="position: absolute; display: none;"><a class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div class="mCSB_dragger" style="position: absolute; top: 0px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="position:relative;"></div></div><div class="mCSB_draggerRail"></div></div><a class="mCSB_buttonDown" oncontextmenu="return false;"></a></div></div></div>

	</div>

	</div><!-- /视频模块结束 -->
	<!-- 抽奖模块开始 -->
	<div class="lottery" id="lottery" style="display:none;">
		<div class="close"><img id="cls" onClick="document.getElementById('lottery').style.display = 'none';" src="/themes/v2/static/images/close.gif"></div>
		<h2></h2>
	<ul id="lottery_ul">
		<li id="lottery_li"></li>
	</ul>
	<div id="lotteryresult"></div>
	</div>
	<!-- /抽奖模块结束 -->


	<div id="sidebar" class="ption_a mCustomScrollbar _mCS_2"><div class="mCustomScrollBox mCS-light" id="mCSB_2" style="position:relative; height:100%; overflow:hidden; max-width:100%;"><div class="mCSB_container" style="position: relative; top: 0px;">


	<ul>
		<li class="side1">					<a href="javascript:void(0)" class="sidenav" rel="tiny" url="http://sxhongxinpme.com/dazong/index.html" pwidth="1000" pheight="500">					<img src="/themes/v2/static/images/542a477f722ce.png" title="产品介绍"><br>产品介绍</a>					</li>
		
		<li class="side2">					<a href="javascript:void(0)" class="sidenav" rel="tiny" url="/News/TeacherVote/redirectLottery/room_id/7.html" pwidth="830" pheight="480">					<img src="/themes/v2/static/images/54a3732d4f976.jpg" title="讲师榜单"><br>讲师榜单</a>					</li>
		
		<li class="side3">					<a href="http://www.kuaixun360.com/rili" class="sidenav" target="_blank">					<img src="/themes/v2/static/images/542a48684d257.png" title="财经日历"><br>财经日历</a>					</li><li class="side4">					<a href="http://www.kuaixun360.com/etf/gold.html" class="sidenav" target="_blank">					<img src="/themes/v2/static/images/542a48842a129.png" title="黄金ETF"><br>黄金ETF</a>					</li>
		<li class="side5">					<a href="http://www.kuaixun360.com/etf/silver.html" class="sidenav" target="_blank">					<img src="/themes/v2/static/images/542a488f69e05.png" title="白银ETF"><br>白银ETF</a>					</li>
		<li class="side6">					<a href="javascript:void(0)" class="sidenav" rel="tiny" url="/News/Index/index/id/46.html" pwidth="1000" pheight="500">					<img src="/themes/v2/static/images/542a489f33112.png" title="下载中心"><br>下载中心</a>					</li>
		<li class="side7">					<a href="javascript:void(0)" class="sidenav" rel="tiny" url="" pwidth="700" pheight="370">					<img src="/themes/v2/static/images/542a48ba5dc4a.png" title="课程安排"><br>课程安排</a>					</li>
	</ul>
	</div><div class="mCSB_scrollTools" style="position: absolute; display: block; opacity: 0;"><a class="mCSB_buttonUp" oncontextmenu="return false;"></a><div class="mCSB_draggerContainer"><div class="mCSB_dragger" style="position: absolute; top: 0px; height: 454px;" oncontextmenu="return false;"><div class="mCSB_dragger_bar" style="position: relative; line-height: 454px;"></div></div><div class="mCSB_draggerRail"></div></div><a class="mCSB_buttonDown" oncontextmenu="return false;"></a></div></div></div>
	<div class="clearfix"></div>
	
</div>

<script src="/themes/v2/static/js/malertbox2.js"></script>

<script type="text/javascript">
$('#sendMsgInput').keyup(function(event){
	if(event.keyCode ==13){
		$(".sub_btn").trigger("click");
		return false;
	}
});
function login()
{
	postdata('loginform',"/index.php/user/login",'show');
}
function show(d)
{
	if(d.code == '1'){
		//$.jBox.tip(d.msg, 'success');
		layer.msg(d.msg, 2, 0);
		window.setTimeout(function () {
			parent.window.location.reload();
		}, 1000);
	}else{
		layer.msg(d.msg, 2, 0);
	//	$.jBox.tip(d.msg,'error');
	}
}
$('#bt_face').SinaEmotion($('#sendMsgInput'));
</script>
</body>
</html>
