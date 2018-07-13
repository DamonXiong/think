/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50538
Source Host           : localhost:3306
Source Database       : zhibo2

Target Server Type    : MYSQL
Target Server Version : 50538
File Encoding         : 65001

Date: 2015-08-11 23:18:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `live_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `live_action_log`;
CREATE TABLE `live_action_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `info` varchar(255) NOT NULL DEFAULT '',
  `isadmin` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:管理员 2:用户',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`logid`),
  KEY `log_time` (`ctime`) USING BTREE,
  KEY `user_id` (`userid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1883 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_action_log
-- ----------------------------
INSERT INTO `live_action_log` VALUES ('1880', '1', '清空操作日志：action_log', '1', '127.0.0.1', '1437977682');
INSERT INTO `live_action_log` VALUES ('1881', '1', '设置用户等级：127', '1', '127.0.0.1', '1437977840');
INSERT INTO `live_action_log` VALUES ('1882', '1', '编辑会员：liuzihan', '1', '127.0.0.1', '1437977866');

-- ----------------------------
-- Table structure for `live_admin`
-- ----------------------------
DROP TABLE IF EXISTS `live_admin`;
CREATE TABLE `live_admin` (
  `userid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `passwd` varchar(64) NOT NULL,
  `realname` varchar(32) DEFAULT NULL,
  `kind` varchar(32) DEFAULT NULL,
  `token` varchar(64) DEFAULT NULL,
  `mtime` int(11) NOT NULL,
  `ctime` int(11) DEFAULT NULL,
  `ltime` int(11) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `admin_id` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_admin
-- ----------------------------
INSERT INTO `live_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', null, null, '', '0', '1353638507', '1353638508', '99');

-- ----------------------------
-- Table structure for `live_admin_action`
-- ----------------------------
DROP TABLE IF EXISTS `live_admin_action`;
CREATE TABLE `live_admin_action` (
  `action_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` tinyint(3) unsigned DEFAULT '0',
  `action_code` varchar(20) DEFAULT '',
  `action_name` varchar(100) DEFAULT '',
  `action_link` varchar(300) DEFAULT NULL,
  `level` varchar(20) DEFAULT '',
  PRIMARY KEY (`action_id`),
  UNIQUE KEY `action_id` (`action_id`),
  KEY `parent_id` (`parent_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_admin_action
-- ----------------------------
INSERT INTO `live_admin_action` VALUES ('1', '144', 'setting_1', '基本设置', 'admin/setting/index/1', '3');
INSERT INTO `live_admin_action` VALUES ('27', '145', 'region', '地区管理', 'admin/region', '-3');
INSERT INTO `live_admin_action` VALUES ('45', '147', 'article', '新闻管理', 'admin/article', '-3');
INSERT INTO `live_admin_action` VALUES ('170', '169', 'menu_user', '会员管理', null, '2');
INSERT INTO `live_admin_action` VALUES ('171', '170', 'user', '用户管理', 'admin/user', '3');
INSERT INTO `live_admin_action` VALUES ('77', '151', 'page', '单页内容管理', 'admin/pages', '-3');
INSERT INTO `live_admin_action` VALUES ('136', '154', 'role', '角色管理', 'admin/adminuser/role_list', '3');
INSERT INTO `live_admin_action` VALUES ('124', '154', 'admin_user', '管理员列表', 'admin/adminuser/admin_list', '3');
INSERT INTO `live_admin_action` VALUES ('134', '146', 'live_room', '直播室管理', 'admin/liveroom/tlist/29', '3');
INSERT INTO `live_admin_action` VALUES ('178', '138', 'menu_menu', '导航管理', null, '-2');
INSERT INTO `live_admin_action` VALUES ('137', '150', 'ad_home', '广告内容管理', 'admin/advertisement/tlist', '3');
INSERT INTO `live_admin_action` VALUES ('138', '0', 'global', '全局', null, '1');
INSERT INTO `live_admin_action` VALUES ('139', '0', 'info', '信息管理', null, '1');
INSERT INTO `live_admin_action` VALUES ('140', '0', 'ad', '广告管理', null, '1');
INSERT INTO `live_admin_action` VALUES ('141', '0', 'pages', '单页管理', null, '-1');
INSERT INTO `live_admin_action` VALUES ('143', '0', 'action', '管理员', null, '1');
INSERT INTO `live_admin_action` VALUES ('144', '138', 'menu_general', '全局配置', null, '2');
INSERT INTO `live_admin_action` VALUES ('145', '138', 'menu_public', '公共数据管理', null, '-1');
INSERT INTO `live_admin_action` VALUES ('146', '139', 'menu_live', '直播管理', null, '2');
INSERT INTO `live_admin_action` VALUES ('147', '139', 'menu_article', '资讯管理', null, '-2');
INSERT INTO `live_admin_action` VALUES ('177', '178', 'menu', '导航管理', 'admin/category/tlist/menu', '-3');
INSERT INTO `live_admin_action` VALUES ('169', '0', 'user', '会员管理', null, '1');
INSERT INTO `live_admin_action` VALUES ('150', '140', 'menu_ad', '广告管理', null, '2');
INSERT INTO `live_admin_action` VALUES ('151', '141', 'menu_page', '单页管理', null, '-2');
INSERT INTO `live_admin_action` VALUES ('154', '143', 'menu_admin', '管理员', null, '2');
INSERT INTO `live_admin_action` VALUES ('168', '154', 'action_log', '操作日志', 'actionlog', '3');
INSERT INTO `live_admin_action` VALUES ('173', '170', 'appvip', 'VIP用户申请', 'admin/user/appvip', '-3');
INSERT INTO `live_admin_action` VALUES ('174', '170', 'getUsers', '禁言用户激活', 'admin/user/getUsers', '-3');
INSERT INTO `live_admin_action` VALUES ('175', '146', 'live_master', '直播主题管理', 'admin/livemaster', '-3');
INSERT INTO `live_admin_action` VALUES ('176', '146', 'live_app', '直播申请管理', 'admin/liveapp', '-1');
INSERT INTO `live_admin_action` VALUES ('179', '146', 'live_content', '直播内容管理', 'admin/livecontent', '-3');
INSERT INTO `live_admin_action` VALUES ('180', '139', 'menu_zt', '专题管理', null, '-1');
INSERT INTO `live_admin_action` VALUES ('181', '180', 'zt', '专题管理', 'admin/zt', '-3');
INSERT INTO `live_admin_action` VALUES ('182', '147', 'notice', '公告管理', 'admin/notice', '-3');
INSERT INTO `live_admin_action` VALUES ('183', '144', 'setting_2', '系统设置', 'admin/setting/index/2', '3');
INSERT INTO `live_admin_action` VALUES ('184', '144', 'setting_3', 'SMTP设置', 'admin/setting/index/3', '-3');
INSERT INTO `live_admin_action` VALUES ('185', '170', 'service', '预约名单', 'admin/service', '-3');
INSERT INTO `live_admin_action` VALUES ('186', '146', 'live_handan', '喊单管理', 'admin/handan', '-3');
INSERT INTO `live_admin_action` VALUES ('187', '144', 'moni', '虚拟人设置', 'admin/moni', '3');
INSERT INTO `live_admin_action` VALUES ('188', '146', 'chat_content', '网友互动内容管理', 'admin/chatcontent', '3');
INSERT INTO `live_admin_action` VALUES ('189', '146', 'qa_content', '问答内容管理', 'admin/qacontent', '-3');
INSERT INTO `live_admin_action` VALUES ('190', '0', 'help', '帮助', '', '-1');
INSERT INTO `live_admin_action` VALUES ('191', '190', 'menu_help', '在线手册', '', '2');
INSERT INTO `live_admin_action` VALUES ('192', '191', 'help_doc', '后台操作说明', 'admin/help/doc', '3');
INSERT INTO `live_admin_action` VALUES ('193', '146', 'classes', '课程管理', 'admin/classes', '3');
INSERT INTO `live_admin_action` VALUES ('195', '170', 'login_log', '登陆日志', 'admin/user/login_log', '3');

-- ----------------------------
-- Table structure for `live_admin_user`
-- ----------------------------
DROP TABLE IF EXISTS `live_admin_user`;
CREATE TABLE `live_admin_user` (
  `user_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `ec_salt` varchar(10) DEFAULT NULL,
  `add_time` int(11) NOT NULL DEFAULT '0',
  `last_login` int(11) NOT NULL DEFAULT '0',
  `last_ip` varchar(15) NOT NULL DEFAULT '',
  `action_list` text,
  `nav_list` text,
  `lang_type` varchar(50) NOT NULL DEFAULT '',
  `agency_id` smallint(5) unsigned DEFAULT '0',
  `suppliers_id` smallint(5) unsigned DEFAULT '0',
  `todolist` longtext,
  `role_id` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `user_name` (`user_name`) USING BTREE,
  KEY `agency_id` (`agency_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_admin_user
-- ----------------------------
INSERT INTO `live_admin_user` VALUES ('1', 'admin', 'dgt@yuyit.cn', 'e10adc3949ba59abbe56e057f20f883e', '108', '1370392049', '1376363079', '127.0.0.1', 'all', '会员列表|users.php?act=list,商品列表|goods.php?act=list,订单列表|order.php?act=list,用户评论|comment_manage.php?act=list', '', '0', '0', '\n', null);
INSERT INTO `live_admin_user` VALUES ('16', 'admin1', 'admin@hyzxfy.com', 'e00cf25ad42683b3df678c61f42c6bda', null, '1429249275', '0', '', null, null, '', '0', '0', null, '11');

-- ----------------------------
-- Table structure for `live_advertising`
-- ----------------------------
DROP TABLE IF EXISTS `live_advertising`;
CREATE TABLE `live_advertising` (
  `advertid` int(11) NOT NULL AUTO_INCREMENT,
  `cateid` int(11) DEFAULT NULL,
  `title` varchar(120) NOT NULL,
  `link` varchar(120) NOT NULL,
  `desc` varchar(500) NOT NULL,
  `btime` int(11) NOT NULL,
  `etime` int(11) DEFAULT NULL,
  `imgthumb` varchar(100) NOT NULL,
  `adtype` tinyint(4) DEFAULT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `mid` int(10) NOT NULL DEFAULT '0',
  `sort` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `sourceimage` varchar(100) NOT NULL,
  `ispublic` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未公开 1:公开',
  PRIMARY KEY (`advertid`)
) ENGINE=MyISAM AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_advertising
-- ----------------------------
INSERT INTO `live_advertising` VALUES ('85', '25', '标题标题', '', '描述描述描述\n描述描述描述描述\n描述描述', '0', null, 'upload/pages/20121202/5640081a6987af90dfa179a08548a5a9.png', '1', '0', '1354430486', '1354430832', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('86', '29', '下载YY/Skype链接', 'http://xxx.com', '', '0', null, '', '1', '0', '1354435390', '0', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('87', '30', '首页通栏', 'http://www.fdsv.com', '描述描述', '0', null, 'upload/pages/20121202/553162fcaeed2f1f699dc98a60dd98d3.jpg', '2', '0', '1354435556', '0', '0', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('88', '28', '右栏广告', 'http://www.91mp.com', '描述描述描述\'描述描述描述\'描述描述', '0', null, 'upload/pages/20121203/96fe093ac91b175c71c3faa43ba82d3b.jpg', '2', '0', '1354536035', '1354536063', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('89', '34', '关于直播室', 'http://www.163.com', '描述描述描述描述\n描述描述\n描述描述描述\n描述描述描述', '0', null, '', '1', '0', '1355063088', '0', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('90', '41', '通栏图片', '', '', '0', null, 'upload/pages/20121211/ebb3e786045f0f4736bdc9a30e69906c.jpg', '2', '0', '1355236217', '1355236436', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('91', '46', '中间通栏图片广告', '', '', '0', null, 'upload/pages/20121214/b3a8c3beee6f517123cf8cb6c8263a43.gif', '2', '0', '1355238132', '1355465559', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('92', '49', '导航链接', 'http://bbs.163.com', '', '0', null, '', '1', '0', '1355315332', '0', '0', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('93', '50', 'LOGO', '', '', '0', null, 'upload/pages/20130304/021c92942ced47487136ace468f38190.jpg', '0', '0', '1355315399', '1362378246', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('94', '47', '中间栏广告', '', '', '0', null, 'upload/pages/20121214/99c166c505abfb689fb1fa1bfa37eb09.jpg', '0', '0', '1355463921', '0', '0', '0', '0', '0', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('95', '56', '首页栏目', 'home', '', '0', null, 'upload/pages/20130228/175e22ebc04ebd7aab96b34e0e2f4c23.jpg', '0', '0', '1362030316', '0', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('96', '57', '直播大厅', 'gold', '', '0', null, 'upload/pages/20130228/36ec36cb5c85e17531d68839ca58bd87.jpg', '0', '0', '1362030398', '1362491756', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('97', '59', '轮播1', '', '', '0', null, 'upload/pages/20130228/4debc0de99427ff50dd4562e11c73588.jpg', '0', '0', '1362036833', '0', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('98', '60', '轮播2', '', '', '0', null, 'upload/pages/20130228/011ce4152663dd298bb617969120e21b.jpg', '0', '0', '1362036890', '0', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('99', '61', '轮播3', '', '', '0', null, 'upload/pages/20130228/05d5371a6a9fe3fb60341e804a482d4c.jpg', '0', '0', '1362036922', '0', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('100', '62', '轮播4', '', '', '0', null, 'upload/pages/20130228/7201a87d56ef7202404810b9025e7008.jpg', '0', '0', '1362036956', '0', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('101', '63', '轮播5', '', '', '0', null, 'upload/pages/20130228/56156b1519ada71cd6f02a337ec24e12.jpg', '0', '0', '1362036988', '0', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('102', '55', '金银直播', '', '', '0', null, 'upload/pages/20130305/af2c06d9219085b57e04fd5b96a227ef.jpg', '0', '0', '1362450454', '1362451089', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('103', '64', '贵金属', '', '', '0', null, 'upload/pages/20130305/e068b88a74407a2ecdb687e031c662b5.jpg', '0', '0', '1362451179', '1362537144', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('104', '35', 'aaa', '', '', '0', null, 'upload/pages/20130604/04c51b61029e9a20ffd0add4307043e4.jpg', '0', '0', '1370323359', '1370323425', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('122', '0', '兴利投资', 'http://www.hzxltz.com/', '', '0', null, '', '0', '0', '1396251057', '0', '0', '0', '3', '1', '0', '0', '', '1');
INSERT INTO `live_advertising` VALUES ('126', '130', '客服1', '2892756771', '<p>\n	<br />\n</p>', '0', null, 'upload/userimgthumb/20150202/pic_77_22/914e39308b073b18cd7430bd4f18b822.gif', '2', '0', '1396253768', '1433228110', '0', '0', '1', '1', '77', '22', 'upload/userimgthumb/20150202/914e39308b073b18cd7430bd4f18b822.gif', '1');
INSERT INTO `live_advertising` VALUES ('127', '130', '客服2', '3118683349', '<p>\n	<br />\n</p>', '0', null, 'upload/userimgthumb/20150202/pic_77_22/3f9a2db72ea0d168ed9f51582a0c270e.gif', '2', '0', '1396253838', '1432106829', '0', '0', '2', '1', '77', '22', 'upload/userimgthumb/20150202/3f9a2db72ea0d168ed9f51582a0c270e.gif', '1');
INSERT INTO `live_advertising` VALUES ('128', '130', '客服3', '1901172848', '<p>\n	<br />\n</p>', '0', null, 'upload/userimgthumb/20150202/pic_77_22/2c5434d30c88deb880db48b9a1fedfd6.gif', '2', '0', '1396253894', '1433228244', '0', '0', '3', '1', '77', '22', 'upload/userimgthumb/20150202/2c5434d30c88deb880db48b9a1fedfd6.gif', '1');
INSERT INTO `live_advertising` VALUES ('129', '130', '客服4', '353909204', '<p>\n	<br />\n</p>', '0', null, 'upload/userimgthumb/20150202/pic_77_22/8643f701d8f916f8f5fb35333b745cc7.gif', '2', '0', '1396253925', '1432106846', '0', '0', '4', '1', '77', '22', 'upload/userimgthumb/20150202/8643f701d8f916f8f5fb35333b745cc7.gif', '1');
INSERT INTO `live_advertising` VALUES ('133', '162', '产品中心下方通栏图片', '', '', '0', null, 'upload/userimgthumb/20140521/5501f756a60f545545a2733880aa7ba4.jpg', '0', '0', '1400655044', '1400655076', '0', '0', '0', '1', '0', '0', 'upload/userimgthumb/20140521/5501f756a60f545545a2733880aa7ba4.jpg', '1');
INSERT INTO `live_advertising` VALUES ('134', '166', '首页', '#', '', '0', null, '', '1', '0', '1405677308', '1432611323', '0', '0', '1', '1', '0', '0', '', '1');
INSERT INTO `live_advertising` VALUES ('135', '166', '分析师直播室', 'http://www.aunigold99.com/gold/DailyData', '', '0', null, '', '0', '0', '1405677327', '1422876716', '0', '0', '2', '1', '0', '0', '', '1');
INSERT INTO `live_advertising` VALUES ('136', '166', '财经日历', 'www.sina.com', '', '0', null, '', '0', '0', '1405677347', '0', '0', '0', '3', '1', '0', '0', '', '1');
INSERT INTO `live_advertising` VALUES ('137', '166', '金融早餐', 'www.163.com', '', '0', null, '', '0', '0', '1405677371', '0', '0', '0', '4', '1', '0', '0', '', '1');
INSERT INTO `live_advertising` VALUES ('138', '167', '公告内容', '', '广告内容3.', '0', null, '', '1', '0', '1405677525', '1427873657', '0', '0', '1', '1', '0', '0', '', '1');
INSERT INTO `live_advertising` VALUES ('139', '166', '客户活动', 'www.sina.com', '', '0', null, '', '0', '0', '1405677863', '0', '0', '0', '5', '1', '0', '0', '', '1');
INSERT INTO `live_advertising` VALUES ('140', '166', '讲师团队', 'google.com', '', '0', null, '', '0', '0', '1405677902', '0', '0', '0', '6', '1', '0', '0', '', '1');
INSERT INTO `live_advertising` VALUES ('141', '168', '介绍', '#', '', '0', null, '', '1', '0', '1405922567', '1432611341', '0', '0', '0', '1', '0', '0', '', '1');
INSERT INTO `live_advertising` VALUES ('142', '168', 'MT4交易软件', 'http://files.metaquotes.net/5959/mt4/hf4setup.exe', '', '0', null, '', '0', '0', '1405922567', '1422875276', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('143', '168', '快讯通下载', 'http://www.kuaixun360.com/', '', '0', null, '', '0', '0', '1405922567', '1405927590', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('145', '169', '机构点评', 'http://www.kuaixun360.com/dianping/', '', '0', null, '', '0', '0', '1405922820', '1405927450', '0', '0', '0', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('146', '169', '财经日历', 'http://www.kuaixun360.com/caijingrili/', '', '0', null, '', '0', '0', '1405922820', '1405927465', '0', '0', '1', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('147', '169', '黄鱼ETF', 'http://www.kuaixun360.com/etf_gold/', '', '0', null, '', '0', '0', '1405922820', '1405927482', '0', '0', '2', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('148', '169', '白银ETF', 'http://www.kuaixun360.com/etf_silver/', '', '0', null, '', '0', '0', '1405922820', '1405927495', '0', '0', '4', '1', '0', '0', '', '0');
INSERT INTO `live_advertising` VALUES ('149', '167', '公告内容2', '', '广告内容1.', '0', null, '', '1', '0', '1406208675', '1427873622', '0', '0', '0', '1', '0', '0', '', '1');
INSERT INTO `live_advertising` VALUES ('150', '167', '建议操作', '', '<h1>\n	<br />\n</h1>', '0', null, '', '1', '0', '1406208693', '1433240784', '0', '0', '0', '1', '0', '0', '', '1');
INSERT INTO `live_advertising` VALUES ('151', '170', '轮播广告1', '', '', '0', null, 'upload/userimgthumb/20140724/2f1c3a343b9fb0cb7a2e6b8dfb56f6c5.jpg', '0', '0', '1406209234', '1406773021', '0', '0', '0', '1', '0', '0', 'upload/userimgthumb/20140724/2f1c3a343b9fb0cb7a2e6b8dfb56f6c5.jpg', '1');
INSERT INTO `live_advertising` VALUES ('152', '170', '轮播广告2', '', '', '0', null, 'upload/userimgthumb/20140724/2f1c3a343b9fb0cb7a2e6b8dfb56f6c5.jpg', '0', '0', '1406209234', '1406209276', '0', '0', '2', '1', '0', '0', 'upload/userimgthumb/20140724/2f1c3a343b9fb0cb7a2e6b8dfb56f6c5.jpg', '1');
INSERT INTO `live_advertising` VALUES ('153', '170', '轮播广告3', 'http://www.163.com', '', '0', null, 'upload/userimgthumb/20140724/2f1c3a343b9fb0cb7a2e6b8dfb56f6c5.jpg', '0', '0', '1406209234', '1406209264', '0', '0', '3', '1', '0', '0', 'upload/userimgthumb/20140724/2f1c3a343b9fb0cb7a2e6b8dfb56f6c5.jpg', '1');
INSERT INTO `live_advertising` VALUES ('155', '130', '客服5', '204721245', '', '0', null, 'upload/userimgthumb/20150518/21a102d8dc52015ff99fd99c2bc27a39.gif', '2', '0', '1431911544', '1432106784', '0', '0', '0', '1', '77', '22', 'upload/userimgthumb/20150518/21a102d8dc52015ff99fd99c2bc27a39.gif', '1');
INSERT INTO `live_advertising` VALUES ('156', '130', '客服6', '1469591921', '', '0', null, 'upload/userimgthumb/20150518/e11c3dec045ca05a00741696101890d3.gif', '2', '0', '1431911804', '1432106791', '0', '0', '0', '1', '77', '22', 'upload/userimgthumb/20150518/e11c3dec045ca05a00741696101890d3.gif', '1');

-- ----------------------------
-- Table structure for `live_article`
-- ----------------------------
DROP TABLE IF EXISTS `live_article`;
CREATE TABLE `live_article` (
  `articleid` int(11) NOT NULL AUTO_INCREMENT,
  `cateid` int(11) DEFAULT NULL,
  `title` varchar(120) NOT NULL,
  `keywords` varchar(120) NOT NULL,
  `desc` varchar(500) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(30) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `source` varchar(100) NOT NULL,
  `imgthumb` varchar(100) NOT NULL,
  `color` char(7) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `realhits` int(10) unsigned NOT NULL DEFAULT '0',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `mid` int(10) NOT NULL DEFAULT '0',
  `sort` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`articleid`)
) ENGINE=MyISAM AUTO_INCREMENT=165 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_article
-- ----------------------------
INSERT INTO `live_article` VALUES ('133', '156', '杭州市委副书记、市长邵占维出席签约仪式并致辞', '', '', '<p>\n	尊敬的<span style=\"color:#ff0000;\">慎海雄副总编、龚正副省长</span> \n</p>\n<p>\n	各位领导、各位来宾，朋友们：\n</p>\n<p>\n	大家好！\n</p>\n<p>\n	今天，很荣幸在这里见证新华浙江大宗商品交易中心暨新华（杭州）大宗商品指数发布中心正式签约。首先，我谨代表中共杭州市委、市人民政府，对这一重量级商品交易项目落户杭州西湖区表示热烈祝贺！对长期以来关心、支持并积极推动项目落地的新华社和浙江省有关领导、相关部门表示衷心感谢！\n</p>\n<p>\n	近年来，在中央的正确领导和省委、省政府的决策部署下，杭州围绕国务院“一基地四中心”战略定位，以建设区域性金融服务中心为目标，落实“十二五”金融业发展规划，在政策扶持、服务提升、平台培育和环境保障等方面积极创新、不断深化，金融产业发展成效明显。2012年前三季度，金融业实现增加值594.25亿元，增长10.0%，高于全市GDP增速1.9个百分点，占全市GDP比重达10.8%，成为我市国民经济支柱产业之一。金融业在稳定增长的同时，不断提升金融集聚，扩大辐射影响，拓展融资渠道，提高风险防范，为产业结构调整和发展方式转变提供有力支撑，也为我市经济社会健康发展提供重要保障。\n</p>\n<p>\n	一直以来，新华社对杭州的发展非常关心、关注和支持。新华浙江大宗商品交易中心落户西湖区黄龙商圈，为双方进一步深化交流、加强合作提供了重要平台，也为我市加快金融集聚区建设，促进金融业健康发展提供了有力助推。我们将以此为契机，积极引进先进服务理念和管理模式，突出产业辐射带动，促进项目优势互补，实现互惠双赢、共同发展。杭州将一如既往的营造最佳环境，为双方合作提供最有力的支持和最优质的服务。\n</p>\n<p>\n	衷心祝愿合作项目取得圆满成功。\n</p>\n<p>\n	谢谢！\n</p>\n<p>\n	&nbsp;\n</p>', '', '', '', 'upload/news/20140410/89594f579a568d32b3248ea5658a6a57.jpg', '', '0', '0', '1397024335', '1400148339', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('134', '156', '金融期货之父利奥·梅拉梅德', '', '金融期货之父利奥·梅拉梅德\n', '<p style=\"text-align:left;margin-left:20px;\">\n	<strong><span style=\"font-size:20px;\"><span style=\"font-size:large;\">开放·融合·创新·发展</span></span></strong> \n</p>\n<ul style=\"margin-left:30px;\">\n	<li>\n		<span style=\"color:#3366ff;\">· 开放：立足中国，面向世界</span> \n	</li>\n	<li>\n		<span style=\"color:#3366ff;\">· 融合：交流共享，融合贯通</span> \n	</li>\n	<li>\n		<span style=\"color:#3366ff;\">· 创新：开拓思路，创造未来</span> \n	</li>\n	<li>\n		<span style=\"color:#3366ff;\">· 发展：把握机遇，迎接挑战</span> \n	</li>\n</ul>\n<p style=\"text-align:left;\">\n	中国（国际）资产管理大会是以搭建资产管理者沟通、总结、创新平台的常设性专业高端会议，也是目前资产管理界规模最大、规格最高、代表性最强的年度盛会。\n</p>\n<p>\n	大宗商品高峰年会是大宗商品市场与中国政府监管机构之间的对话交流平台，也是期货市场、现货市场、电子商务平台、实体企业、贸易流通企业及资产管理行业加强合作的服务平台。\n</p>\n<p>\n	<span style=\"font-size:larger;\"><strong>1、中国（国际）资产管理大会是国内最有影响力的金融类大型会议</strong></span> \n</p>\n<p>\n	自2009年首届会议召开以来，大会已经得到国内外资产管理人士的广泛关注，每年有超过500位来自国内（外）期货公司、投资公司、证券公司、资产管理业知名人士、经济学专家及学者包括国内外风险投资机构出席，是国内最有影响力的金融类大型会议之一。\n</p>\n<p style=\"text-align:center;\">\n	<img alt=\"image002.jpg\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/3585e6df2f24e4efef372840dc5544c3.jpg\" height=\"218\" width=\"554\" /> \n</p>\n<p style=\"text-align:center;\">\n	金融期货之父利奥·梅拉梅德\n</p>\n<p style=\"text-align:left;\">\n	<span style=\"font-size:larger;\"><strong>2、中国（国际）资产管理大会是杭州西湖国际博览会签约项目</strong></span> \n</p>\n<p style=\"text-align:left;\">\n	从2011年开始，大会得到了杭州西湖国际博览会的认可，每年一届的会议成为“杭州西博会”的注册签约项目。\n</p>\n<p style=\"text-align:center;\">\n	<img alt=\"image003.jpg\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/10ae34c1c61ea4cfc29b0b311504c458.jpg\" height=\"217\" width=\"553\" /> \n</p>\n<p style=\"text-align:center;\">\n	（威廉指标的创始人）拉瑞·威廉姆斯、（外经贸大学WTO研究院院长）张汉林、（兴利投资董事长、经济学博士）杨宏森\n</p>\n<p style=\"text-align:left;\">\n	<span style=\"font-size:larger;\"><strong>3、会议规模高端、代表性强</strong></span> \n</p>\n<p style=\"text-align:left;\">\n	大会连续召开四年来，影响力一年比一年大。中央电视台1套、4套、13套等频道均在重要时段对大会进行过报道。新华通讯社、中央电视台是中国（国际）资产管理大会暨大宗商品高峰年会的支持媒体，中国期货信息网、搜狐网作为大会的综合门户网络支持媒体，和讯网作为大会的专业网络支持媒体，期货日报、都市快报将做为大会的平面支持媒体，所有媒体对大会进行前期宣传、会中报道、会后深入追踪的全方位立体报道。\n</p>\n<p style=\"text-align:left;\">\n	<span style=\"font-size:larger;\"><span style=\"color:#ff0000;\">演讲嘉宾</span></span> \n</p>\n<div>\n	<div>\n		<div>\n			<img alt=\"Leo Melamed\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/86793e36bcfd5fbfc82a0f3ae28e35a1.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>Leo Melamed</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:#ff0000;font-size:12px;\">全球金融期货之父</span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:#00bbf4;font-size:12px;\">芝加哥商品交易所集团终身荣誉主席</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"张健华\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/41a83a68d6c7394eee9a7655d3340633.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>张健华</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">中国人民银行杭州中心支行行长</span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:#00bbf4;font-size:12px;\">原中国人民银行研究局局长</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"刘志超\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/71da765eda469b69d36841c2ecd2a00f.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>刘志超</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">中国期货业协会会长</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"魏加宁\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/30ea748fb872a271a064772860f9b7a7.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>魏加宁</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">国务院发展研究中心宏观经济研究部副部长、研究员</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"毕吉耀\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/bff8f2e9027975a9e2d368a4e2c81192.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>毕吉耀</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">国家发改委对外经济研究所所长</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"张学仁\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/a17a1b22886d65b5712f89fff0b68832.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>张学仁</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">高级经济师</span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:#00bbf4;font-size:12px;\">郑商所第四、五届理事长</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"谭雅玲\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/4d6ba6a9cab10279035b1438704119dd.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>谭雅玲</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">中国外汇投资研究院院长</span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:#00bbf4;font-size:12px;\">中国国际经济关系学会常务理事</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"杨迈军\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/13ca3ce5d257f0428a2c35b90c6ea747.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>杨迈军</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">上海期货交易所理事长</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"张凡\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/4dd10cd53cc07d2a40779e572268b48b.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>张凡</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">郑州商品交易所理事长</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"刘兴强\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/c4a029dea22434fb403adfb1c414d177.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>刘兴强</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">大连商品交易所理事长</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"陈邦华\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/67216d25d3770bd870ebbe74d486a88d.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>陈邦华</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">期货日报社社长</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"杨宏森\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/dea93e0ee4334468b791839e92c64019.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>杨宏森</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">新华浙江大宗商品交易中心总经理</span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:#00bbf4;font-size:12px;\">中国资产管理研究院院长</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"胡俞越\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/9554179d0333919c1f5d433ee9ee29af.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>胡俞越</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">北京工商大学教授、博导</span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:#00bbf4;font-size:12px;\">著名证券期货专家</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"列高里•莫里斯\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/9db130d54d5ce5389613398a6d7a4d43.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>列高里•莫里斯</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">美国著名基金经理</span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:#00bbf4;font-size:12px;\">管理着价值64亿美元的资金</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"马厚德\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/8cef1397656f7ce09e34adae69ab5897.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>马厚德</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">美国资深教育专家</span> \n		</div>\n	</div>\n	<div>\n		<div>\n			<img alt=\"钮文新\" src=\"http://www.hongxinpme.com/d/file/news/jiaoyisuo/2014-01-13/1f1f7a1eabb54012eba05f9deb0891d3.jpg\" height=\"170\" width=\"140\" /> \n		</div>\n		<div>\n			<span style=\"color:#ffa800;font-size:16px;\"><strong>钮文新</strong></span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:red;font-size:12px;\">资深主持人</span> \n		</div>\n		<div>\n			<span style=\"font-family:宋体;color:#00bbf4;font-size:12px;\">CCTV证券资讯执行总编辑</span> \n		</div>\n	</div>\n</div>\n<p>\n	&nbsp;\n</p>', '', '', '', 'upload/news/20140410/200fd16fac9d5cb14fbba1e069f31efd.jpg', '', '0', '0', '1397026100', '1400148350', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('136', '156', '新华浙江大宗商品交易中心签约仪式', '', '', '<a href=\"http://www.zj.xinhuanet.com/2013news/dzspzs/index.htm\" target=\"_blank\">http://www.zj.xinhuanet.com/2013news/dzspzs/index.htm</a>', '', '', '', '', '', '0', '0', '1397026584', '1400148358', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('137', '156', '新华浙江大宗商品交易中心获得浙江省政府批复', '', '2013-02-21 15:51:45　来源：新华浙江大宗商品交易中心　', '<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	由新华社直属企业中经社控股有限公司和杭州兴利投资有限公司发起的新华浙江大宗商品交易中心（简称新华大宗），近日获得浙江省政府批复。该消息一经传出立即引起了国内外业内人士的广泛关注。中华人民共和国官方通讯社网站新华网发布了评论文章《市场大省谋求嬗变:新华浙江大宗商品交易中心获批》，对此进行了深度报道与高度肯定。\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	　　文章中笔者引用了浙江省省长李强的指示，“浙江是市场大省，但多的是专业市场，要素市场的大平台仍然缺乏。新华浙江大宗商品交易中心的建设，将是助力市场大省嬗变的很大亮点。”\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	　　浙江交易中心发起人之一、杭州兴利投资有限公司董事长杨宏森２０年前做实业出身，对于市场形态与实业转型间的关系有着深刻的理解。“市场经济本质上是一种交换经济。”他认为，浙江制造业向先进制造业转型升级，离不开大宗原材料定价与采购平台支撑。推动批发市场向现货电子交易迈进，组建大宗商品电子交易场所，既是浙江市场形态升级的必由之路，也是政府调控经济的手段市场化、决策科学化的必然要求。\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	　　作为组建浙江交易中心的升级举措，新华社已表示将组建新华（杭州）大宗商品指数发布中心，以增强中国在全球大宗商品领域的话语权。\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	　　新华社副总编辑慎海雄说，组建新华浙江大宗商品交易中心和新华（杭州）大宗商品指数发布中心，是新华社加快推进战略转型，依托国家级重大项目金融信息平台建设，服务地方经济转型发展的一项具体举措。２００８年以来，新华社金融信息平台已在上海、山东、黑龙江、湖南等地参与建设了近十家要素交易场所，有力支持了地方经济发展繁荣。\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	　　浙江经济界人士认为，在新华社的品牌优势、民企的机制优势以及杭州本土投资界的专业人才优势推动下，浙江交易中心运营后无疑将会成为国内大宗商品交易场所的一匹“黑马”，也意味着市场大省浙江加快走上市场嬗变之路。\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	　　文章原文地址：\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	　　<a href=\"http://news.xinhuanet.com/fortune/2013-02/21/c_114755101.htm\">http://news.xinhuanet.com/fortune/2013-02/21/c_114755101.htm</a> \n</p>', '', '', '新华浙江大宗商品交易中心　', '', '', '0', '0', '1397026681', '1400148367', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('138', '156', '新华社副总编慎海雄一行视察新华浙江大宗商品交易中心', '', '2013-04-03 17:10:51　来源：新华浙江大宗商品交易中心　点击量：4625　    打印', '<span style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">4月3日，新华社党组成员、副总编辑慎海雄一行在杭州市及西湖区领导的陪同下视察了新华浙江大宗商品交易中心（简称交易中心）临时办公驻地，并听取了交易中心杨宏森总经理等领导的工作汇报。<img src=\"http://www.hbot.cn/uploadfile/2013/0403/20130403051116150.jpg\" alt=\"\" /> \n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	<span style=\"font-size:12px;line-height:normal;font-family:arial, verdana, sans-serif;color:#222222;\"><span style=\"font-size:14px;\"><strong>新华社副总编慎海雄（右三）与新华浙江大宗商品交易中心总经理杨宏森（右二）合影</strong></span></span> \n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	<span style=\"color:#222222;font-family:Arial;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在工作会议上，杨宏森总经理向慎海雄介绍了交易中心的工作进程，并提出了对交易中心运营的未来构想。慎海雄对新华浙江大宗商品交易中心当前的工作给予了充分地肯定，并表示新华社将对交易中心的工作展开更有力地支持。</span> \n</p>\n<img src=\"http://www.hbot.cn/uploadfile/2013/0403/20130403051116318.jpg\" alt=\"\" /> \n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	慎海雄副总编指出，交易中心要在创新当中锁定风险，要充分发挥自身优势，整合周边市场及国内外交易市场的资源力量，做好已有产品（品种）的延伸。慎海雄还特别强调交易中心在运营期间要做好技术保障，一定要万无一失，并要求交易中心快速拓展市场，要为浙江地区经济服务，为现货企业服务。\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	　　浙江省委常委杭州市委书记黄坤明在会见新华浙江大宗商品交易中心总经理杨宏森先生时要求交易中心要控制风险，立足现货市场，为浙江经济转型升级做出贡献，为浙江实体经济服务。\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	　　新华浙江大宗商品交易中心是由新华社直属企业中经社控股有限公司与杭州兴利投资有限公司共同发起的，立足浙江、辐射全国的大宗商品交易市场。交易中心以增强我国对大宗商品定价的话语权、力争使我国成为大宗进口商品的全球定价中心为愿景目标，突出“交易规模大、市场参与度高”等特点，力求让更多企业群体与个人参与到市场中来，加速杭州、浙江以及中国实体经济的发展。\n</p>\n</span>', '', '', '', '', '', '0', '0', '1397026902', '1400148378', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('139', '156', '中国外汇投资研究院院长谭雅玲一行调研新华浙江大宗商品交易中心', '', '2013-05-15 22:46:34　来源：新华浙江大宗商品交易中心　点击量：43331　    打印', '<span style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;line-height:24px;background-color:#FFFFFF;\">5月15日，中国外汇投资研究院院长、中国国际经济关系学会常务理事谭雅玲女士及外交部王大使一行莅临新华浙江大宗商品交易中心调研。新华浙江大宗商品交易中心杨宏森总经理等领导亲切会见。<img src=\"http://www.hbot.cn/uploadfile/2013/0515/20130515104746731.jpg\" alt=\"\" /></span>', '', '', '', '', '', '0', '0', '1397027034', '1400148387', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('140', '156', '浙江省金融办副主任徐素荣一行到中心考察调研', '', '2013-05-16 09:38:42　来源：新华浙江大宗商品交易中心　点击量：4656　    打印', '<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;text-indent:2em;\">\n	5月8日，浙江省金融办副主任徐素荣、非银机构处处长王响亮一行到新华浙江大宗商品交易中心考察调研。\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;text-indent:2em;\">\n	徐素荣指出，朱从玖副省长非常关心包括新华浙江大宗商品交易中心在内的大宗商品交易市场建设，并要求相关政府部门做好服务，积极配合交易中心建设的各项工作。徐素荣表示，省金融办非常重视要素市场的建设，希望交易中心在规范经营的前提下，有更多的创新和突破，更好地为浙江实体经济服务。接下来，相关部门将采取积极措施，打击地下“炒金、炒汇”的非法经营活动，也会对现有交易市场不规范经营行为进行清查。\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;text-indent:2em;\">\n	徐素荣指出，一方面，规范化经营要求大宗商品交易平台严格按照国家相关规定运营，各个交易平台必须具备严密规范的风险控制体制，做好风险“防火墙”。另一方面，交易中心要敢于创新，探索出与期货交易所、证券交易所、黄金交易所的合作路径，拓展业务范围，力争获得浙江优势大宗商品的定价权和指导权。\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;text-indent:2em;\">\n	此外，省金融办将积极配合新华（杭州）大宗商品指数发布中心的研发工作，努力扩大新华（杭州）大宗商品指数的影响力。同时借助交易中心的平台，力促浙商和浙江资本回归。\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;text-indent:2em;\">\n	新华浙江大宗商品交易中心总经理杨宏森介绍了交易中心的工作进展并表示，交易中心将以服务现货企业为核心，为工业企业提供物流金融和供应链金融的服务。此外，交易中心已与证监会下属的中国期货业协会初步商谈，拟共同推动打通期、现货合作通道，为丰富和优化中国大宗商品交易市场结构贡献力量。<img src=\"http://www.hbot.cn/uploadfile/2013/0516/20130516094459677.jpg\" alt=\"\" /> \n</p>', '', '', '', '', '', '0', '0', '1397027114', '1400148395', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('141', '156', '浙江省商务厅领导调研新华浙江大宗商品交易中心', '', '2013-05-16 09:51:29　来源：新华浙江大宗商品交易中心　点击量：218　    打印', '<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	　5月7日，受浙江省商务厅副厅长徐焕明委托，商务厅市场体系建设处副处长杨颖俊一行到新华浙江大宗商品交易中心调研。\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	　　新华浙江大宗商品交易中心总经理杨宏森详细介绍了交易中心服务实体经济的根本理念和设计模式。商务厅调研组肯定了交易中心的理念和制度设计并提出，浙江是市场大省，但在“无形”的大宗现货交易市场建设方面还有待提升。新华浙江大宗商品交易中心具备先进理念、深厚的相关工作基础，希望能起到带头作用，引导省内同业共同发展，希望交易中心在发起设立浙江大宗商品现货业协会事项上发挥积极作用。<img src=\"http://www.hbot.cn/uploadfile/2013/0516/20130516095259451.jpg\" alt=\"\" /><img src=\"http://www.hbot.cn/uploadfile/2013/0516/20130516095314119.jpg\" alt=\"\" /> \n</p>', '', '', '', '', '', '0', '0', '1397027231', '1400148403', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('142', '156', '《中国证券报》、《投资收藏导刊》等领导考察新华浙江大宗商品交易中心', '', '2013-06-07 11:23:59　来源：新华浙江大宗商品交易中心　点击量：132　    打印', '<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	4月26日，《中国证券报》副总经理、《投资收藏导刊》杂志社社长杨江瀚一行到新华浙江大宗商品交易中心交流考察，与交易中心总经理杨宏森洽谈合作创建艺术品交易平台事宜。\n</p>\n<p style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;font-size:14px;background-color:#FFFFFF;\">\n	　　双方一致认为，基于新华浙江大宗商品交易中心创建艺术品交易平台，是一项符合促进文化产业发展的导向工程，也是建设艺术品市场诚信体系，打造集金融信息服务与艺术品投资于一体的重要尝试。双方将共同探索以产业化和国际化为标准，制订合理商业模式，在遵守相关法律法规和尊重知识产权保护规则等前提下，适时开展规划设计、立项申报、搭建平台等工作。\n</p>', '', '', '', '', '', '0', '0', '1397027274', '1400148411', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('143', '156', '交易中心总经理杨宏森与郑州商品交易所常务副总经理会谈', '', '2013-06-07 11:38:02　来源：新华浙江大宗商品交易中心　点击量：219　    打印', '<h1 style=\"font-size:22px;color:#0B3B8C;font-family:Georgia, Times, serif;text-align:center;background-color:#FFFFFF;\">\n	<br />\n</h1>\n<div class=\"meta singlemeta\" style=\"margin:0px;padding:3px 0px 0px;color:#777777;text-align:center;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\n	<br />\n</div>\n<span class=\"blank20\" style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;line-height:24px;background-color:#FFFFFF;\"></span> \n<div class=\"content\" style=\"margin:0px;padding:0px;font-size:14px;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\n	<p>\n		　　4月9日至10日，新华浙江大宗商品交易中心总经理杨宏森带队前往郑州商品交易所学习考察。\n	</p>\n	<p>\n		　　郑州商品交易所党委副书记、常务副总经理郭晓利介绍了郑商所运行情况。郭晓利认为，期货市场和现货市场是不冲突的，是相互补充的，期货是现货的基础，期货市场解决不了个性化问题，个性化交易要靠现货市场解决。他认为，郑州商品交易所和新华浙江大宗商品交易中心可以开展合作。\n	</p>\n</div>', '', '', '', '', '', '0', '0', '1397027314', '1400148329', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('144', '156', '杭州市发改委领导到新华浙江大宗商品交易中心调研', '', '', '<h1 style=\"font-size:22px;color:#0B3B8C;font-family:Georgia, Times, serif;text-align:center;background-color:#FFFFFF;\">\n	<br />\n</h1>\n<div class=\"meta singlemeta\" style=\"margin:0px;padding:3px 0px 0px;color:#777777;text-align:center;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\n	2013-06-07 11:38:37　来源：<a href=\"http://www.hbot.cn/\">新华浙江大宗商品交易中心</a>　点击量：<span id=\"hits\">172</span>　&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"http://www.hbot.cn/html/2013/jysdt_0607/124751.html\">打印</a> \n</div>\n<span class=\"blank20\" style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;line-height:24px;background-color:#FFFFFF;\"></span> \n<div class=\"content\" style=\"margin:0px;padding:0px;font-size:14px;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\n	<p>\n		　　4月24日上午，杭州市发改委副主任朱师钧、协调处处长刘玲、西湖区发改局副局长蒋庭铠一行到新华浙江大宗商品交易中心调研，就支持推动交易中心组建、运行等事项征求交易中心负责人意见。\n	</p>\n	<p>\n		　　当天下午，杭州市金融办、发改委、国土局、规划局、城管局、工投集团、西湖区等相关部门召开专题会议，就推动新华浙江大宗商品交易中心组建等工作进行研究部署。\n	</p>\n</div>', '', '', '', '', '', '0', '0', '1397027345', '1400148321', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('147', '156', '新华大宗福建贵金属运营中心授牌成立', '', '', '<div class=\"meta singlemeta\" style=\"margin:0px;padding:3px 0px 0px;color:#777777;text-align:center;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\n	2014-03-23 12:46:26　来源：<a href=\"http://www.hbot.cn/\">新华浙江大宗商品交易中心</a>　点击量：<span id=\"hits\">2196</span>　&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"http://www.hbot.cn/html/2014/jysdt_0323/156046.html\">打印</a> \n</div>\n<span class=\"blank20\" style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;line-height:24px;background-color:#FFFFFF;\"></span> \n<div class=\"content\" style=\"margin:0px;padding:0px;font-size:14px;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\n	<p style=\"text-indent:2em;\">\n		<span style=\"font-family:arial, helvetica, sans-serif;\">3月23日，新华浙江大宗商品交易中心福建贵金属运营中心正式成立。新华大宗总经理杨宏森，新华社福建分社党组成员、办公室主任林国良，及新华大宗高管团队等出席了授牌仪式。</span> \n	</p>\n	<p style=\"text-indent:0em;text-align:center;\">\n		<span style=\"font-family:arial, helvetica, sans-serif;\"><img title=\"杨宏森总经理发表致辞\" src=\"http://www.hbot.cn/uploadfile/46441395551905.jpg\" style=\"width:600px;height:410px;\" border=\"0\" height=\"410\" width=\"600\" /></span> \n	</p>\n	<p style=\"text-align:center;text-indent:2em;\">\n		<strong><span style=\"font-family:arial, helvetica, sans-serif;\">杨宏森总经理发表致辞</span></strong> \n	</p>\n	<p style=\"text-indent:2em;\">\n		<span style=\"font-family:arial, helvetica, sans-serif;\">区域运营中心计划是新华大宗为加快发展、加强对各地重点市场的把控、加强对当地会员单位的政策指导和规范管理而推出的遍及全国的综合运营体系。继重庆、湖北、河南、江苏区域运营中心之后，新华大宗第五家区域运营中心在福建落户扎根。</span> \n	</p>\n	<p style=\"text-indent:0em;text-align:center;\">\n		<span style=\"font-family:arial, helvetica, sans-serif;\"><img title=\"林国良主任发表致辞\" src=\"http://www.hbot.cn/uploadfile/30791395551905.jpg\" style=\"width:600px;height:410px;\" border=\"0\" height=\"410\" width=\"600\" /></span> \n	</p>\n	<p style=\"text-align:center;text-indent:2em;\">\n		<strong><span style=\"font-family:arial, helvetica, sans-serif;\">林国良主任发表致辞</span></strong> \n	</p>\n	<p style=\"text-indent:2em;\">\n		<span style=\"font-family:arial, helvetica, sans-serif;\">新华大宗总经理杨宏森亲自为福建贵金属运营中心授牌。杨宏森总经理表示福建贵金属运营中心的成立，标志着新华大宗团队不断发展壮大，有利于规范当地的大宗商品运营市场，同时对引导全国商品交易市场的合规发展具有示范、推动作用。在发言中，杨总经理多次强调合规经营的必要性，对福建运营中心的合规经营、投资者权益保护工作等给予指导与嘱托。</span> \n	</p>\n	<p style=\"text-indent:0em;text-align:center;\">\n		<span style=\"font-family:arial, helvetica, sans-serif;\"><img title=\"杨宏森总经理（左二）与林国良主任（右一）、中国外汇投资研究院院长谭雅铃（左一）、新华大宗012号综合会员董事长刘晓明（右二）\" src=\"http://www.hbot.cn/uploadfile/63791395551905.jpg\" style=\"width:600px;height:410px;\" border=\"0\" height=\"410\" width=\"600\" /></span> \n	</p>\n	<p style=\"text-align:center;text-indent:2em;\">\n		<strong><span style=\"font-family:arial, helvetica, sans-serif;\">杨宏森总经理（左二）与林国良主任（右一）、中国外汇投资研究院院长谭雅铃（左一）、新华大宗012号综合会员董事长刘晓明（右二）</span></strong> \n	</p>\n	<p style=\"text-indent:2em;\">\n		<span style=\"font-family:arial, helvetica, sans-serif;\">新华社福建分社办公室主任林国良在仪式中致辞，他提出新华社福建分社将依照新华社总社的整体部署与指导，积极主动采取各项措施对新华大宗福建贵金属运营中心实行严格监管，充分利用媒体网络进行相关政策指导及监督管理。他同时表示希望会员单位主动依照相关法规政策进行合规经营，通过多方渠道进行投资者教育，尊重并听取投资者的诉求，以更积极的姿态把控话语权。</span> \n	</p>\n</div>', '', '', '', '', '', '0', '0', '1397027529', '1400148313', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('148', '156', '新华大宗总经理杨宏森授牌江苏贵金属运营中心', '', '', '<h1 style=\"font-size:22px;color:#0B3B8C;font-family:Georgia, Times, serif;text-align:center;background-color:#FFFFFF;\">\n	<br />\n</h1>\n<div class=\"meta singlemeta\" style=\"margin:0px;padding:3px 0px 0px;color:#777777;text-align:center;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\n	2014-03-15 12:01:01　来源：<a href=\"http://www.hbot.cn/\">新华浙江大宗商品交易中心</a>　点击量：<span id=\"hits\">1323</span>　&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"http://www.hbot.cn/html/2014/jysdt_0315/155535.html\">打印</a> \n</div>\n<span class=\"blank20\" style=\"color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;line-height:24px;background-color:#FFFFFF;\"></span> \n<div class=\"content\" style=\"margin:0px;padding:0px;font-size:14px;color:#333333;font-family:Tahoma, Arial, 宋体, sans-serif;background-color:#FFFFFF;\">\n	<p style=\"text-indent:2em;\">\n		3月15日，新华浙江大宗商品交易中心总经理杨宏森率新华大宗高管团队赴南京参加新华大宗20号会员单位开业典礼，并授牌新华大宗江苏贵金属运营中心，至此，新华大宗第四家区域贵金属运营中心正式宣告成立。新华社江苏分社党委书记、社长冯诚出席了仪式。\n	</p>\n	<p style=\"text-align:center;\">\n		<img src=\"http://www.hbot.cn/uploadfile/15671394856729.gif\" style=\"width:600px;height:410px;\" /> \n	</p>\n	<p style=\"text-align:center;\">\n		<strong>20号会员代表许昌国（左）、杨宏森总经理（中）、20号会员代表徐明锋（右）合影</strong> \n	</p>\n	<p style=\"text-align:center;\">\n		<img src=\"http://www.hbot.cn/uploadfile/27681394856729.gif\" style=\"width:600px;height:410px;\" /> \n	</p>\n	<p style=\"text-align:center;\">\n		<strong>杨宏森总经理（左一）、冯诚社长（左二）参加仪式</strong> \n	</p>\n	<p style=\"text-indent:2em;\">\n		冯诚社长在仪式中发言提到，新华大宗是新华社积极推动地方经济转型升级，服务实体经济发展的重要举措，新华社江苏分社将积极参与监督和管理，对当地贵金属运营中心进行相关规范运营的帮助和指导，推动江苏地区的大宗商品现货市场健康发展。\n	</p>\n	<p style=\"text-align:center;\">\n		<img src=\"http://www.hbot.cn/uploadfile/76031394856729.gif\" style=\"width:600px;height:410px;\" /> \n	</p>\n	<p style=\"text-align:center;\">\n		<strong>冯诚社长发言</strong> \n	</p>\n	<p style=\"text-indent:2em;\">\n		在仪式中，杨宏森总经理表示，江苏是许多大宗商品的产销聚集地，新华大宗在江苏设立贵金属运营中心能够充分发挥地域优势加强自身在江浙地区的影响力，通过引导产业核心地区的健康规范发展带动整个国内市场走向进一步规范、成熟。他同时表示，在3月15日消费者权益日授牌江苏贵金属运营中心，意义独特，标志着新华大宗能进一步营造市场良好环境，引导秩序，最终促进市场健康发展。\n	</p>\n	<p style=\"text-align:center;\">\n		<img src=\"http://www.hbot.cn/uploadfile/65791394856729.gif\" style=\"width:600px;height:410px;\" /> \n	</p>\n	<p style=\"text-align:center;\">\n		<strong>杨宏森总经理发言</strong> \n	</p>\n</div>', '', '', '', '', '', '0', '0', '1397027573', '1400148297', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('159', '156', '中国大妈抢金周年祭：金价比去年同期还便宜！', '中国大妈', '', '中国大妈抢金周年祭：金价比去年同期还便宜!\n<p>\n	<strong><span style=\"font-size:16px;\"><br />\n</span></strong> \n</p>\n<p>\n	<span style=\"font-size:16px;\">　　去年清明小长假期间，恰逢国际金价大跌，“中国大妈”疯狂抢金，一战成名。时隔一年，虽然近期黄金价格与去年同期相比，每克差不多便宜了60元，但这些大妈早就没有抢金的热情了。</span> \n</p>\n<p>\n	<span style=\"font-size:16px;\"><br />\n</span> \n</p>\n<p>\n	<span style=\"font-size:16px;\">　　去年4月抢购了不少金饰品的叶大妈抱怨道：“什么黄金便宜，都是忽悠人的，要想靠买黄金赚钱，不现实，弄点压压箱底倒是可以。我去年买了5万元黄金，都是365元一克抢来的，现在的价格比那时候便宜多了，我去看过，算上优惠什么的，每克差不多310元左右就够了，真是亏都亏死了。”</span> \n</p>\n<p>\n	<span style=\"font-size:16px;\"><br />\n</span> \n</p>\n<p>\n	<span style=\"font-size:16px;\">　　中国黄金的销售人员透露，虽然还没到月底，但可以预见今年4月的销售额和去年同期是根本无法比的。“清明小长假期间，虽然买黄金的人看起来挺多的，但大多数是买小饰品，量并不是很大，还有就是买结婚的金饰，和去年那种大手笔买入完全不同——去年4月买黄金的，大部分是大单。”</span> \n</p>\n<p>\n	<span style=\"font-size:16px;\"><br />\n</span> \n</p>\n<p>\n	<span style=\"font-size:16px;\">　　进入2014年，在全球经济弱势复苏、国际地缘政治不稳以及金融市场动荡的大背景下，黄金的避险价值再度显现，金价也触底回升，从最低点1200美元每盎司涨至逾1300美元每盎司。在这波金价反弹行情中，不见了中国大妈的身影。但相比去年，她们其实更有理由出手购买黄金。</span> \n</p>\n<p>\n	<span style=\"font-size:16px;\"><br />\n</span> \n</p>\n<p>\n	<span style=\"font-size:16px;\">　　中国大妈们受到金融学知识、过往背景等因素所限，大都不敢投资金融衍生品(如黄金期货)等高风险标的，但面对着极低的活期存款利率，她们又迫切需要寻找好的投资品种、更高的投资回报。当黄金价格下跌看似足够多的时候，头脑灵活的大妈们就会一窝蜂冲向金店“抄底”，购买实物黄金。这充分显示出她们“跟随头羊”、跟着感觉走的投资特点。</span> \n</p>\n<p>\n	<span style=\"font-size:16px;\"><br />\n</span> \n</p>\n<p>\n	<span style=\"font-size:16px;\">　　显然，这样的大妈们不懂“投资学”，也不会运用风险/收益理念来衡量投资组合，面对生存(医疗、养老、通胀等)压力，她们的投资更像是一种本能的行为。</span> \n</p>\n<p>\n	<span style=\"font-size:16px;\"><br />\n</span> \n</p>\n<p>\n	<span style=\"font-size:16px;\">　　就目前而言，中国可供居民选择的投资工具不多，不少投资者选择股市。研究显示，黄金白银价格与中国的股票价格和利率(以SHIBOR为代表)的相关度极低，基本为零。因此， 对于中国投资者而言，将贵金属加入投资组合中可降低风险，即“不把鸡蛋放在同一个篮子里”。最最起码，它可以起到很好的分散风险作用。</span> \n</p>\n<p>\n	<span style=\"font-size:16px;\"><br />\n</span> \n</p>\n<p>\n	<span style=\"font-size:16px;\">　　所以，抢金虽不值得提倡，但贵金属依然是资产配置中合理的一环。</span> \n</p>', '非贝投资', '', '非贝投资', '', '', '0', '0', '1398168098', '1400148245', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('160', '156', '新华社龙新南副社长肯定新华大宗工作：利国、利省、利企、利民', '新华大宗商品', '新华社龙新南副社长肯定新华大宗工作：利国、利省、利企、利民', '<p style=\"text-indent:2em;\">\n	<span style=\"font-size:14px;\">4月24日，新华社副社长龙新南，新华社新闻信息中心主任张永平，新华社新媒体中心常务副主任陈凯星，新华社总经理室副总经理陈磊，新华社人事局国内分社处处长张海鹰在新华社浙江分社社长、党组书记朱国贤，新华社浙江分社副社长、总编辑、党组副书记何玲玲陪同下莅临新华大宗考察指导。杨宏森总经理率新华大宗高管团队向龙新南副社长一行作了工作汇报。</span> \n</p>\n<p style=\"text-align:center;\">\n	<img style=\"width:600px;height:410px;\" src=\"http://www.hbot.cn/uploadfile/611398332674.jpg\" /> \n</p>\n<p style=\"text-align:center;\">\n	<strong><span style=\"font-size:14px;\">杨宏森总经理（左四）与龙新南副社长（右四）率领的新华社领导一行合影</span></strong> \n</p>\n<p style=\"text-indent:2em;\">\n	<span style=\"font-size:14px;\">杨宏森总经理就新华大宗的发展进程及取得的成绩作了汇报。他在发言中说，新华大宗首要任务是立足现货市场，服务实体经济。迄今为止，在建设过程中，新华大宗严格按照新华社要求，打造“公平、公正、公开”的三公平台，为浙江乃至全国的优质生产要素产品提供了产供销短平快对接的有效贸易平台，在帮助现货企业拓展销售渠道，解决产能过剩，提供供应链融资实现可持续发展，促进产业转型升级方面提供了稳定的助力，真正起到了要素平台服务实体经济的功能。</span> \n</p>\n<p style=\"text-align:center;\">\n	<img style=\"width:600px;height:410px;\" src=\"http://www.hbot.cn/uploadfile/35321398332674.jpg\" /> \n</p>\n<p style=\"text-align:center;\">\n	<strong><span style=\"font-size:14px;\">杨宏森总经理汇报工作</span></strong> \n</p>\n<p style=\"text-indent:2em;\">\n	<span style=\"font-size:14px;\">龙新南副社长在听取杨宏森总经理的工作汇报后高度赞扬：新华浙江大宗商品交易中心从事的是利国、利省、利企、利民的事业。他说，大宗商品市场是我国市场经济的重要组成部分，建设新华大宗，对于完善要素平台，稳定市场发展，服务实体经济非常必要。目前，新华大宗的发展起步很好，步伐稳健，把握准了服务实体经济的发展方向，特别是在当前我国经济相对放缓的背景下起到了稳定器的作用。</span> \n</p>\n<p style=\"text-indent:2em;\">\n	<span style=\"font-size:14px;\">龙新南副社长在肯定新华大宗取得的成绩时，同时也对未来发展提出了三大要求。他首先指出，要逐步完善平台运营体系，加深平台市场化程度，体现平台“公平、公正性”，切实服务现货企业，实体经济；他表示，作为新华社参与的市场平台，不仅要重视“经济效益”，更要重视“社会效益”，积极承担社会责任，同时要时刻维护新华社品牌优势，努力实现更大品牌价值；在新华大宗建设过程中，他强调要在创新技术孵化及专业人才培养方面加大投入，不仅要博采众长，集合各方面优势，融会贯通，同时要结合实际进行创新，不断推动平台领先发展。</span> \n</p>\n<p style=\"text-align:center;\">\n	<img style=\"width:600px;height:410px;\" src=\"http://www.hbot.cn/uploadfile/81521398332674.jpg\" /> \n</p>\n<p style=\"text-align:center;\">\n	<strong><span style=\"font-size:14px;\">龙新南副社长发表讲话</span></strong> \n</p>\n<p style=\"text-indent:2em;\">\n	<span style=\"font-size:14px;\">龙新南副社长最后勉励新华大宗，新华社各分社将在全国全力支持新华大宗开展的业务和工作，他也表示在新华社和浙江省政府的支持下相信新华大宗一定能走稳、走好，走出路子，迈出成效，为浙江省乃至全国实体经济发展做出贡献。</span> \n</p>', '浙江新华大宗商品交易中心', 'www.hbot.cn', 'www.hbot.cn', '', '', '0', '0', '1398335561', '1400148237', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('162', '153', '3月28日白银ETF持仓量持平10164.74吨', '', '', '<p>\n	<strong>3月28日讯</strong>——ETF数据中心显示，截至周五（3月28日），美国iShares Silver Trust（SLV）公司的ETF白银净持仓持平10164.74吨。\n</p>\n<p>\n	据统计，iShares Silver Trust（SLV）公司的白银ETF净持仓总量为326803953.40盎司，价值6911520858美元。\n</p>\n<div>\n	&nbsp;\n</div>\n<div class=\"ef_c\">\n	<ul>\n		<li class=\"tit\">\n			更新时间（北京）\n		</li>\n		<li class=\"tit\">\n			净持仓量（盎司）\n		</li>\n		<li class=\"tit\">\n			净持仓量（吨）\n		</li>\n		<li class=\"tit\">\n			总价值（美元）\n		</li>\n		<li class=\"tit last\">\n			增减（吨）\n		</li>\n		<li>\n			2014-3-28\n		</li>\n		<li>\n			326803953.40\n		</li>\n		<li>\n			10164.74\n		</li>\n		<li>\n			6911520858\n		</li>\n		<li class=\"last\">\n			0.00\n		</li>\n	</ul>\n</div>', '', '', '', '', '', '0', '0', '1400140195', '0', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('163', '152', '2014年03月26日白银重点关注经济数据', '', '', '15:00 德国 4月Gfk消费者信心指数★★★<br />\n15:00 德国 2月实际零售销售月率(3/26-3/31)★★★<br />\n15:00 英国 3月Nationwide房价指数月率(3/26-4/6)★★★<br />\n19:00 美国 3月21日当周MBA抵押贷款申请活动指数★★<br />\n20:30 美国 2月耐用品订单月率★★★<br />\n21:45 美国 3月Markit服务业PMI初值★★<br />\n22:30 美国 3月22日当周EIA原油库存', '', '', '', '', '', '0', '0', '1400140443', '0', '0', '0', '0', '1');
INSERT INTO `live_article` VALUES ('164', '152', '03月27日鸿鑫御隆晚评', '', '', '消息面分析：<br />\n美国圣路易斯联储布拉德(James \nBullard)周四(3月27日)在香港表示，将通胀目标由2%调高至4%并不是好主意。经济方面，布拉德称，预计美国第一季GDP会走软，但料第二、\n第三及第四季将加速增长。货币方面，布拉德称，美元走强是货币政策的一个副作用。美国圣路易斯联储布拉德(James \nBullard)周四(3月27日)在香港表示，将通胀目标由2%调高至4%并不是好主意。经济方面，布拉德称，预计美国第一季GDP会走软，但料第二、\n第三及第四季将加速增长。货币方面，布拉德称，美元走强是货币政策的一个副作用。美国和欧盟周三(3月26日)同意，针对俄罗斯在乌克兰的所作所为，将通\n力合作准备对其实施更加严厉的经济制裁，包括能源领域；它们还将努力让欧洲减少对俄罗斯天然气的依赖。对于欧盟要求扩大美国对欧洲天然气出口以减少对俄罗\n斯供应的依赖，美国总统奥巴马表示，正在磋商中的跨大西洋贸易协定将使此类交易更容易获批。但他指出，欧洲也应该开发自己的能源资源——暗指页岩气提取和\n使用核能遭遇环境保护阻力，不要只是指望美国。欧盟驻华盛顿大使在工作午宴上向欧盟高层传达奥巴马的话称“你不能只是依赖其他国家的能源，即便要付出一些\n代价，面临下行风险”。<br />\n<br />\n技术面分析：<br />\n今日银价延续弱势走势，呈现出震荡下跌走势，并再度刷新几周新低，整体从日线均线系统来看空头向下排列，且BOLL有继续向下延伸趋势，综合来看白银后期\n将继续看空，日内短周期从4小时图来看K线价格沿着BOLL下轨向下运行，且KDJ死叉向下，预计晚间价格反弹无力将继续下探。<br />\n<br />\n建议仅供参考，提醒广大投资者时刻注意账户风险率的变动，做好风险控制工作。', '', '', '', '', '', '0', '0', '1400140467', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `live_attach_cate`
-- ----------------------------
DROP TABLE IF EXISTS `live_attach_cate`;
CREATE TABLE `live_attach_cate` (
  `attachcateid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(100) DEFAULT NULL,
  `detailid` bigint(20) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`attachcateid`),
  UNIQUE KEY `confid` (`attachcateid`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_attach_cate
-- ----------------------------
INSERT INTO `live_attach_cate` VALUES ('58', 'admin/agent/edit_agent/1', '1', '1374132403');
INSERT INTO `live_attach_cate` VALUES ('59', 'admin/agent/add_agent', '3', '1374132891');
INSERT INTO `live_attach_cate` VALUES ('60', 'admin/agent/add_agent', '4', '1374133214');
INSERT INTO `live_attach_cate` VALUES ('61', 'admin/agent/add_agent', '5', '1374214284');
INSERT INTO `live_attach_cate` VALUES ('62', 'admin/agent/add_agent', '6', '1374214390');
INSERT INTO `live_attach_cate` VALUES ('63', 'admin/agent/add_agent', '7', '1374214521');
INSERT INTO `live_attach_cate` VALUES ('64', 'admin/agent/add_agent', '8', '1374214582');
INSERT INTO `live_attach_cate` VALUES ('65', 'admin/agent/add_agent', '9', '1374214830');
INSERT INTO `live_attach_cate` VALUES ('66', 'admin/agent/add_agent', '10', '1374215022');
INSERT INTO `live_attach_cate` VALUES ('67', 'admin/agent/add_agent', '11', '1374215099');
INSERT INTO `live_attach_cate` VALUES ('68', 'admin/agent/add_agent', '12', '1374215235');
INSERT INTO `live_attach_cate` VALUES ('69', 'admin/agent/add_agent', '13', '1374215255');
INSERT INTO `live_attach_cate` VALUES ('70', 'admin/agent/add_agent', '14', '1374215449');
INSERT INTO `live_attach_cate` VALUES ('71', 'admin/agent/edit_agent/26', '26', '1375495495');
INSERT INTO `live_attach_cate` VALUES ('72', 'admin/article/editArticle/151', '151', '1389168658');
INSERT INTO `live_attach_cate` VALUES ('80', 'production', '17', '1389838607');
INSERT INTO `live_attach_cate` VALUES ('81', 'production', '18', '1389838790');
INSERT INTO `live_attach_cate` VALUES ('82', 'production', '19', '1389838817');
INSERT INTO `live_attach_cate` VALUES ('87', 'production', '20', '1393478521');
INSERT INTO `live_attach_cate` VALUES ('88', 'production', '21', '1393478685');
INSERT INTO `live_attach_cate` VALUES ('89', 'production', '22', '1393481728');
INSERT INTO `live_attach_cate` VALUES ('90', 'production', '23', '1393481785');
INSERT INTO `live_attach_cate` VALUES ('91', 'production', '26', '1393481939');
INSERT INTO `live_attach_cate` VALUES ('92', 'production', '27', '1393481991');
INSERT INTO `live_attach_cate` VALUES ('93', 'production', '28', '1393482043');
INSERT INTO `live_attach_cate` VALUES ('94', 'production', '29', '1393482098');
INSERT INTO `live_attach_cate` VALUES ('95', 'production', '70', '1393482463');
INSERT INTO `live_attach_cate` VALUES ('96', 'production', '71', '1393482489');
INSERT INTO `live_attach_cate` VALUES ('97', 'production', '72', '1393482509');
INSERT INTO `live_attach_cate` VALUES ('98', 'production', '74', '1393482608');
INSERT INTO `live_attach_cate` VALUES ('99', 'production', '75', '1393482687');
INSERT INTO `live_attach_cate` VALUES ('100', 'production', '69', '1393482774');
INSERT INTO `live_attach_cate` VALUES ('101', 'production', '25', '1393482804');
INSERT INTO `live_attach_cate` VALUES ('102', 'production', '24', '1393482830');
INSERT INTO `live_attach_cate` VALUES ('103', 'production', '73', '1393482851');
INSERT INTO `live_attach_cate` VALUES ('104', 'article', '88', '1395988540');
INSERT INTO `live_attach_cate` VALUES ('105', 'article', '89', '1395988581');
INSERT INTO `live_attach_cate` VALUES ('106', 'article', '90', '1395988612');
INSERT INTO `live_attach_cate` VALUES ('107', 'article', '91', '1395988635');
INSERT INTO `live_attach_cate` VALUES ('108', 'article', '92', '1395988692');
INSERT INTO `live_attach_cate` VALUES ('109', 'article', '93', '1395988717');
INSERT INTO `live_attach_cate` VALUES ('110', 'article', '94', '1395988738');
INSERT INTO `live_attach_cate` VALUES ('111', 'article', '95', '1395988760');
INSERT INTO `live_attach_cate` VALUES ('112', 'article', '96', '1395988794');
INSERT INTO `live_attach_cate` VALUES ('113', 'article', '97', '1395988815');
INSERT INTO `live_attach_cate` VALUES ('114', 'article', '98', '1395988838');
INSERT INTO `live_attach_cate` VALUES ('115', 'article', '99', '1395988857');
INSERT INTO `live_attach_cate` VALUES ('116', 'article', '100', '1395988880');
INSERT INTO `live_attach_cate` VALUES ('117', 'article', '101', '1395988900');
INSERT INTO `live_attach_cate` VALUES ('118', 'article', '102', '1395988924');
INSERT INTO `live_attach_cate` VALUES ('119', 'article', '103', '1395988949');
INSERT INTO `live_attach_cate` VALUES ('120', 'article', '104', '1395988970');
INSERT INTO `live_attach_cate` VALUES ('121', 'article', '121', '1396227010');
INSERT INTO `live_attach_cate` VALUES ('122', 'article', '122', '1396227026');
INSERT INTO `live_attach_cate` VALUES ('123', 'article', '123', '1396227050');
INSERT INTO `live_attach_cate` VALUES ('124', 'article', '124', '1396227083');
INSERT INTO `live_attach_cate` VALUES ('125', 'article', '125', '1396227102');
INSERT INTO `live_attach_cate` VALUES ('126', 'article', '126', '1396227121');
INSERT INTO `live_attach_cate` VALUES ('127', 'article', '127', '1396227139');
INSERT INTO `live_attach_cate` VALUES ('128', 'article', '128', '1396227158');
INSERT INTO `live_attach_cate` VALUES ('129', 'article', '129', '1396227178');
INSERT INTO `live_attach_cate` VALUES ('130', 'article', '130', '1396227223');

-- ----------------------------
-- Table structure for `live_attach_detail`
-- ----------------------------
DROP TABLE IF EXISTS `live_attach_detail`;
CREATE TABLE `live_attach_detail` (
  `attachid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `attachcateid` int(11) DEFAULT NULL,
  `userid` bigint(20) DEFAULT NULL,
  `attachname` varchar(30) DEFAULT NULL,
  `attachpath` varchar(100) DEFAULT NULL,
  `attachsourcepath` varchar(100) DEFAULT NULL,
  `clientname` varchar(255) DEFAULT '1',
  `attachdetail` text,
  `filetype` varchar(10) DEFAULT '扩展名',
  `ctime` int(11) DEFAULT NULL,
  `isimage` tinyint(1) DEFAULT '1' COMMENT '是否是图片：1为图片',
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`attachid`),
  UNIQUE KEY `attachtid` (`attachid`)
) ENGINE=MyISAM AUTO_INCREMENT=371 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_attach_detail
-- ----------------------------
INSERT INTO `live_attach_detail` VALUES ('275', '58', null, null, 'upload/agent/20130718/c5a590ce6cd01841e38303bbddb8d75b.jpg', null, '1', null, '扩展名', '1374132403', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('278', '58', null, null, 'upload/agent/20130718/12bd567dd2d56595c20eac42a69e3b07.jpg', null, '1', null, '扩展名', '1374132591', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('282', '60', null, null, 'upload/agent/20130718/d68dfa9361bd29739c160769eea7f664.jpg', null, '1', null, '扩展名', '1374133214', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('283', '60', null, null, 'upload/agent/20130718/d6761dfb4cafcaa3c7250df77717574d.jpg', null, '1', null, '扩展名', '1374133237', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('284', '71', null, null, '', null, '1', null, '扩展名', '1375495495', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('285', '71', null, null, '', null, '1', null, '扩展名', '1375495495', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('286', '71', null, null, '', null, '1', null, '扩展名', '1375495495', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('325', '80', null, null, 'upload/production/20140226/thumb_img/1393385432180353843.jpg', 'upload/production/20140226/source_img/20140226113032_37600.jpg', '1', null, '扩展名', '1393385445', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('324', '80', null, null, 'upload/production/20140226/thumb_img/1393385432133021321.jpg', 'upload/production/20140226/source_img/20140226113031_46768.jpg', '1', null, '扩展名', '1393385445', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('323', '80', null, null, 'upload/production/20140226/thumb_img/1393385431407816376.jpg', 'upload/production/20140226/source_img/20140226113031_23900.jpg', '1', null, '扩展名', '1393385445', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('310', '81', null, null, 'upload/production/20140116/thumb_img/1389838783252917104.jpg', 'upload/production/20140116/source_img/20140116101943_67801.jpg', '1', null, '扩展名', '1389838790', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('311', '81', null, null, 'upload/production/20140116/thumb_img/1389838784679613388.jpg', 'upload/production/20140116/source_img/20140116101944_43912.jpg', '1', null, '扩展名', '1389838790', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('312', '81', null, null, 'upload/production/20140116/thumb_img/1389838784735640533.jpg', 'upload/production/20140116/source_img/20140116101944_75173.jpg', '1', null, '扩展名', '1389838790', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('313', '82', null, null, 'upload/production/20140116/thumb_img/1389838811299385963.jpg', 'upload/production/20140116/source_img/20140116102011_24828.jpg', '1', null, '扩展名', '1389838817', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('314', '82', null, null, 'upload/production/20140116/thumb_img/1389838812834887873.jpg', 'upload/production/20140116/source_img/20140116102012_23307.jpg', '1', null, '扩展名', '1389838817', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('315', '82', null, null, 'upload/production/20140116/thumb_img/1389838812037052699.jpg', 'upload/production/20140116/source_img/20140116102012_85726.jpg', '1', null, '扩展名', '1389838817', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('326', '80', null, null, 'upload/production/20140226/thumb_img/1393385432915370434.jpg', 'upload/production/20140226/source_img/20140226113032_62138.jpg', '1', null, '扩展名', '1393385445', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('327', '87', null, null, 'upload/production/20140227/thumb_img/1393478429211625390.jpg', 'upload/production/20140227/source_img/20140227132029_92089.jpg', '1', null, '扩展名', '1393478521', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('328', '88', null, null, 'upload/production/20140227/thumb_img/1393478579627120733.jpg', 'upload/production/20140227/source_img/20140227132259_95248.jpg', '1', null, '扩展名', '1393478685', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('329', '89', null, null, 'upload/production/20140227/thumb_img/1393481628665295433.jpg', 'upload/production/20140227/source_img/20140227141348_13051.jpg', '1', null, '扩展名', '1393481728', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('330', '90', null, null, 'upload/production/20140227/thumb_img/1393481775527181393.jpg', 'upload/production/20140227/source_img/20140227141615_67584.jpg', '1', null, '扩展名', '1393481785', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('331', '91', null, null, 'upload/production/20140227/thumb_img/1393481932964767093.jpg', 'upload/production/20140227/source_img/20140227141852_26655.jpg', '1', null, '扩展名', '1393481939', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('332', '92', null, null, 'upload/production/20140227/thumb_img/1393481983123204767.jpg', 'upload/production/20140227/source_img/20140227141943_42118.jpg', '1', null, '扩展名', '1393481991', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('333', '93', null, null, 'upload/production/20140227/thumb_img/1393482036495618085.jpg', 'upload/production/20140227/source_img/20140227142036_99197.png', '1', null, '扩展名', '1393482043', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('334', '94', null, null, 'upload/production/20140227/thumb_img/1393482085948549726.jpg', 'upload/production/20140227/source_img/20140227142125_93479.jpg', '1', null, '扩展名', '1393482098', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('335', '95', null, null, 'upload/production/20140227/thumb_img/1393482456872207676.jpg', 'upload/production/20140227/source_img/20140227142736_21260.png', '1', null, '扩展名', '1393482463', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('336', '96', null, null, 'upload/production/20140227/thumb_img/1393482482378699587.jpg', 'upload/production/20140227/source_img/20140227142802_47136.png', '1', null, '扩展名', '1393482489', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('337', '97', null, null, 'upload/production/20140227/thumb_img/1393482503214867719.jpg', 'upload/production/20140227/source_img/20140227142823_95932.png', '1', null, '扩展名', '1393482509', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('338', '98', null, null, 'upload/production/20140227/thumb_img/1393482601371482692.jpg', 'upload/production/20140227/source_img/20140227143001_64176.png', '1', null, '扩展名', '1393482608', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('339', '99', null, null, 'upload/production/20140227/thumb_img/1393482678574277735.jpg', 'upload/production/20140227/source_img/20140227143118_11985.png', '1', null, '扩展名', '1393482687', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('340', '100', null, null, 'upload/production/20140227/thumb_img/1393482771053156628.jpg', 'upload/production/20140227/source_img/20140227143251_79623.jpg', '1', null, '扩展名', '1393482774', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('341', '101', null, null, 'upload/production/20140227/thumb_img/1393482801964150947.jpg', 'upload/production/20140227/source_img/20140227143321_47647.jpg', '1', null, '扩展名', '1393482804', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('342', '102', null, null, 'upload/production/20140227/thumb_img/1393482827444009323.jpg', 'upload/production/20140227/source_img/20140227143347_31838.jpg', '1', null, '扩展名', '1393482830', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('343', '103', null, null, 'upload/production/20140227/thumb_img/1393482848307156639.jpg', 'upload/production/20140227/source_img/20140227143407_99475.jpg', '1', null, '扩展名', '1393482851', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('344', '104', null, null, 'upload/news/20140328/thumb_img/1395988487267013429.jpg', 'upload/news/20140328/source_img/20140328063447_23785.jpg', '1', null, '扩展名', '1395988540', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('345', '105', null, null, 'upload/news/20140328/thumb_img/1395988576449773985.jpg', 'upload/news/20140328/source_img/20140328063616_60237.jpg', '1', null, '扩展名', '1395988581', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('346', '106', null, null, 'upload/news/20140328/thumb_img/1395988606359822323.jpg', 'upload/news/20140328/source_img/20140328063646_23120.jpg', '1', null, '扩展名', '1395988612', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('347', '107', null, null, 'upload/news/20140328/thumb_img/1395988630808399365.jpg', 'upload/news/20140328/source_img/20140328063710_82990.jpg', '1', null, '扩展名', '1395988635', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('348', '108', null, null, 'upload/news/20140328/thumb_img/1395988683420603845.jpg', 'upload/news/20140328/source_img/20140328063803_44027.jpg', '1', null, '扩展名', '1395988692', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('349', '109', null, null, 'upload/news/20140328/thumb_img/1395988713649693814.jpg', 'upload/news/20140328/source_img/20140328063833_84816.jpg', '1', null, '扩展名', '1395988717', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('350', '110', null, null, 'upload/news/20140328/thumb_img/1395988734107815921.jpg', 'upload/news/20140328/source_img/20140328063854_15001.jpg', '1', null, '扩展名', '1395988738', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('351', '111', null, null, 'upload/news/20140328/thumb_img/1395988755619399936.jpg', 'upload/news/20140328/source_img/20140328063915_44972.jpg', '1', null, '扩展名', '1395988760', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('352', '112', null, null, 'upload/news/20140328/thumb_img/1395988790600210375.jpg', 'upload/news/20140328/source_img/20140328063950_89359.jpg', '1', null, '扩展名', '1395988794', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('353', '113', null, null, 'upload/news/20140328/thumb_img/1395988810326568246.jpg', 'upload/news/20140328/source_img/20140328064010_27572.jpg', '1', null, '扩展名', '1395988815', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('354', '114', null, null, 'upload/news/20140328/thumb_img/1395988831356257159.jpg', 'upload/news/20140328/source_img/20140328064031_34378.jpg', '1', null, '扩展名', '1395988838', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('355', '115', null, null, 'upload/news/20140328/thumb_img/1395988852805357510.jpg', 'upload/news/20140328/source_img/20140328064052_53390.jpg', '1', null, '扩展名', '1395988857', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('356', '116', null, null, 'upload/news/20140328/thumb_img/1395988876832197528.jpg', 'upload/news/20140328/source_img/20140328064116_50740.jpg', '1', null, '扩展名', '1395988880', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('357', '117', null, null, 'upload/news/20140328/thumb_img/1395988896364488484.jpg', 'upload/news/20140328/source_img/20140328064136_96712.jpg', '1', null, '扩展名', '1395988900', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('358', '118', null, null, 'upload/news/20140328/thumb_img/1395988920669192742.jpg', 'upload/news/20140328/source_img/20140328064200_41909.jpg', '1', null, '扩展名', '1395988924', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('359', '119', null, null, 'upload/news/20140328/thumb_img/1395988942171185559.jpg', 'upload/news/20140328/source_img/20140328064222_67469.jpg', '1', null, '扩展名', '1395988949', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('360', '120', null, null, 'upload/news/20140328/thumb_img/1395988962940463700.jpg', 'upload/news/20140328/source_img/20140328064242_93888.jpg', '1', null, '扩展名', '1395988970', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('361', '121', null, null, 'upload/news/20140331/thumb_img/1396227007343202338.jpg', 'upload/news/20140331/source_img/20140331005007_41893.jpg', '1', null, '扩展名', '1396227010', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('362', '122', null, null, 'upload/news/20140331/thumb_img/1396227023794413840.jpg', 'upload/news/20140331/source_img/20140331005023_67917.jpg', '1', null, '扩展名', '1396227026', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('363', '123', null, null, 'upload/news/20140331/thumb_img/1396227042505406683.jpg', 'upload/news/20140331/source_img/20140331005042_59133.jpg', '1', null, '扩展名', '1396227050', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('364', '124', null, null, 'upload/news/20140331/thumb_img/1396227062520624073.jpg', 'upload/news/20140331/source_img/20140331005102_28124.jpg', '1', null, '扩展名', '1396227083', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('365', '125', null, null, 'upload/news/20140331/thumb_img/1396227097482742960.jpg', 'upload/news/20140331/source_img/20140331005137_88464.jpg', '1', null, '扩展名', '1396227102', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('366', '126', null, null, 'upload/news/20140331/thumb_img/1396227116582955056.jpg', 'upload/news/20140331/source_img/20140331005156_63322.jpg', '1', null, '扩展名', '1396227121', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('367', '127', null, null, 'upload/news/20140331/thumb_img/1396227135247355481.jpg', 'upload/news/20140331/source_img/20140331005215_86827.jpg', '1', null, '扩展名', '1396227139', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('368', '128', null, null, 'upload/news/20140331/thumb_img/1396227155389245447.jpg', 'upload/news/20140331/source_img/20140331005235_65816.jpg', '1', null, '扩展名', '1396227158', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('369', '129', null, null, 'upload/news/20140331/thumb_img/1396227168708582255.jpg', 'upload/news/20140331/source_img/20140331005248_28061.jpg', '1', null, '扩展名', '1396227178', '1', '1');
INSERT INTO `live_attach_detail` VALUES ('370', '130', null, null, 'upload/news/20140331/thumb_img/1396227217201579743.jpg', 'upload/news/20140331/source_img/20140331005337_28380.jpg', '1', null, '扩展名', '1396227223', '1', '1');

-- ----------------------------
-- Table structure for `live_category`
-- ----------------------------
DROP TABLE IF EXISTS `live_category`;
CREATE TABLE `live_category` (
  `cateid` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `catename` varchar(30) DEFAULT NULL,
  `parentid` int(11) DEFAULT '0',
  `func` varchar(30) DEFAULT NULL COMMENT '所属对象，分类信息用于哪个功能',
  `alias` varchar(30) DEFAULT NULL,
  `info` varchar(1000) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `mtime` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT '0',
  `showtype` varchar(30) DEFAULT '1' COMMENT '1:WEB站；2：WAP站 3:微信站',
  `iscommend` tinyint(1) DEFAULT '1' COMMENT '是否显示在导航栏，默认1为显示',
  PRIMARY KEY (`cateid`)
) ENGINE=MyISAM AUTO_INCREMENT=171 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_category
-- ----------------------------
INSERT INTO `live_category` VALUES ('29', '视频直播厅', '0', 'live', 'stock', '', '1', '1', null, '1396254968', '0', '', '1');
INSERT INTO `live_category` VALUES ('32', '直播内容分类', '0', 'livecate', null, null, null, '1', null, '1355061971', '0', '1', '1');
INSERT INTO `live_category` VALUES ('100', '关于我们', '0', 'pages', '', '', '0', '1', null, '1395985369', '0', '1', '1');
INSERT INTO `live_category` VALUES ('106', '下载专区', '0', 'pages', '', '', '2', '1', '1400144694', '1395991282', '0', '', '1');
INSERT INTO `live_category` VALUES ('71', '网友互动', '32', 'livecate', null, '', '2', '1', null, '1372143327', '0', '1', '1');
INSERT INTO `live_category` VALUES ('72', '消息解读', '32', 'livecate', null, '', '1', '1', null, '1372143314', '0', '1', '1');
INSERT INTO `live_category` VALUES ('73', '行情播报', '32', 'livecate', null, '', '3', '1', null, '1372143343', '0', '1', '1');
INSERT INTO `live_category` VALUES ('74', '投资者教育', '32', 'livecate', null, '', '4', '1', null, '1372143355', '0', '1', '1');
INSERT INTO `live_category` VALUES ('75', '操作喊单', '32', 'livecate', null, '', '5', '1', null, '1372143370', '0', '1', '1');
INSERT INTO `live_category` VALUES ('112', '经济数据', '109', 'pages', '', '', '3', '1', null, '1395993742', '0', '1', '1');
INSERT INTO `live_category` VALUES ('111', 'etf持仓量', '109', 'pages', '', '', '2', '1', null, '1395993728', '0', '1', '1');
INSERT INTO `live_category` VALUES ('117', '联系我们', '0', 'pages', '', '', '4', '1', null, '1395996423', '0', '1', '1');
INSERT INTO `live_category` VALUES ('122', '财经资讯', '0', 'article', '', '', '2', '1', '1400148147', '1396059316', '0', '1', '1');
INSERT INTO `live_category` VALUES ('156', '财经新闻', '122', 'article', '', '', '1', '1', null, '1400148189', '0', '1', '1');
INSERT INTO `live_category` VALUES ('130', '直播室客服', '0', 'advertising', 'room', '', '0', '1', '1405923233', '1396253152', '0', '1', '1');
INSERT INTO `live_category` VALUES ('169', '视频区域下方链接', '0', 'advertising', 'room', '', '0', '1', '1405923245', '1405915721', '0', '1', '1');
INSERT INTO `live_category` VALUES ('157', '每日评论', '122', 'article', '', '', '2', '1', null, '1400148200', '0', '1', '1');
INSERT INTO `live_category` VALUES ('110', '每日点评', '109', 'pages', '', '', '1', '1', null, '1395993711', '0', '1', '1');
INSERT INTO `live_category` VALUES ('109', '研究中心', '0', 'pages', '', '', '3', '1', null, '1395993692', '0', '1', '1');
INSERT INTO `live_category` VALUES ('147', '产品中心', '0', 'pages', '', '', '0', '1', null, '1400138500', '0', '1', '1');
INSERT INTO `live_category` VALUES ('151', '投资学院', '0', 'article', '', '', '0', '1', null, '1400139809', '0', '1', '1');
INSERT INTO `live_category` VALUES ('152', '新手入门', '151', 'article', '', '', '0', '1', null, '1400139824', '0', '1', '1');
INSERT INTO `live_category` VALUES ('153', '深入研究', '151', 'article', '', '', '1', '1', '1400139913', '1400139881', '0', '1', '1');
INSERT INTO `live_category` VALUES ('154', '视频教学', '151', 'article', '', '', '2', '1', '1400139920', '1400139903', '0', '1', '1');
INSERT INTO `live_category` VALUES ('168', '视频区域上方链接', '0', 'advertising', 'room', '', '0', '1', '1405923237', '1405915714', '0', '1', '1');
INSERT INTO `live_category` VALUES ('160', '在线开户', '0', 'pages', '', '', '0', '1', null, '1400562492', '0', '1', '1');
INSERT INTO `live_category` VALUES ('161', '联系客服', '160', 'pages', '', '', '0', '1', null, '1400562514', '0', '1', '1');
INSERT INTO `live_category` VALUES ('162', '在线预约', '160', 'pages', '', '', '2', '1', null, '1400562528', '0', '1', '1');
INSERT INTO `live_category` VALUES ('167', '公告', '0', 'advertising', 'room', '', '0', '1', '1405923249', '1405677487', '0', '1', '1');
INSERT INTO `live_category` VALUES ('166', '页头导航', '0', 'advertising', 'room', '', '0', '1', '1405923241', '1405677267', '0', '1', '1');
INSERT INTO `live_category` VALUES ('165', '免责声明', '0', 'pages', '', '', '0', '1', null, '1400833799', '0', '1', '1');
INSERT INTO `live_category` VALUES ('170', '首页轮播图片', '0', 'advertising', 'home', '', '0', '1', '1406208737', '1406208725', '0', '1', '1');

-- ----------------------------
-- Table structure for `live_chatcontent`
-- ----------------------------
DROP TABLE IF EXISTS `live_chatcontent`;
CREATE TABLE `live_chatcontent` (
  `chatid` int(11) NOT NULL AUTO_INCREMENT,
  `masterid` int(11) DEFAULT NULL,
  `chatcontent` mediumtext,
  `chatname` varchar(255) DEFAULT NULL,
  `level` tinyint(4) NOT NULL DEFAULT '-1',
  `chatuserid` int(11) DEFAULT NULL,
  `sourceimg` varchar(255) DEFAULT NULL,
  `imgthumb` varchar(255) DEFAULT NULL,
  `mtime` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '1:放行 2:禁言',
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`chatid`)
) ENGINE=MyISAM AUTO_INCREMENT=1684 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_chatcontent
-- ----------------------------
INSERT INTO `live_chatcontent` VALUES ('1656', '29', '15215', 'liuzihan', '-2', '127', '', '', null, '1', '1434421109');
INSERT INTO `live_chatcontent` VALUES ('1655', '29', '测试测试', '游客99820330', '-1', '99820330', '', '', '1434421086', '1', '1434421046');
INSERT INTO `live_chatcontent` VALUES ('1662', '29', '12', '游客42308611', '-1', '42308611', '', '', null, '0', '1434464248');
INSERT INTO `live_chatcontent` VALUES ('1658', '29', '兔兔', '游客26472362', '-1', '26472362', '', '', null, '0', '1434426504');
INSERT INTO `live_chatcontent` VALUES ('1661', '29', '讲解谅解', '游客26472362', '-1', '26472362', '', '', '1434449749', '1', '1434426481');
INSERT INTO `live_chatcontent` VALUES ('1660', '29', '链接', '游客26472362', '-1', '26472362', '', '', '1434449746', '1', '1434426528');
INSERT INTO `live_chatcontent` VALUES ('1663', '29', '213123', '游客42308611', '-1', '42308611', '', '', null, '0', '1434464324');
INSERT INTO `live_chatcontent` VALUES ('1664', '29', '12', '游客38920950', '-1', '38920950', '', '', null, '0', '1434464588');
INSERT INTO `live_chatcontent` VALUES ('1665', '29', '还把啦', '游客38920950', '-1', '38920950', '', '', null, '0', '1434464610');
INSERT INTO `live_chatcontent` VALUES ('1672', '29', '1212', '游客42308611', '-1', '42308611', '', '', null, '0', '1434464747');
INSERT INTO `live_chatcontent` VALUES ('1671', '29', '[微笑]', '游客42308611', '-1', '42308611', '', '', '1434464738', '1', '1434464622');
INSERT INTO `live_chatcontent` VALUES ('1670', '29', '[微笑]', '游客42308611', '-1', '42308611', '', '', '1434464734', '1', '1434464647');
INSERT INTO `live_chatcontent` VALUES ('1669', '29', '[囧]', '游客42308611', '-1', '42308611', '', '', '1434464734', '1', '1434464668');
INSERT INTO `live_chatcontent` VALUES ('1673', '29', '1212', '游客55735870', '-1', '55735870', '', '', null, '0', '1434505582');
INSERT INTO `live_chatcontent` VALUES ('1674', '29', '56', '游客55735870', '-1', '55735870', '', '', null, '0', '1434505619');
INSERT INTO `live_chatcontent` VALUES ('1675', '29', '12', '游客55735870', '-1', '55735870', '', '', null, '0', '1434510231');
INSERT INTO `live_chatcontent` VALUES ('1676', '29', 'qwe', '游客55735870', '-1', '55735870', '', '', null, '0', '1434510572');
INSERT INTO `live_chatcontent` VALUES ('1677', '29', '23', '游客37411863', '-1', '37411863', '', '', null, '0', '1435038384');
INSERT INTO `live_chatcontent` VALUES ('1678', '29', '12', '游客207862', '-1', '207862', '', '', null, '0', '1435300217');
INSERT INTO `live_chatcontent` VALUES ('1679', '29', '12', '游客207862', '-1', '207862', '', '', null, '0', '1435300218');
INSERT INTO `live_chatcontent` VALUES ('1680', '29', '23', '游客82022114', '-1', '82022114', '', '', null, '0', '1435819829');
INSERT INTO `live_chatcontent` VALUES ('1681', '29', '12', '游客38610187', '-1', '38610187', '', '', null, '0', '1437976429');
INSERT INTO `live_chatcontent` VALUES ('1682', '29', '诺云财经系统最新版，新websocket内核，完美支持PC和手机访问。演示地址：zhibo.bf168.org', '游客9720354', '-1', '9720354', '', '', null, '0', '1439306267');
INSERT INTO `live_chatcontent` VALUES ('1683', '29', '诺云财经系统最新版，新websocket内核，完美支持PC和手机访问。演示地址：zhibo.bf168.org', '游客9720354', '-1', '9720354', '', '', null, '0', '1439306268');

-- ----------------------------
-- Table structure for `live_chatcontent_history`
-- ----------------------------
DROP TABLE IF EXISTS `live_chatcontent_history`;
CREATE TABLE `live_chatcontent_history` (
  `chatid` int(11) NOT NULL AUTO_INCREMENT,
  `masterid` int(11) DEFAULT NULL,
  `chatcontent` mediumtext,
  `chatname` varchar(255) DEFAULT NULL,
  `chatuserid` int(11) DEFAULT NULL,
  `mtime` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`chatid`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_chatcontent_history
-- ----------------------------
INSERT INTO `live_chatcontent_history` VALUES ('69', '29', 'test', '游客45612637', '45612637', '0', '1422875763');

-- ----------------------------
-- Table structure for `live_commdata_region`
-- ----------------------------
DROP TABLE IF EXISTS `live_commdata_region`;
CREATE TABLE `live_commdata_region` (
  `regionid` int(11) NOT NULL AUTO_INCREMENT,
  `parentid` int(11) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `regiontype` tinyint(4) DEFAULT NULL,
  `mtime` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  `iscity` tinyint(4) DEFAULT '0' COMMENT '1:直辖市',
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`regionid`)
) ENGINE=MyISAM AUTO_INCREMENT=3412 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_commdata_region
-- ----------------------------
INSERT INTO `live_commdata_region` VALUES ('1', '0', '中国', '0', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2', '1', '北京', '1', '1376292206', null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3', '1', '安徽', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('4', '1', '福建', '1', '1373595413', null, '0', '1');
INSERT INTO `live_commdata_region` VALUES ('5', '1', '甘肃', '1', '1381713384', null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('6', '1', '广东', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('7', '1', '广西', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('8', '1', '贵州', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('9', '1', '海南', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('10', '1', '河北', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('11', '1', '河南', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('12', '1', '黑龙江', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('13', '1', '湖北', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('14', '1', '湖南', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('15', '1', '吉林', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('16', '1', '江苏', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('17', '1', '江西', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('18', '1', '辽宁', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('19', '1', '内蒙古', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('20', '1', '宁夏', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('21', '1', '青海', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('22', '1', '山东', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('23', '1', '山西', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('24', '1', '陕西', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('25', '1', '上海', '1', '1381714706', null, '0', '1');
INSERT INTO `live_commdata_region` VALUES ('26', '1', '四川', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('27', '1', '天津', '1', '1376292319', null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('28', '1', '西藏', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('29', '1', '新疆', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('30', '1', '云南', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('31', '1', '浙江', '1', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('32', '1', '重庆', '1', '1376292226', null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('33', '1', '香港', '1', '1376292299', null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('34', '1', '澳门', '1', '1376292305', null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('35', '1', '台湾', '1', '1376292310', null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('36', '3', '安庆', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('37', '3', '蚌埠', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('38', '3', '巢湖', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('39', '3', '池州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('40', '3', '滁州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('41', '3', '阜阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('42', '3', '淮北', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('43', '3', '淮南', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('44', '3', '黄山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('45', '3', '六安', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('46', '3', '马鞍山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('47', '3', '宿州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('48', '3', '铜陵', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('49', '3', '芜湖', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('50', '3', '宣城', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('51', '3', '亳州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('52', '2', '北京', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('53', '4', '福州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('54', '4', '龙岩', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('55', '4', '南平', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('56', '4', '宁德', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('57', '4', '莆田', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('58', '4', '泉州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('59', '4', '三明', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('60', '4', '厦门', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('61', '4', '漳州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('62', '5', '兰州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('63', '5', '白银', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('64', '5', '定西', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('65', '5', '甘南', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('66', '5', '嘉峪关', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('67', '5', '金昌', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('68', '5', '酒泉', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('69', '5', '临夏', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('70', '5', '陇南', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('71', '5', '平凉', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('72', '5', '庆阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('73', '5', '天水', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('74', '5', '武威', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('75', '5', '张掖', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('76', '6', '广州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('77', '6', '深圳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('78', '6', '潮州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('79', '6', '东莞', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('80', '6', '佛山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('81', '6', '河源', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('82', '6', '惠州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('83', '6', '江门', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('84', '6', '揭阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('85', '6', '茂名', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('86', '6', '梅州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('87', '6', '清远', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('88', '6', '汕头', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('89', '6', '汕尾', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('90', '6', '韶关', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('91', '6', '阳江', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('92', '6', '云浮', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('93', '6', '湛江', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('94', '6', '肇庆', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('95', '6', '中山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('96', '6', '珠海', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('97', '7', '南宁', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('98', '7', '桂林', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('99', '7', '百色', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('100', '7', '北海', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('101', '7', '崇左', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('102', '7', '防城港', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('103', '7', '贵港', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('104', '7', '河池', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('105', '7', '贺州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('106', '7', '来宾', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('107', '7', '柳州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('108', '7', '钦州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('109', '7', '梧州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('110', '7', '玉林', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('111', '8', '贵阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('112', '8', '安顺', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('113', '8', '毕节', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('114', '8', '六盘水', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('115', '8', '黔东南', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('116', '8', '黔南', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('117', '8', '黔西南', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('118', '8', '铜仁', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('119', '8', '遵义', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('120', '9', '海口', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('121', '9', '三亚', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('122', '9', '白沙', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('123', '9', '保亭', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('124', '9', '昌江', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('125', '9', '澄迈县', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('126', '9', '定安县', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('127', '9', '东方', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('129', '9', '临高县', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('130', '9', '陵水', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('131', '9', '琼海', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('132', '9', '琼中', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('133', '9', '屯昌县', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('134', '9', '万宁', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('135', '9', '文昌', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('136', '9', '五指山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('137', '9', '儋州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('138', '10', '石家庄', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('139', '10', '保定', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('140', '10', '沧州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('141', '10', '承德', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('142', '10', '邯郸', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('143', '10', '衡水', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('144', '10', '廊坊', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('145', '10', '秦皇岛', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('146', '10', '唐山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('147', '10', '邢台', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('148', '10', '张家口', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('149', '11', '郑州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('150', '11', '洛阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('151', '11', '开封', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('152', '11', '安阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('153', '11', '鹤壁', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('154', '11', '济源', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('155', '11', '焦作', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('156', '11', '南阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('157', '11', '平顶山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('158', '11', '三门峡', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('159', '11', '商丘', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('160', '11', '新乡', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('161', '11', '信阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('162', '11', '许昌', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('163', '11', '周口', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('164', '11', '驻马店', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('165', '11', '漯河', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('166', '11', '濮阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('167', '12', '哈尔滨', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('168', '12', '大庆', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('169', '12', '大兴安岭', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('170', '12', '鹤岗', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('171', '12', '黑河', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('172', '12', '鸡西', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('173', '12', '佳木斯', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('174', '12', '牡丹江', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('175', '12', '七台河', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('176', '12', '齐齐哈尔', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('177', '12', '双鸭山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('178', '12', '绥化', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('179', '12', '伊春', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('180', '13', '武汉', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('181', '13', '仙桃', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('182', '13', '鄂州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('183', '13', '黄冈', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('184', '13', '黄石', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('185', '13', '荆门', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('186', '13', '荆州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('187', '13', '潜江', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('188', '13', '神农架林区', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('189', '13', '十堰', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('190', '13', '随州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('191', '13', '天门', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('192', '13', '咸宁', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('193', '13', '襄樊', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('194', '13', '孝感', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('195', '13', '宜昌', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('196', '13', '恩施', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('197', '14', '长沙', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('198', '14', '张家界', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('199', '14', '常德', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('200', '14', '郴州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('201', '14', '衡阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('202', '14', '怀化', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('203', '14', '娄底', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('204', '14', '邵阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('205', '14', '湘潭', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('206', '14', '湘西', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('207', '14', '益阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('208', '14', '永州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('209', '14', '岳阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('210', '14', '株洲', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('211', '15', '长春', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('212', '15', '吉林', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('213', '15', '白城', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('214', '15', '白山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('215', '15', '辽源', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('216', '15', '四平', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('217', '15', '松原', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('218', '15', '通化', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('219', '15', '延边', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('220', '16', '南京', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('221', '16', '苏州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('222', '16', '无锡', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('223', '16', '常州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('224', '16', '淮安', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('225', '16', '连云港', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('226', '16', '南通', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('227', '16', '宿迁', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('228', '16', '泰州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('229', '16', '徐州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('230', '16', '盐城', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('231', '16', '扬州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('232', '16', '镇江', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('233', '17', '南昌', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('234', '17', '抚州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('235', '17', '赣州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('236', '17', '吉安', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('237', '17', '景德镇', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('238', '17', '九江', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('239', '17', '萍乡', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('240', '17', '上饶', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('241', '17', '新余', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('242', '17', '宜春', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('243', '17', '鹰潭', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('244', '18', '沈阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('245', '18', '大连', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('246', '18', '鞍山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('247', '18', '本溪', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('248', '18', '朝阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('249', '18', '丹东', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('250', '18', '抚顺', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('251', '18', '阜新', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('252', '18', '葫芦岛', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('253', '18', '锦州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('254', '18', '辽阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('255', '18', '盘锦', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('256', '18', '铁岭', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('257', '18', '营口', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('258', '19', '呼和浩特', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('259', '19', '阿拉善盟', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('260', '19', '巴彦淖尔盟', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('261', '19', '包头', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('262', '19', '赤峰', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('263', '19', '鄂尔多斯', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('264', '19', '呼伦贝尔', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('265', '19', '通辽', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('266', '19', '乌海', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('267', '19', '乌兰察布市', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('268', '19', '锡林郭勒盟', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('269', '19', '兴安盟', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('270', '20', '银川', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('271', '20', '固原', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('272', '20', '石嘴山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('273', '20', '吴忠', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('274', '20', '中卫', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('275', '21', '西宁', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('276', '21', '果洛', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('277', '21', '海北', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('278', '21', '海东', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('279', '21', '海南', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('280', '21', '海西', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('281', '21', '黄南', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('282', '21', '玉树', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('283', '22', '济南', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('284', '22', '青岛', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('285', '22', '滨州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('286', '22', '德州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('287', '22', '东营', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('288', '22', '菏泽', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('289', '22', '济宁', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('290', '22', '莱芜', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('291', '22', '聊城', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('292', '22', '临沂', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('293', '22', '日照', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('294', '22', '泰安', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('295', '22', '威海', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('296', '22', '潍坊', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('297', '22', '烟台', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('298', '22', '枣庄', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('299', '22', '淄博', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('300', '23', '太原', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('301', '23', '长治', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('302', '23', '大同', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('303', '23', '晋城', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('304', '23', '晋中', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('305', '23', '临汾', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('306', '23', '吕梁', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('307', '23', '朔州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('308', '23', '忻州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('309', '23', '阳泉', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('310', '23', '运城', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('311', '24', '西安', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('312', '24', '安康', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('313', '24', '宝鸡', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('314', '24', '汉中', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('315', '24', '商洛', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('316', '24', '铜川', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('317', '24', '渭南', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('318', '24', '咸阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('319', '24', '延安', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('320', '24', '榆林', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('321', '25', '上海', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('322', '26', '成都', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('323', '26', '绵阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('324', '26', '阿坝', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('325', '26', '巴中', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('326', '26', '达州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('327', '26', '德阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('328', '26', '甘孜', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('329', '26', '广安', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('330', '26', '广元', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('331', '26', '乐山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('332', '26', '凉山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('333', '26', '眉山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('334', '26', '南充', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('335', '26', '内江', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('336', '26', '攀枝花', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('337', '26', '遂宁', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('338', '26', '雅安', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('339', '26', '宜宾', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('340', '26', '资阳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('341', '26', '自贡', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('342', '26', '泸州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('343', '27', '天津', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('344', '28', '拉萨', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('345', '28', '阿里', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('346', '28', '昌都', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('347', '28', '林芝', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('348', '28', '那曲', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('349', '28', '日喀则', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('350', '28', '山南', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('351', '29', '乌鲁木齐', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('352', '29', '阿克苏', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('353', '29', '阿拉尔', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('354', '29', '巴音郭楞', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('355', '29', '博尔塔拉', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('356', '29', '昌吉', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('357', '29', '哈密', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('358', '29', '和田', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('359', '29', '喀什', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('360', '29', '克拉玛依', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('361', '29', '克孜勒苏', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('362', '29', '石河子', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('363', '29', '图木舒克', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('364', '29', '吐鲁番', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('365', '29', '五家渠', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('366', '29', '伊犁', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('367', '30', '昆明', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('368', '30', '怒江', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('369', '30', '普洱', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('370', '30', '丽江', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('371', '30', '保山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('372', '30', '楚雄', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('373', '30', '大理', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('374', '30', '德宏', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('375', '30', '迪庆', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('376', '30', '红河', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('377', '30', '临沧', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('378', '30', '曲靖', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('379', '30', '文山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('380', '30', '西双版纳', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('381', '30', '玉溪', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('382', '30', '昭通', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('383', '31', '杭州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('384', '31', '湖州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('385', '31', '嘉兴', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('386', '31', '金华', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('387', '31', '丽水', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('388', '31', '宁波', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('389', '31', '绍兴', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('390', '31', '台州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('391', '31', '温州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('392', '31', '舟山', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('393', '31', '衢州', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('394', '32', '重庆', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('395', '33', '香港', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('396', '34', '澳门', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('397', '35', '台湾', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('398', '36', '迎江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('399', '36', '大观区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('400', '36', '宜秀区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('401', '36', '桐城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('402', '36', '怀宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('403', '36', '枞阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('404', '36', '潜山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('405', '36', '太湖县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('406', '36', '宿松县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('407', '36', '望江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('408', '36', '岳西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('409', '37', '中市区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('410', '37', '东市区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('411', '37', '西市区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('412', '37', '郊区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('413', '37', '怀远县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('414', '37', '五河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('415', '37', '固镇县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('416', '38', '居巢区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('417', '38', '庐江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('418', '38', '无为县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('419', '38', '含山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('420', '38', '和县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('421', '39', '贵池区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('422', '39', '东至县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('423', '39', '石台县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('424', '39', '青阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('425', '40', '琅琊区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('426', '40', '南谯区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('427', '40', '天长市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('428', '40', '明光市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('429', '40', '来安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('430', '40', '全椒县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('431', '40', '定远县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('432', '40', '凤阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('433', '41', '蚌山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('434', '41', '龙子湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('435', '41', '禹会区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('436', '41', '淮上区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('437', '41', '颍州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('438', '41', '颍东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('439', '41', '颍泉区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('440', '41', '界首市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('441', '41', '临泉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('442', '41', '太和县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('443', '41', '阜南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('444', '41', '颖上县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('445', '42', '相山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('446', '42', '杜集区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('447', '42', '烈山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('448', '42', '濉溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('449', '43', '田家庵区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('450', '43', '大通区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('451', '43', '谢家集区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('452', '43', '八公山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('453', '43', '潘集区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('454', '43', '凤台县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('455', '44', '屯溪区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('456', '44', '黄山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('457', '44', '徽州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('458', '44', '歙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('459', '44', '休宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('460', '44', '黟县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('461', '44', '祁门县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('462', '45', '金安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('463', '45', '裕安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('464', '45', '寿县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('465', '45', '霍邱县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('466', '45', '舒城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('467', '45', '金寨县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('468', '45', '霍山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('469', '46', '雨山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('470', '46', '花山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('471', '46', '金家庄区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('472', '46', '当涂县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('473', '47', '埇桥区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('474', '47', '砀山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('475', '47', '萧县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('476', '47', '灵璧县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('477', '47', '泗县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('478', '48', '铜官山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('479', '48', '狮子山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('480', '48', '郊区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('481', '48', '铜陵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('482', '49', '镜湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('483', '49', '弋江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('484', '49', '鸠江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('485', '49', '三山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('486', '49', '芜湖县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('487', '49', '繁昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('488', '49', '南陵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('489', '50', '宣州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('490', '50', '宁国市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('491', '50', '郎溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('492', '50', '广德县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('493', '50', '泾县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('494', '50', '绩溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('495', '50', '旌德县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('496', '51', '涡阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('497', '51', '蒙城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('498', '51', '利辛县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('499', '51', '谯城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('500', '52', '东城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('501', '52', '西城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('502', '52', '海淀区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('503', '52', '朝阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('504', '52', '崇文区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('505', '52', '宣武区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('506', '52', '丰台区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('507', '52', '石景山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('508', '52', '房山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('509', '52', '门头沟区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('510', '52', '通州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('511', '52', '顺义区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('512', '52', '昌平区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('513', '52', '怀柔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('514', '52', '平谷区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('515', '52', '大兴区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('516', '52', '密云县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('517', '52', '延庆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('518', '53', '鼓楼区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('519', '53', '台江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('520', '53', '仓山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('521', '53', '马尾区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('522', '53', '晋安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('523', '53', '福清市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('524', '53', '长乐市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('525', '53', '闽侯县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('526', '53', '连江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('527', '53', '罗源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('528', '53', '闽清县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('529', '53', '永泰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('530', '53', '平潭县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('531', '54', '新罗区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('532', '54', '漳平市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('533', '54', '长汀县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('534', '54', '永定县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('535', '54', '上杭县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('536', '54', '武平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('537', '54', '连城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('538', '55', '延平区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('539', '55', '邵武市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('540', '55', '武夷山市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('541', '55', '建瓯市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('542', '55', '建阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('543', '55', '顺昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('544', '55', '浦城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('545', '55', '光泽县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('546', '55', '松溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('547', '55', '政和县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('548', '56', '蕉城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('549', '56', '福安市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('550', '56', '福鼎市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('551', '56', '霞浦县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('552', '56', '古田县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('553', '56', '屏南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('554', '56', '寿宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('555', '56', '周宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('556', '56', '柘荣县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('557', '57', '城厢区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('558', '57', '涵江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('559', '57', '荔城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('560', '57', '秀屿区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('561', '57', '仙游县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('562', '58', '鲤城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('563', '58', '丰泽区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('564', '58', '洛江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('565', '58', '清濛开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('566', '58', '泉港区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('567', '58', '石狮市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('568', '58', '晋江市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('569', '58', '南安市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('570', '58', '惠安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('571', '58', '安溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('572', '58', '永春县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('573', '58', '德化县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('574', '58', '金门县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('575', '59', '梅列区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('576', '59', '三元区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('577', '59', '永安市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('578', '59', '明溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('579', '59', '清流县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('580', '59', '宁化县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('581', '59', '大田县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('582', '59', '尤溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('583', '59', '沙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('584', '59', '将乐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('585', '59', '泰宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('586', '59', '建宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('587', '60', '思明区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('588', '60', '海沧区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('589', '60', '湖里区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('590', '60', '集美区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('591', '60', '同安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('592', '60', '翔安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('593', '61', '芗城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('594', '61', '龙文区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('595', '61', '龙海市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('596', '61', '云霄县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('597', '61', '漳浦县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('598', '61', '诏安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('599', '61', '长泰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('600', '61', '东山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('601', '61', '南靖县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('602', '61', '平和县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('603', '61', '华安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('604', '62', '皋兰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('605', '62', '城关区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('606', '62', '七里河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('607', '62', '西固区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('608', '62', '安宁区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('609', '62', '红古区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('610', '62', '永登县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('611', '62', '榆中县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('612', '63', '白银区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('613', '63', '平川区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('614', '63', '会宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('615', '63', '景泰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('616', '63', '靖远县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('617', '64', '临洮县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('618', '64', '陇西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('619', '64', '通渭县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('620', '64', '渭源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('621', '64', '漳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('622', '64', '岷县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('623', '64', '安定区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('624', '64', '安定区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('625', '65', '合作市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('626', '65', '临潭县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('627', '65', '卓尼县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('628', '65', '舟曲县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('629', '65', '迭部县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('630', '65', '玛曲县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('631', '65', '碌曲县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('632', '65', '夏河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('633', '66', '嘉峪关市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('634', '67', '金川区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('635', '67', '永昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('636', '68', '肃州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('637', '68', '玉门市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('638', '68', '敦煌市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('639', '68', '金塔县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('640', '68', '瓜州县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('641', '68', '肃北', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('642', '68', '阿克塞', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('643', '69', '临夏市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('644', '69', '临夏县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('645', '69', '康乐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('646', '69', '永靖县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('647', '69', '广河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('648', '69', '和政县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('649', '69', '东乡族自治县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('650', '69', '积石山', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('651', '70', '成县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('652', '70', '徽县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('653', '70', '康县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('654', '70', '礼县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('655', '70', '两当县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('656', '70', '文县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('657', '70', '西和县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('658', '70', '宕昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('659', '70', '武都区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('660', '71', '崇信县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('661', '71', '华亭县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('662', '71', '静宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('663', '71', '灵台县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('664', '71', '崆峒区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('665', '71', '庄浪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('666', '71', '泾川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('667', '72', '合水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('668', '72', '华池县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('669', '72', '环县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('670', '72', '宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('671', '72', '庆城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('672', '72', '西峰区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('673', '72', '镇原县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('674', '72', '正宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('675', '73', '甘谷县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('676', '73', '秦安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('677', '73', '清水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('678', '73', '秦州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('679', '73', '麦积区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('680', '73', '武山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('681', '73', '张家川', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('682', '74', '古浪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('683', '74', '民勤县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('684', '74', '天祝', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('685', '74', '凉州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('686', '75', '高台县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('687', '75', '临泽县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('688', '75', '民乐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('689', '75', '山丹县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('690', '75', '肃南', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('691', '75', '甘州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('692', '76', '从化市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('693', '76', '天河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('694', '76', '东山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('695', '76', '白云区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('696', '76', '海珠区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('697', '76', '荔湾区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('698', '76', '越秀区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('699', '76', '黄埔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('700', '76', '番禺区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('701', '76', '花都区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('702', '76', '增城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('703', '76', '从化区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('704', '76', '市郊', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('705', '77', '福田区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('706', '77', '罗湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('707', '77', '南山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('708', '77', '宝安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('709', '77', '龙岗区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('710', '77', '盐田区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('711', '78', '湘桥区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('712', '78', '潮安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('713', '78', '饶平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('714', '79', '南城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('715', '79', '东城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('716', '79', '万江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('717', '79', '莞城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('718', '79', '石龙镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('719', '79', '虎门镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('720', '79', '麻涌镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('721', '79', '道滘镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('722', '79', '石碣镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('723', '79', '沙田镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('724', '79', '望牛墩镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('725', '79', '洪梅镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('726', '79', '茶山镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('727', '79', '寮步镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('728', '79', '大岭山镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('729', '79', '大朗镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('730', '79', '黄江镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('731', '79', '樟木头', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('732', '79', '凤岗镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('733', '79', '塘厦镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('734', '79', '谢岗镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('735', '79', '厚街镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('736', '79', '清溪镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('737', '79', '常平镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('738', '79', '桥头镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('739', '79', '横沥镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('740', '79', '东坑镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('741', '79', '企石镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('742', '79', '石排镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('743', '79', '长安镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('744', '79', '中堂镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('745', '79', '高埗镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('746', '80', '禅城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('747', '80', '南海区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('748', '80', '顺德区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('749', '80', '三水区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('750', '80', '高明区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('751', '81', '东源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('752', '81', '和平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('753', '81', '源城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('754', '81', '连平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('755', '81', '龙川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('756', '81', '紫金县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('757', '82', '惠阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('758', '82', '惠城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('759', '82', '大亚湾', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('760', '82', '博罗县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('761', '82', '惠东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('762', '82', '龙门县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('763', '83', '江海区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('764', '83', '蓬江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('765', '83', '新会区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('766', '83', '台山市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('767', '83', '开平市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('768', '83', '鹤山市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('769', '83', '恩平市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('770', '84', '榕城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('771', '84', '普宁市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('772', '84', '揭东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('773', '84', '揭西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('774', '84', '惠来县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('775', '85', '茂南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('776', '85', '茂港区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('777', '85', '高州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('778', '85', '化州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('779', '85', '信宜市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('780', '85', '电白县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('781', '86', '梅县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('782', '86', '梅江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('783', '86', '兴宁市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('784', '86', '大埔县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('785', '86', '丰顺县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('786', '86', '五华县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('787', '86', '平远县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('788', '86', '蕉岭县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('789', '87', '清城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('790', '87', '英德市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('791', '87', '连州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('792', '87', '佛冈县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('793', '87', '阳山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('794', '87', '清新县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('795', '87', '连山', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('796', '87', '连南', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('797', '88', '南澳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('798', '88', '潮阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('799', '88', '澄海区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('800', '88', '龙湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('801', '88', '金平区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('802', '88', '濠江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('803', '88', '潮南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('804', '89', '城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('805', '89', '陆丰市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('806', '89', '海丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('807', '89', '陆河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('808', '90', '曲江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('809', '90', '浈江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('810', '90', '武江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('811', '90', '曲江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('812', '90', '乐昌市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('813', '90', '南雄市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('814', '90', '始兴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('815', '90', '仁化县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('816', '90', '翁源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('817', '90', '新丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('818', '90', '乳源', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('819', '91', '江城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('820', '91', '阳春市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('821', '91', '阳西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('822', '91', '阳东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('823', '92', '云城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('824', '92', '罗定市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('825', '92', '新兴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('826', '92', '郁南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('827', '92', '云安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('828', '93', '赤坎区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('829', '93', '霞山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('830', '93', '坡头区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('831', '93', '麻章区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('832', '93', '廉江市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('833', '93', '雷州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('834', '93', '吴川市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('835', '93', '遂溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('836', '93', '徐闻县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('837', '94', '肇庆市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('838', '94', '高要市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('839', '94', '四会市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('840', '94', '广宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('841', '94', '怀集县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('842', '94', '封开县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('843', '94', '德庆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('844', '95', '石岐街道', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('845', '95', '东区街道', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('846', '95', '西区街道', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('847', '95', '环城街道', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('848', '95', '中山港街道', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('849', '95', '五桂山街道', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('850', '96', '香洲区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('851', '96', '斗门区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('852', '96', '金湾区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('853', '97', '邕宁区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('854', '97', '青秀区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('855', '97', '兴宁区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('856', '97', '良庆区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('857', '97', '西乡塘区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('858', '97', '江南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('859', '97', '武鸣县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('860', '97', '隆安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('861', '97', '马山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('862', '97', '上林县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('863', '97', '宾阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('864', '97', '横县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('865', '98', '秀峰区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('866', '98', '叠彩区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('867', '98', '象山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('868', '98', '七星区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('869', '98', '雁山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('870', '98', '阳朔县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('871', '98', '临桂县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('872', '98', '灵川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('873', '98', '全州县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('874', '98', '平乐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('875', '98', '兴安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('876', '98', '灌阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('877', '98', '荔浦县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('878', '98', '资源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('879', '98', '永福县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('880', '98', '龙胜', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('881', '98', '恭城', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('882', '99', '右江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('883', '99', '凌云县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('884', '99', '平果县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('885', '99', '西林县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('886', '99', '乐业县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('887', '99', '德保县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('888', '99', '田林县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('889', '99', '田阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('890', '99', '靖西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('891', '99', '田东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('892', '99', '那坡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('893', '99', '隆林', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('894', '100', '海城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('895', '100', '银海区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('896', '100', '铁山港区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('897', '100', '合浦县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('898', '101', '江州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('899', '101', '凭祥市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('900', '101', '宁明县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('901', '101', '扶绥县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('902', '101', '龙州县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('903', '101', '大新县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('904', '101', '天等县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('905', '102', '港口区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('906', '102', '防城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('907', '102', '东兴市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('908', '102', '上思县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('909', '103', '港北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('910', '103', '港南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('911', '103', '覃塘区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('912', '103', '桂平市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('913', '103', '平南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('914', '104', '金城江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('915', '104', '宜州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('916', '104', '天峨县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('917', '104', '凤山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('918', '104', '南丹县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('919', '104', '东兰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('920', '104', '都安', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('921', '104', '罗城', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('922', '104', '巴马', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('923', '104', '环江', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('924', '104', '大化', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('925', '105', '八步区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('926', '105', '钟山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('927', '105', '昭平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('928', '105', '富川', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('929', '106', '兴宾区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('930', '106', '合山市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('931', '106', '象州县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('932', '106', '武宣县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('933', '106', '忻城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('934', '106', '金秀', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('935', '107', '城中区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('936', '107', '鱼峰区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('937', '107', '柳北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('938', '107', '柳南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('939', '107', '柳江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('940', '107', '柳城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('941', '107', '鹿寨县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('942', '107', '融安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('943', '107', '融水', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('944', '107', '三江', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('945', '108', '钦南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('946', '108', '钦北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('947', '108', '灵山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('948', '108', '浦北县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('949', '109', '万秀区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('950', '109', '蝶山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('951', '109', '长洲区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('952', '109', '岑溪市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('953', '109', '苍梧县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('954', '109', '藤县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('955', '109', '蒙山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('956', '110', '玉州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('957', '110', '北流市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('958', '110', '容县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('959', '110', '陆川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('960', '110', '博白县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('961', '110', '兴业县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('962', '111', '南明区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('963', '111', '云岩区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('964', '111', '花溪区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('965', '111', '乌当区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('966', '111', '白云区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('967', '111', '小河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('968', '111', '金阳新区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('969', '111', '新天园区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('970', '111', '清镇市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('971', '111', '开阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('972', '111', '修文县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('973', '111', '息烽县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('974', '112', '西秀区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('975', '112', '关岭', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('976', '112', '镇宁', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('977', '112', '紫云', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('978', '112', '平坝县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('979', '112', '普定县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('980', '113', '毕节市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('981', '113', '大方县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('982', '113', '黔西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('983', '113', '金沙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('984', '113', '织金县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('985', '113', '纳雍县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('986', '113', '赫章县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('987', '113', '威宁', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('988', '114', '钟山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('989', '114', '六枝特区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('990', '114', '水城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('991', '114', '盘县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('992', '115', '凯里市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('993', '115', '黄平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('994', '115', '施秉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('995', '115', '三穗县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('996', '115', '镇远县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('997', '115', '岑巩县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('998', '115', '天柱县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('999', '115', '锦屏县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1000', '115', '剑河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1001', '115', '台江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1002', '115', '黎平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1003', '115', '榕江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1004', '115', '从江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1005', '115', '雷山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1006', '115', '麻江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1007', '115', '丹寨县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1008', '116', '都匀市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1009', '116', '福泉市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1010', '116', '荔波县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1011', '116', '贵定县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1012', '116', '瓮安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1013', '116', '独山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1014', '116', '平塘县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1015', '116', '罗甸县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1016', '116', '长顺县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1017', '116', '龙里县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1018', '116', '惠水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1019', '116', '三都', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1020', '117', '兴义市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1021', '117', '兴仁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1022', '117', '普安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1023', '117', '晴隆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1024', '117', '贞丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1025', '117', '望谟县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1026', '117', '册亨县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1027', '117', '安龙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1028', '118', '铜仁市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1029', '118', '江口县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1030', '118', '石阡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1031', '118', '思南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1032', '118', '德江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1033', '118', '玉屏', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1034', '118', '印江', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1035', '118', '沿河', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1036', '118', '松桃', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1037', '118', '万山特区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1038', '119', '红花岗区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1039', '119', '务川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1040', '119', '道真县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1041', '119', '汇川区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1042', '119', '赤水市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1043', '119', '仁怀市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1044', '119', '遵义县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1045', '119', '桐梓县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1046', '119', '绥阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1047', '119', '正安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1048', '119', '凤冈县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1049', '119', '湄潭县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1050', '119', '余庆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1051', '119', '习水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1052', '119', '道真', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1053', '119', '务川', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1054', '120', '秀英区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1055', '120', '龙华区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1056', '120', '琼山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1057', '120', '美兰区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1058', '137', '市区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1059', '137', '洋浦开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1060', '137', '那大镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1061', '137', '王五镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1062', '137', '雅星镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1063', '137', '大成镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1064', '137', '中和镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1065', '137', '峨蔓镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1066', '137', '南丰镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1067', '137', '白马井镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1068', '137', '兰洋镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1069', '137', '和庆镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1070', '137', '海头镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1071', '137', '排浦镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1072', '137', '东成镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1073', '137', '光村镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1074', '137', '木棠镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1075', '137', '新州镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1076', '137', '三都镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1077', '137', '其他', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1078', '138', '长安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1079', '138', '桥东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1080', '138', '桥西区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1081', '138', '新华区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1082', '138', '裕华区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1083', '138', '井陉矿区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1084', '138', '高新区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1085', '138', '辛集市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1086', '138', '藁城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1087', '138', '晋州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1088', '138', '新乐市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1089', '138', '鹿泉市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1090', '138', '井陉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1091', '138', '正定县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1092', '138', '栾城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1093', '138', '行唐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1094', '138', '灵寿县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1095', '138', '高邑县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1096', '138', '深泽县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1097', '138', '赞皇县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1098', '138', '无极县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1099', '138', '平山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1100', '138', '元氏县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1101', '138', '赵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1102', '139', '新市区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1103', '139', '南市区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1104', '139', '北市区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1105', '139', '涿州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1106', '139', '定州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1107', '139', '安国市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1108', '139', '高碑店市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1109', '139', '满城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1110', '139', '清苑县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1111', '139', '涞水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1112', '139', '阜平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1113', '139', '徐水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1114', '139', '定兴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1115', '139', '唐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1116', '139', '高阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1117', '139', '容城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1118', '139', '涞源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1119', '139', '望都县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1120', '139', '安新县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1121', '139', '易县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1122', '139', '曲阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1123', '139', '蠡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1124', '139', '顺平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1125', '139', '博野县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1126', '139', '雄县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1127', '140', '运河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1128', '140', '新华区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1129', '140', '泊头市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1130', '140', '任丘市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1131', '140', '黄骅市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1132', '140', '河间市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1133', '140', '沧县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1134', '140', '青县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1135', '140', '东光县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1136', '140', '海兴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1137', '140', '盐山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1138', '140', '肃宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1139', '140', '南皮县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1140', '140', '吴桥县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1141', '140', '献县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1142', '140', '孟村', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1143', '141', '双桥区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1144', '141', '双滦区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1145', '141', '鹰手营子矿区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1146', '141', '承德县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1147', '141', '兴隆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1148', '141', '平泉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1149', '141', '滦平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1150', '141', '隆化县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1151', '141', '丰宁', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1152', '141', '宽城', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1153', '141', '围场', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1154', '142', '从台区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1155', '142', '复兴区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1156', '142', '邯山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1157', '142', '峰峰矿区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1158', '142', '武安市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1159', '142', '邯郸县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1160', '142', '临漳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1161', '142', '成安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1162', '142', '大名县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1163', '142', '涉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1164', '142', '磁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1165', '142', '肥乡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1166', '142', '永年县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1167', '142', '邱县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1168', '142', '鸡泽县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1169', '142', '广平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1170', '142', '馆陶县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1171', '142', '魏县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1172', '142', '曲周县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1173', '143', '桃城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1174', '143', '冀州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1175', '143', '深州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1176', '143', '枣强县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1177', '143', '武邑县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1178', '143', '武强县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1179', '143', '饶阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1180', '143', '安平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1181', '143', '故城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1182', '143', '景县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1183', '143', '阜城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1184', '144', '安次区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1185', '144', '广阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1186', '144', '霸州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1187', '144', '三河市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1188', '144', '固安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1189', '144', '永清县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1190', '144', '香河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1191', '144', '大城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1192', '144', '文安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1193', '144', '大厂', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1194', '145', '海港区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1195', '145', '山海关区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1196', '145', '北戴河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1197', '145', '昌黎县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1198', '145', '抚宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1199', '145', '卢龙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1200', '145', '青龙', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1201', '146', '路北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1202', '146', '路南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1203', '146', '古冶区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1204', '146', '开平区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1205', '146', '丰南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1206', '146', '丰润区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1207', '146', '遵化市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1208', '146', '迁安市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1209', '146', '滦县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1210', '146', '滦南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1211', '146', '乐亭县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1212', '146', '迁西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1213', '146', '玉田县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1214', '146', '唐海县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1215', '147', '桥东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1216', '147', '桥西区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1217', '147', '南宫市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1218', '147', '沙河市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1219', '147', '邢台县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1220', '147', '临城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1221', '147', '内丘县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1222', '147', '柏乡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1223', '147', '隆尧县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1224', '147', '任县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1225', '147', '南和县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1226', '147', '宁晋县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1227', '147', '巨鹿县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1228', '147', '新河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1229', '147', '广宗县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1230', '147', '平乡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1231', '147', '威县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1232', '147', '清河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1233', '147', '临西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1234', '148', '桥西区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1235', '148', '桥东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1236', '148', '宣化区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1237', '148', '下花园区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1238', '148', '宣化县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1239', '148', '张北县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1240', '148', '康保县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1241', '148', '沽源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1242', '148', '尚义县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1243', '148', '蔚县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1244', '148', '阳原县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1245', '148', '怀安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1246', '148', '万全县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1247', '148', '怀来县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1248', '148', '涿鹿县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1249', '148', '赤城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1250', '148', '崇礼县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1251', '149', '金水区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1252', '149', '邙山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1253', '149', '二七区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1254', '149', '管城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1255', '149', '中原区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1256', '149', '上街区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1257', '149', '惠济区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1258', '149', '郑东新区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1259', '149', '经济技术开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1260', '149', '高新开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1261', '149', '出口加工区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1262', '149', '巩义市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1263', '149', '荥阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1264', '149', '新密市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1265', '149', '新郑市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1266', '149', '登封市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1267', '149', '中牟县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1268', '150', '西工区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1269', '150', '老城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1270', '150', '涧西区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1271', '150', '瀍河回族区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1272', '150', '洛龙区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1273', '150', '吉利区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1274', '150', '偃师市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1275', '150', '孟津县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1276', '150', '新安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1277', '150', '栾川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1278', '150', '嵩县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1279', '150', '汝阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1280', '150', '宜阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1281', '150', '洛宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1282', '150', '伊川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1283', '151', '鼓楼区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1284', '151', '龙亭区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1285', '151', '顺河回族区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1286', '151', '金明区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1287', '151', '禹王台区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1288', '151', '杞县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1289', '151', '通许县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1290', '151', '尉氏县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1291', '151', '开封县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1292', '151', '兰考县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1293', '152', '北关区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1294', '152', '文峰区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1295', '152', '殷都区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1296', '152', '龙安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1297', '152', '林州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1298', '152', '安阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1299', '152', '汤阴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1300', '152', '滑县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1301', '152', '内黄县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1302', '153', '淇滨区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1303', '153', '山城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1304', '153', '鹤山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1305', '153', '浚县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1306', '153', '淇县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1307', '154', '济源市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1308', '155', '解放区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1309', '155', '中站区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1310', '155', '马村区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1311', '155', '山阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1312', '155', '沁阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1313', '155', '孟州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1314', '155', '修武县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1315', '155', '博爱县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1316', '155', '武陟县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1317', '155', '温县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1318', '156', '卧龙区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1319', '156', '宛城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1320', '156', '邓州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1321', '156', '南召县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1322', '156', '方城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1323', '156', '西峡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1324', '156', '镇平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1325', '156', '内乡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1326', '156', '淅川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1327', '156', '社旗县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1328', '156', '唐河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1329', '156', '新野县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1330', '156', '桐柏县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1331', '157', '新华区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1332', '157', '卫东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1333', '157', '湛河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1334', '157', '石龙区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1335', '157', '舞钢市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1336', '157', '汝州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1337', '157', '宝丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1338', '157', '叶县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1339', '157', '鲁山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1340', '157', '郏县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1341', '158', '湖滨区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1342', '158', '义马市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1343', '158', '灵宝市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1344', '158', '渑池县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1345', '158', '陕县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1346', '158', '卢氏县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1347', '159', '梁园区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1348', '159', '睢阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1349', '159', '永城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1350', '159', '民权县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1351', '159', '睢县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1352', '159', '宁陵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1353', '159', '虞城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1354', '159', '柘城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1355', '159', '夏邑县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1356', '160', '卫滨区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1357', '160', '红旗区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1358', '160', '凤泉区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1359', '160', '牧野区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1360', '160', '卫辉市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1361', '160', '辉县市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1362', '160', '新乡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1363', '160', '获嘉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1364', '160', '原阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1365', '160', '延津县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1366', '160', '封丘县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1367', '160', '长垣县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1368', '161', '浉河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1369', '161', '平桥区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1370', '161', '罗山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1371', '161', '光山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1372', '161', '新县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1373', '161', '商城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1374', '161', '固始县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1375', '161', '潢川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1376', '161', '淮滨县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1377', '161', '息县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1378', '162', '魏都区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1379', '162', '禹州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1380', '162', '长葛市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1381', '162', '许昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1382', '162', '鄢陵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1383', '162', '襄城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1384', '163', '川汇区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1385', '163', '项城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1386', '163', '扶沟县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1387', '163', '西华县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1388', '163', '商水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1389', '163', '沈丘县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1390', '163', '郸城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1391', '163', '淮阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1392', '163', '太康县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1393', '163', '鹿邑县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1394', '164', '驿城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1395', '164', '西平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1396', '164', '上蔡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1397', '164', '平舆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1398', '164', '正阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1399', '164', '确山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1400', '164', '泌阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1401', '164', '汝南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1402', '164', '遂平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1403', '164', '新蔡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1404', '165', '郾城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1405', '165', '源汇区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1406', '165', '召陵区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1407', '165', '舞阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1408', '165', '临颍县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1409', '166', '华龙区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1410', '166', '清丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1411', '166', '南乐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1412', '166', '范县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1413', '166', '台前县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1414', '166', '濮阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1415', '167', '道里区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1416', '167', '南岗区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1417', '167', '动力区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1418', '167', '平房区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1419', '167', '香坊区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1420', '167', '太平区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1421', '167', '道外区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1422', '167', '阿城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1423', '167', '呼兰区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1424', '167', '松北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1425', '167', '尚志市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1426', '167', '双城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1427', '167', '五常市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1428', '167', '方正县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1429', '167', '宾县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1430', '167', '依兰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1431', '167', '巴彦县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1432', '167', '通河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1433', '167', '木兰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1434', '167', '延寿县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1435', '168', '萨尔图区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1436', '168', '红岗区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1437', '168', '龙凤区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1438', '168', '让胡路区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1439', '168', '大同区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1440', '168', '肇州县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1441', '168', '肇源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1442', '168', '林甸县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1443', '168', '杜尔伯特', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1444', '169', '呼玛县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1445', '169', '漠河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1446', '169', '塔河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1447', '170', '兴山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1448', '170', '工农区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1449', '170', '南山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1450', '170', '兴安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1451', '170', '向阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1452', '170', '东山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1453', '170', '萝北县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1454', '170', '绥滨县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1455', '171', '爱辉区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1456', '171', '五大连池市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1457', '171', '北安市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1458', '171', '嫩江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1459', '171', '逊克县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1460', '171', '孙吴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1461', '172', '鸡冠区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1462', '172', '恒山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1463', '172', '城子河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1464', '172', '滴道区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1465', '172', '梨树区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1466', '172', '虎林市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1467', '172', '密山市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1468', '172', '鸡东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1469', '173', '前进区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1470', '173', '郊区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1471', '173', '向阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1472', '173', '东风区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1473', '173', '同江市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1474', '173', '富锦市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1475', '173', '桦南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1476', '173', '桦川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1477', '173', '汤原县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1478', '173', '抚远县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1479', '174', '爱民区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1480', '174', '东安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1481', '174', '阳明区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1482', '174', '西安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1483', '174', '绥芬河市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1484', '174', '海林市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1485', '174', '宁安市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1486', '174', '穆棱市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1487', '174', '东宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1488', '174', '林口县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1489', '175', '桃山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1490', '175', '新兴区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1491', '175', '茄子河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1492', '175', '勃利县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1493', '176', '龙沙区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1494', '176', '昂昂溪区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1495', '176', '铁峰区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1496', '176', '建华区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1497', '176', '富拉尔基区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1498', '176', '碾子山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1499', '176', '梅里斯达斡尔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1500', '176', '讷河市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1501', '176', '龙江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1502', '176', '依安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1503', '176', '泰来县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1504', '176', '甘南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1505', '176', '富裕县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1506', '176', '克山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1507', '176', '克东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1508', '176', '拜泉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1509', '177', '尖山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1510', '177', '岭东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1511', '177', '四方台区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1512', '177', '宝山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1513', '177', '集贤县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1514', '177', '友谊县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1515', '177', '宝清县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1516', '177', '饶河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1517', '178', '北林区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1518', '178', '安达市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1519', '178', '肇东市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1520', '178', '海伦市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1521', '178', '望奎县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1522', '178', '兰西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1523', '178', '青冈县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1524', '178', '庆安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1525', '178', '明水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1526', '178', '绥棱县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1527', '179', '伊春区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1528', '179', '带岭区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1529', '179', '南岔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1530', '179', '金山屯区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1531', '179', '西林区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1532', '179', '美溪区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1533', '179', '乌马河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1534', '179', '翠峦区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1535', '179', '友好区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1536', '179', '上甘岭区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1537', '179', '五营区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1538', '179', '红星区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1539', '179', '新青区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1540', '179', '汤旺河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1541', '179', '乌伊岭区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1542', '179', '铁力市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1543', '179', '嘉荫县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1544', '180', '江岸区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1545', '180', '武昌区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1546', '180', '江汉区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1547', '180', '硚口区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1548', '180', '汉阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1549', '180', '青山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1550', '180', '洪山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1551', '180', '东西湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1552', '180', '汉南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1553', '180', '蔡甸区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1554', '180', '江夏区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1555', '180', '黄陂区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1556', '180', '新洲区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1557', '180', '经济开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1558', '181', '仙桃市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1559', '182', '鄂城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1560', '182', '华容区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1561', '182', '梁子湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1562', '183', '黄州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1563', '183', '麻城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1564', '183', '武穴市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1565', '183', '团风县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1566', '183', '红安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1567', '183', '罗田县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1568', '183', '英山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1569', '183', '浠水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1570', '183', '蕲春县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1571', '183', '黄梅县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1572', '184', '黄石港区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1573', '184', '西塞山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1574', '184', '下陆区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1575', '184', '铁山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1576', '184', '大冶市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1577', '184', '阳新县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1578', '185', '东宝区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1579', '185', '掇刀区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1580', '185', '钟祥市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1581', '185', '京山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1582', '185', '沙洋县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1583', '186', '沙市区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1584', '186', '荆州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1585', '186', '石首市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1586', '186', '洪湖市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1587', '186', '松滋市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1588', '186', '公安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1589', '186', '监利县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1590', '186', '江陵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1591', '187', '潜江市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1592', '188', '神农架林区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1593', '189', '张湾区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1594', '189', '茅箭区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1595', '189', '丹江口市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1596', '189', '郧县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1597', '189', '郧西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1598', '189', '竹山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1599', '189', '竹溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1600', '189', '房县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1601', '190', '曾都区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1602', '190', '广水市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1603', '191', '天门市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1604', '192', '咸安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1605', '192', '赤壁市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1606', '192', '嘉鱼县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1607', '192', '通城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1608', '192', '崇阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1609', '192', '通山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1610', '193', '襄城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1611', '193', '樊城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1612', '193', '襄阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1613', '193', '老河口市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1614', '193', '枣阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1615', '193', '宜城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1616', '193', '南漳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1617', '193', '谷城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1618', '193', '保康县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1619', '194', '孝南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1620', '194', '应城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1621', '194', '安陆市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1622', '194', '汉川市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1623', '194', '孝昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1624', '194', '大悟县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1625', '194', '云梦县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1626', '195', '长阳', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1627', '195', '五峰', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1628', '195', '西陵区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1629', '195', '伍家岗区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1630', '195', '点军区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1631', '195', '猇亭区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1632', '195', '夷陵区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1633', '195', '宜都市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1634', '195', '当阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1635', '195', '枝江市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1636', '195', '远安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1637', '195', '兴山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1638', '195', '秭归县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1639', '196', '恩施市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1640', '196', '利川市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1641', '196', '建始县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1642', '196', '巴东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1643', '196', '宣恩县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1644', '196', '咸丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1645', '196', '来凤县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1646', '196', '鹤峰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1647', '197', '岳麓区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1648', '197', '芙蓉区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1649', '197', '天心区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1650', '197', '开福区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1651', '197', '雨花区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1652', '197', '开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1653', '197', '浏阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1654', '197', '长沙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1655', '197', '望城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1656', '197', '宁乡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1657', '198', '永定区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1658', '198', '武陵源区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1659', '198', '慈利县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1660', '198', '桑植县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1661', '199', '武陵区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1662', '199', '鼎城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1663', '199', '津市市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1664', '199', '安乡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1665', '199', '汉寿县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1666', '199', '澧县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1667', '199', '临澧县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1668', '199', '桃源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1669', '199', '石门县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1670', '200', '北湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1671', '200', '苏仙区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1672', '200', '资兴市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1673', '200', '桂阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1674', '200', '宜章县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1675', '200', '永兴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1676', '200', '嘉禾县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1677', '200', '临武县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1678', '200', '汝城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1679', '200', '桂东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1680', '200', '安仁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1681', '201', '雁峰区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1682', '201', '珠晖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1683', '201', '石鼓区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1684', '201', '蒸湘区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1685', '201', '南岳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1686', '201', '耒阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1687', '201', '常宁市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1688', '201', '衡阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1689', '201', '衡南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1690', '201', '衡山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1691', '201', '衡东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1692', '201', '祁东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1693', '202', '鹤城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1694', '202', '靖州', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1695', '202', '麻阳', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1696', '202', '通道', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1697', '202', '新晃', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1698', '202', '芷江', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1699', '202', '沅陵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1700', '202', '辰溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1701', '202', '溆浦县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1702', '202', '中方县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1703', '202', '会同县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1704', '202', '洪江市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1705', '203', '娄星区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1706', '203', '冷水江市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1707', '203', '涟源市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1708', '203', '双峰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1709', '203', '新化县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1710', '204', '城步', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1711', '204', '双清区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1712', '204', '大祥区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1713', '204', '北塔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1714', '204', '武冈市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1715', '204', '邵东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1716', '204', '新邵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1717', '204', '邵阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1718', '204', '隆回县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1719', '204', '洞口县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1720', '204', '绥宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1721', '204', '新宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1722', '205', '岳塘区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1723', '205', '雨湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1724', '205', '湘乡市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1725', '205', '韶山市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1726', '205', '湘潭县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1727', '206', '吉首市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1728', '206', '泸溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1729', '206', '凤凰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1730', '206', '花垣县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1731', '206', '保靖县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1732', '206', '古丈县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1733', '206', '永顺县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1734', '206', '龙山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1735', '207', '赫山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1736', '207', '资阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1737', '207', '沅江市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1738', '207', '南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1739', '207', '桃江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1740', '207', '安化县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1741', '208', '江华', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1742', '208', '冷水滩区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1743', '208', '零陵区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1744', '208', '祁阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1745', '208', '东安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1746', '208', '双牌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1747', '208', '道县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1748', '208', '江永县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1749', '208', '宁远县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1750', '208', '蓝山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1751', '208', '新田县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1752', '209', '岳阳楼区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1753', '209', '君山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1754', '209', '云溪区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1755', '209', '汨罗市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1756', '209', '临湘市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1757', '209', '岳阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1758', '209', '华容县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1759', '209', '湘阴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1760', '209', '平江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1761', '210', '天元区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1762', '210', '荷塘区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1763', '210', '芦淞区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1764', '210', '石峰区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1765', '210', '醴陵市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1766', '210', '株洲县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1767', '210', '攸县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1768', '210', '茶陵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1769', '210', '炎陵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1770', '211', '朝阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1771', '211', '宽城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1772', '211', '二道区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1773', '211', '南关区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1774', '211', '绿园区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1775', '211', '双阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1776', '211', '净月潭开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1777', '211', '高新技术开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1778', '211', '经济技术开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1779', '211', '汽车产业开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1780', '211', '德惠市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1781', '211', '九台市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1782', '211', '榆树市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1783', '211', '农安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1784', '212', '船营区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1785', '212', '昌邑区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1786', '212', '龙潭区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1787', '212', '丰满区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1788', '212', '蛟河市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1789', '212', '桦甸市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1790', '212', '舒兰市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1791', '212', '磐石市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1792', '212', '永吉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1793', '213', '洮北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1794', '213', '洮南市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1795', '213', '大安市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1796', '213', '镇赉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1797', '213', '通榆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1798', '214', '江源区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1799', '214', '八道江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1800', '214', '长白', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1801', '214', '临江市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1802', '214', '抚松县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1803', '214', '靖宇县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1804', '215', '龙山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1805', '215', '西安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1806', '215', '东丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1807', '215', '东辽县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1808', '216', '铁西区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1809', '216', '铁东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1810', '216', '伊通', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1811', '216', '公主岭市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1812', '216', '双辽市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1813', '216', '梨树县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1814', '217', '前郭尔罗斯', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1815', '217', '宁江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1816', '217', '长岭县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1817', '217', '乾安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1818', '217', '扶余县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1819', '218', '东昌区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1820', '218', '二道江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1821', '218', '梅河口市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1822', '218', '集安市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1823', '218', '通化县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1824', '218', '辉南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1825', '218', '柳河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1826', '219', '延吉市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1827', '219', '图们市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1828', '219', '敦化市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1829', '219', '珲春市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1830', '219', '龙井市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1831', '219', '和龙市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1832', '219', '安图县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1833', '219', '汪清县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1834', '220', '玄武区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1835', '220', '鼓楼区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1836', '220', '白下区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1837', '220', '建邺区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1838', '220', '秦淮区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1839', '220', '雨花台区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1840', '220', '下关区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1841', '220', '栖霞区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1842', '220', '浦口区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1843', '220', '江宁区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1844', '220', '六合区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1845', '220', '溧水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1846', '220', '高淳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1847', '221', '沧浪区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1848', '221', '金阊区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1849', '221', '平江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1850', '221', '虎丘区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1851', '221', '吴中区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1852', '221', '相城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1853', '221', '园区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1854', '221', '新区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1855', '221', '常熟市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1856', '221', '张家港市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1857', '221', '玉山镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1858', '221', '巴城镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1859', '221', '周市镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1860', '221', '陆家镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1861', '221', '花桥镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1862', '221', '淀山湖镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1863', '221', '张浦镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1864', '221', '周庄镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1865', '221', '千灯镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1866', '221', '锦溪镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1867', '221', '开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1868', '221', '吴江市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1869', '221', '太仓市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1870', '222', '崇安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1871', '222', '北塘区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1872', '222', '南长区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1873', '222', '锡山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1874', '222', '惠山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1875', '222', '滨湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1876', '222', '新区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1877', '222', '江阴市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1878', '222', '宜兴市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1879', '223', '天宁区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1880', '223', '钟楼区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1881', '223', '戚墅堰区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1882', '223', '郊区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1883', '223', '新北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1884', '223', '武进区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1885', '223', '溧阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1886', '223', '金坛市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1887', '224', '清河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1888', '224', '清浦区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1889', '224', '楚州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1890', '224', '淮阴区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1891', '224', '涟水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1892', '224', '洪泽县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1893', '224', '盱眙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1894', '224', '金湖县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1895', '225', '新浦区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1896', '225', '连云区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1897', '225', '海州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1898', '225', '赣榆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1899', '225', '东海县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1900', '225', '灌云县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1901', '225', '灌南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1902', '226', '崇川区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1903', '226', '港闸区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1904', '226', '经济开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1905', '226', '启东市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1906', '226', '如皋市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1907', '226', '通州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1908', '226', '海门市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1909', '226', '海安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1910', '226', '如东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1911', '227', '宿城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1912', '227', '宿豫区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1913', '227', '宿豫县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1914', '227', '沭阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1915', '227', '泗阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1916', '227', '泗洪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1917', '228', '海陵区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1918', '228', '高港区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1919', '228', '兴化市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1920', '228', '靖江市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1921', '228', '泰兴市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1922', '228', '姜堰市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1923', '229', '云龙区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1924', '229', '鼓楼区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1925', '229', '九里区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1926', '229', '贾汪区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1927', '229', '泉山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1928', '229', '新沂市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1929', '229', '邳州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1930', '229', '丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1931', '229', '沛县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1932', '229', '铜山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1933', '229', '睢宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1934', '230', '城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1935', '230', '亭湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1936', '230', '盐都区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1937', '230', '盐都县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1938', '230', '东台市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1939', '230', '大丰市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1940', '230', '响水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1941', '230', '滨海县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1942', '230', '阜宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1943', '230', '射阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1944', '230', '建湖县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1945', '231', '广陵区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1946', '231', '维扬区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1947', '231', '邗江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1948', '231', '仪征市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1949', '231', '高邮市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1950', '231', '江都市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1951', '231', '宝应县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1952', '232', '京口区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1953', '232', '润州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1954', '232', '丹徒区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1955', '232', '丹阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1956', '232', '扬中市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1957', '232', '句容市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1958', '233', '东湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1959', '233', '西湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1960', '233', '青云谱区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1961', '233', '湾里区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1962', '233', '青山湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1963', '233', '红谷滩新区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1964', '233', '昌北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1965', '233', '高新区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1966', '233', '南昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1967', '233', '新建县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1968', '233', '安义县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1969', '233', '进贤县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1970', '234', '临川区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1971', '234', '南城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1972', '234', '黎川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1973', '234', '南丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1974', '234', '崇仁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1975', '234', '乐安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1976', '234', '宜黄县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1977', '234', '金溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1978', '234', '资溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1979', '234', '东乡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1980', '234', '广昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1981', '235', '章贡区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1982', '235', '于都县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1983', '235', '瑞金市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1984', '235', '南康市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1985', '235', '赣县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1986', '235', '信丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1987', '235', '大余县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1988', '235', '上犹县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1989', '235', '崇义县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1990', '235', '安远县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1991', '235', '龙南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1992', '235', '定南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1993', '235', '全南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1994', '235', '宁都县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1995', '235', '兴国县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1996', '235', '会昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1997', '235', '寻乌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1998', '235', '石城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('1999', '236', '安福县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2000', '236', '吉州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2001', '236', '青原区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2002', '236', '井冈山市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2003', '236', '吉安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2004', '236', '吉水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2005', '236', '峡江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2006', '236', '新干县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2007', '236', '永丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2008', '236', '泰和县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2009', '236', '遂川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2010', '236', '万安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2011', '236', '永新县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2012', '237', '珠山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2013', '237', '昌江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2014', '237', '乐平市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2015', '237', '浮梁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2016', '238', '浔阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2017', '238', '庐山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2018', '238', '瑞昌市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2019', '238', '九江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2020', '238', '武宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2021', '238', '修水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2022', '238', '永修县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2023', '238', '德安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2024', '238', '星子县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2025', '238', '都昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2026', '238', '湖口县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2027', '238', '彭泽县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2028', '239', '安源区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2029', '239', '湘东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2030', '239', '莲花县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2031', '239', '芦溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2032', '239', '上栗县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2033', '240', '信州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2034', '240', '德兴市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2035', '240', '上饶县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2036', '240', '广丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2037', '240', '玉山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2038', '240', '铅山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2039', '240', '横峰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2040', '240', '弋阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2041', '240', '余干县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2042', '240', '波阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2043', '240', '万年县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2044', '240', '婺源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2045', '241', '渝水区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2046', '241', '分宜县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2047', '242', '袁州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2048', '242', '丰城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2049', '242', '樟树市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2050', '242', '高安市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2051', '242', '奉新县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2052', '242', '万载县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2053', '242', '上高县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2054', '242', '宜丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2055', '242', '靖安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2056', '242', '铜鼓县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2057', '243', '月湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2058', '243', '贵溪市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2059', '243', '余江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2060', '244', '沈河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2061', '244', '皇姑区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2062', '244', '和平区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2063', '244', '大东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2064', '244', '铁西区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2065', '244', '苏家屯区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2066', '244', '东陵区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2067', '244', '沈北新区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2068', '244', '于洪区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2069', '244', '浑南新区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2070', '244', '新民市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2071', '244', '辽中县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2072', '244', '康平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2073', '244', '法库县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2074', '245', '西岗区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2075', '245', '中山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2076', '245', '沙河口区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2077', '245', '甘井子区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2078', '245', '旅顺口区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2079', '245', '金州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2080', '245', '开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2081', '245', '瓦房店市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2082', '245', '普兰店市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2083', '245', '庄河市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2084', '245', '长海县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2085', '246', '铁东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2086', '246', '铁西区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2087', '246', '立山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2088', '246', '千山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2089', '246', '岫岩', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2090', '246', '海城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2091', '246', '台安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2092', '247', '本溪', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2093', '247', '平山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2094', '247', '明山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2095', '247', '溪湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2096', '247', '南芬区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2097', '247', '桓仁', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2098', '248', '双塔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2099', '248', '龙城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2100', '248', '喀喇沁左翼蒙古族自治县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2101', '248', '北票市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2102', '248', '凌源市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2103', '248', '朝阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2104', '248', '建平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2105', '249', '振兴区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2106', '249', '元宝区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2107', '249', '振安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2108', '249', '宽甸', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2109', '249', '东港市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2110', '249', '凤城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2111', '250', '顺城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2112', '250', '新抚区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2113', '250', '东洲区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2114', '250', '望花区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2115', '250', '清原', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2116', '250', '新宾', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2117', '250', '抚顺县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2118', '251', '阜新', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2119', '251', '海州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2120', '251', '新邱区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2121', '251', '太平区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2122', '251', '清河门区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2123', '251', '细河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2124', '251', '彰武县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2125', '252', '龙港区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2126', '252', '南票区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2127', '252', '连山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2128', '252', '兴城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2129', '252', '绥中县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2130', '252', '建昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2131', '253', '太和区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2132', '253', '古塔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2133', '253', '凌河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2134', '253', '凌海市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2135', '253', '北镇市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2136', '253', '黑山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2137', '253', '义县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2138', '254', '白塔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2139', '254', '文圣区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2140', '254', '宏伟区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2141', '254', '太子河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2142', '254', '弓长岭区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2143', '254', '灯塔市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2144', '254', '辽阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2145', '255', '双台子区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2146', '255', '兴隆台区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2147', '255', '大洼县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2148', '255', '盘山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2149', '256', '银州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2150', '256', '清河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2151', '256', '调兵山市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2152', '256', '开原市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2153', '256', '铁岭县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2154', '256', '西丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2155', '256', '昌图县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2156', '257', '站前区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2157', '257', '西市区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2158', '257', '鲅鱼圈区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2159', '257', '老边区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2160', '257', '盖州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2161', '257', '大石桥市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2162', '258', '回民区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2163', '258', '玉泉区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2164', '258', '新城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2165', '258', '赛罕区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2166', '258', '清水河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2167', '258', '土默特左旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2168', '258', '托克托县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2169', '258', '和林格尔县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2170', '258', '武川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2171', '259', '阿拉善左旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2172', '259', '阿拉善右旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2173', '259', '额济纳旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2174', '260', '临河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2175', '260', '五原县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2176', '260', '磴口县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2177', '260', '乌拉特前旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2178', '260', '乌拉特中旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2179', '260', '乌拉特后旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2180', '260', '杭锦后旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2181', '261', '昆都仑区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2182', '261', '青山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2183', '261', '东河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2184', '261', '九原区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2185', '261', '石拐区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2186', '261', '白云矿区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2187', '261', '土默特右旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2188', '261', '固阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2189', '261', '达尔罕茂明安联合旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2190', '262', '红山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2191', '262', '元宝山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2192', '262', '松山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2193', '262', '阿鲁科尔沁旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2194', '262', '巴林左旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2195', '262', '巴林右旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2196', '262', '林西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2197', '262', '克什克腾旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2198', '262', '翁牛特旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2199', '262', '喀喇沁旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2200', '262', '宁城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2201', '262', '敖汉旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2202', '263', '东胜区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2203', '263', '达拉特旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2204', '263', '准格尔旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2205', '263', '鄂托克前旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2206', '263', '鄂托克旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2207', '263', '杭锦旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2208', '263', '乌审旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2209', '263', '伊金霍洛旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2210', '264', '海拉尔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2211', '264', '莫力达瓦', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2212', '264', '满洲里市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2213', '264', '牙克石市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2214', '264', '扎兰屯市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2215', '264', '额尔古纳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2216', '264', '根河市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2217', '264', '阿荣旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2218', '264', '鄂伦春自治旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2219', '264', '鄂温克族自治旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2220', '264', '陈巴尔虎旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2221', '264', '新巴尔虎左旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2222', '264', '新巴尔虎右旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2223', '265', '科尔沁区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2224', '265', '霍林郭勒市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2225', '265', '科尔沁左翼中旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2226', '265', '科尔沁左翼后旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2227', '265', '开鲁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2228', '265', '库伦旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2229', '265', '奈曼旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2230', '265', '扎鲁特旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2231', '266', '海勃湾区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2232', '266', '乌达区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2233', '266', '海南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2234', '267', '化德县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2235', '267', '集宁区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2236', '267', '丰镇市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2237', '267', '卓资县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2238', '267', '商都县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2239', '267', '兴和县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2240', '267', '凉城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2241', '267', '察哈尔右翼前旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2242', '267', '察哈尔右翼中旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2243', '267', '察哈尔右翼后旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2244', '267', '四子王旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2245', '268', '二连浩特市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2246', '268', '锡林浩特市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2247', '268', '阿巴嘎旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2248', '268', '苏尼特左旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2249', '268', '苏尼特右旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2250', '268', '东乌珠穆沁旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2251', '268', '西乌珠穆沁旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2252', '268', '太仆寺旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2253', '268', '镶黄旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2254', '268', '正镶白旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2255', '268', '正蓝旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2256', '268', '多伦县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2257', '269', '乌兰浩特市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2258', '269', '阿尔山市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2259', '269', '科尔沁右翼前旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2260', '269', '科尔沁右翼中旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2261', '269', '扎赉特旗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2262', '269', '突泉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2263', '270', '西夏区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2264', '270', '金凤区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2265', '270', '兴庆区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2266', '270', '灵武市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2267', '270', '永宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2268', '270', '贺兰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2269', '271', '原州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2270', '271', '海原县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2271', '271', '西吉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2272', '271', '隆德县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2273', '271', '泾源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2274', '271', '彭阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2275', '272', '惠农县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2276', '272', '大武口区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2277', '272', '惠农区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2278', '272', '陶乐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2279', '272', '平罗县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2280', '273', '利通区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2281', '273', '中卫县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2282', '273', '青铜峡市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2283', '273', '中宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2284', '273', '盐池县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2285', '273', '同心县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2286', '274', '沙坡头区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2287', '274', '海原县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2288', '274', '中宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2289', '275', '城中区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2290', '275', '城东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2291', '275', '城西区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2292', '275', '城北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2293', '275', '湟中县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2294', '275', '湟源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2295', '275', '大通', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2296', '276', '玛沁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2297', '276', '班玛县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2298', '276', '甘德县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2299', '276', '达日县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2300', '276', '久治县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2301', '276', '玛多县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2302', '277', '海晏县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2303', '277', '祁连县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2304', '277', '刚察县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2305', '277', '门源', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2306', '278', '平安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2307', '278', '乐都县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2308', '278', '民和', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2309', '278', '互助', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2310', '278', '化隆', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2311', '278', '循化', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2312', '279', '共和县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2313', '279', '同德县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2314', '279', '贵德县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2315', '279', '兴海县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2316', '279', '贵南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2317', '280', '德令哈市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2318', '280', '格尔木市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2319', '280', '乌兰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2320', '280', '都兰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2321', '280', '天峻县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2322', '281', '同仁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2323', '281', '尖扎县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2324', '281', '泽库县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2325', '281', '河南蒙古族自治县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2326', '282', '玉树县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2327', '282', '杂多县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2328', '282', '称多县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2329', '282', '治多县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2330', '282', '囊谦县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2331', '282', '曲麻莱县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2332', '283', '市中区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2333', '283', '历下区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2334', '283', '天桥区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2335', '283', '槐荫区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2336', '283', '历城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2337', '283', '长清区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2338', '283', '章丘市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2339', '283', '平阴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2340', '283', '济阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2341', '283', '商河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2342', '284', '市南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2343', '284', '市北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2344', '284', '城阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2345', '284', '四方区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2346', '284', '李沧区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2347', '284', '黄岛区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2348', '284', '崂山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2349', '284', '胶州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2350', '284', '即墨市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2351', '284', '平度市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2352', '284', '胶南市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2353', '284', '莱西市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2354', '285', '滨城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2355', '285', '惠民县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2356', '285', '阳信县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2357', '285', '无棣县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2358', '285', '沾化县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2359', '285', '博兴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2360', '285', '邹平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2361', '286', '德城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2362', '286', '陵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2363', '286', '乐陵市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2364', '286', '禹城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2365', '286', '宁津县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2366', '286', '庆云县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2367', '286', '临邑县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2368', '286', '齐河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2369', '286', '平原县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2370', '286', '夏津县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2371', '286', '武城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2372', '287', '东营区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2373', '287', '河口区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2374', '287', '垦利县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2375', '287', '利津县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2376', '287', '广饶县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2377', '288', '牡丹区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2378', '288', '曹县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2379', '288', '单县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2380', '288', '成武县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2381', '288', '巨野县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2382', '288', '郓城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2383', '288', '鄄城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2384', '288', '定陶县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2385', '288', '东明县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2386', '289', '市中区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2387', '289', '任城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2388', '289', '曲阜市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2389', '289', '兖州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2390', '289', '邹城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2391', '289', '微山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2392', '289', '鱼台县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2393', '289', '金乡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2394', '289', '嘉祥县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2395', '289', '汶上县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2396', '289', '泗水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2397', '289', '梁山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2398', '290', '莱城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2399', '290', '钢城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2400', '291', '东昌府区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2401', '291', '临清市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2402', '291', '阳谷县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2403', '291', '莘县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2404', '291', '茌平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2405', '291', '东阿县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2406', '291', '冠县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2407', '291', '高唐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2408', '292', '兰山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2409', '292', '罗庄区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2410', '292', '河东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2411', '292', '沂南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2412', '292', '郯城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2413', '292', '沂水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2414', '292', '苍山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2415', '292', '费县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2416', '292', '平邑县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2417', '292', '莒南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2418', '292', '蒙阴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2419', '292', '临沭县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2420', '293', '东港区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2421', '293', '岚山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2422', '293', '五莲县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2423', '293', '莒县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2424', '294', '泰山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2425', '294', '岱岳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2426', '294', '新泰市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2427', '294', '肥城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2428', '294', '宁阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2429', '294', '东平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2430', '295', '荣成市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2431', '295', '乳山市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2432', '295', '环翠区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2433', '295', '文登市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2434', '296', '潍城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2435', '296', '寒亭区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2436', '296', '坊子区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2437', '296', '奎文区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2438', '296', '青州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2439', '296', '诸城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2440', '296', '寿光市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2441', '296', '安丘市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2442', '296', '高密市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2443', '296', '昌邑市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2444', '296', '临朐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2445', '296', '昌乐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2446', '297', '芝罘区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2447', '297', '福山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2448', '297', '牟平区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2449', '297', '莱山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2450', '297', '开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2451', '297', '龙口市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2452', '297', '莱阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2453', '297', '莱州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2454', '297', '蓬莱市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2455', '297', '招远市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2456', '297', '栖霞市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2457', '297', '海阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2458', '297', '长岛县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2459', '298', '市中区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2460', '298', '山亭区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2461', '298', '峄城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2462', '298', '台儿庄区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2463', '298', '薛城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2464', '298', '滕州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2465', '299', '张店区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2466', '299', '临淄区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2467', '299', '淄川区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2468', '299', '博山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2469', '299', '周村区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2470', '299', '桓台县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2471', '299', '高青县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2472', '299', '沂源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2473', '300', '杏花岭区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2474', '300', '小店区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2475', '300', '迎泽区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2476', '300', '尖草坪区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2477', '300', '万柏林区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2478', '300', '晋源区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2479', '300', '高新开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2480', '300', '民营经济开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2481', '300', '经济技术开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2482', '300', '清徐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2483', '300', '阳曲县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2484', '300', '娄烦县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2485', '300', '古交市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2486', '301', '城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2487', '301', '郊区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2488', '301', '沁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2489', '301', '潞城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2490', '301', '长治县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2491', '301', '襄垣县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2492', '301', '屯留县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2493', '301', '平顺县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2494', '301', '黎城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2495', '301', '壶关县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2496', '301', '长子县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2497', '301', '武乡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2498', '301', '沁源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2499', '302', '城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2500', '302', '矿区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2501', '302', '南郊区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2502', '302', '新荣区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2503', '302', '阳高县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2504', '302', '天镇县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2505', '302', '广灵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2506', '302', '灵丘县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2507', '302', '浑源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2508', '302', '左云县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2509', '302', '大同县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2510', '303', '城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2511', '303', '高平市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2512', '303', '沁水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2513', '303', '阳城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2514', '303', '陵川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2515', '303', '泽州县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2516', '304', '榆次区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2517', '304', '介休市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2518', '304', '榆社县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2519', '304', '左权县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2520', '304', '和顺县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2521', '304', '昔阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2522', '304', '寿阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2523', '304', '太谷县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2524', '304', '祁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2525', '304', '平遥县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2526', '304', '灵石县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2527', '305', '尧都区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2528', '305', '侯马市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2529', '305', '霍州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2530', '305', '曲沃县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2531', '305', '翼城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2532', '305', '襄汾县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2533', '305', '洪洞县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2534', '305', '吉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2535', '305', '安泽县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2536', '305', '浮山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2537', '305', '古县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2538', '305', '乡宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2539', '305', '大宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2540', '305', '隰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2541', '305', '永和县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2542', '305', '蒲县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2543', '305', '汾西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2544', '306', '离石市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2545', '306', '离石区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2546', '306', '孝义市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2547', '306', '汾阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2548', '306', '文水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2549', '306', '交城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2550', '306', '兴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2551', '306', '临县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2552', '306', '柳林县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2553', '306', '石楼县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2554', '306', '岚县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2555', '306', '方山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2556', '306', '中阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2557', '306', '交口县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2558', '307', '朔城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2559', '307', '平鲁区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2560', '307', '山阴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2561', '307', '应县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2562', '307', '右玉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2563', '307', '怀仁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2564', '308', '忻府区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2565', '308', '原平市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2566', '308', '定襄县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2567', '308', '五台县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2568', '308', '代县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2569', '308', '繁峙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2570', '308', '宁武县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2571', '308', '静乐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2572', '308', '神池县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2573', '308', '五寨县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2574', '308', '岢岚县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2575', '308', '河曲县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2576', '308', '保德县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2577', '308', '偏关县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2578', '309', '城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2579', '309', '矿区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2580', '309', '郊区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2581', '309', '平定县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2582', '309', '盂县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2583', '310', '盐湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2584', '310', '永济市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2585', '310', '河津市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2586', '310', '临猗县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2587', '310', '万荣县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2588', '310', '闻喜县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2589', '310', '稷山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2590', '310', '新绛县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2591', '310', '绛县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2592', '310', '垣曲县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2593', '310', '夏县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2594', '310', '平陆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2595', '310', '芮城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2596', '311', '莲湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2597', '311', '新城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2598', '311', '碑林区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2599', '311', '雁塔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2600', '311', '灞桥区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2601', '311', '未央区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2602', '311', '阎良区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2603', '311', '临潼区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2604', '311', '长安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2605', '311', '蓝田县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2606', '311', '周至县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2607', '311', '户县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2608', '311', '高陵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2609', '312', '汉滨区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2610', '312', '汉阴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2611', '312', '石泉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2612', '312', '宁陕县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2613', '312', '紫阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2614', '312', '岚皋县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2615', '312', '平利县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2616', '312', '镇坪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2617', '312', '旬阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2618', '312', '白河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2619', '313', '陈仓区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2620', '313', '渭滨区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2621', '313', '金台区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2622', '313', '凤翔县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2623', '313', '岐山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2624', '313', '扶风县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2625', '313', '眉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2626', '313', '陇县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2627', '313', '千阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2628', '313', '麟游县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2629', '313', '凤县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2630', '313', '太白县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2631', '314', '汉台区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2632', '314', '南郑县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2633', '314', '城固县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2634', '314', '洋县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2635', '314', '西乡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2636', '314', '勉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2637', '314', '宁强县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2638', '314', '略阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2639', '314', '镇巴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2640', '314', '留坝县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2641', '314', '佛坪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2642', '315', '商州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2643', '315', '洛南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2644', '315', '丹凤县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2645', '315', '商南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2646', '315', '山阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2647', '315', '镇安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2648', '315', '柞水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2649', '316', '耀州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2650', '316', '王益区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2651', '316', '印台区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2652', '316', '宜君县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2653', '317', '临渭区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2654', '317', '韩城市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2655', '317', '华阴市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2656', '317', '华县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2657', '317', '潼关县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2658', '317', '大荔县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2659', '317', '合阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2660', '317', '澄城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2661', '317', '蒲城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2662', '317', '白水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2663', '317', '富平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2664', '318', '秦都区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2665', '318', '渭城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2666', '318', '杨陵区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2667', '318', '兴平市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2668', '318', '三原县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2669', '318', '泾阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2670', '318', '乾县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2671', '318', '礼泉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2672', '318', '永寿县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2673', '318', '彬县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2674', '318', '长武县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2675', '318', '旬邑县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2676', '318', '淳化县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2677', '318', '武功县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2678', '319', '吴起县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2679', '319', '宝塔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2680', '319', '延长县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2681', '319', '延川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2682', '319', '子长县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2683', '319', '安塞县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2684', '319', '志丹县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2685', '319', '甘泉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2686', '319', '富县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2687', '319', '洛川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2688', '319', '宜川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2689', '319', '黄龙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2690', '319', '黄陵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2691', '320', '榆阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2692', '320', '神木县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2693', '320', '府谷县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2694', '320', '横山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2695', '320', '靖边县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2696', '320', '定边县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2697', '320', '绥德县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2698', '320', '米脂县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2699', '320', '佳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2700', '320', '吴堡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2701', '320', '清涧县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2702', '320', '子洲县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2703', '321', '长宁区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2704', '321', '闸北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2705', '321', '闵行区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2706', '321', '徐汇区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2707', '321', '浦东新区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2708', '321', '杨浦区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2709', '321', '普陀区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2710', '321', '静安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2711', '321', '卢湾区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2712', '321', '虹口区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2713', '321', '黄浦区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2714', '321', '南汇区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2715', '321', '松江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2716', '321', '嘉定区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2717', '321', '宝山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2718', '321', '青浦区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2719', '321', '金山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2720', '321', '奉贤区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2721', '321', '崇明县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2722', '322', '青羊区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2723', '322', '锦江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2724', '322', '金牛区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2725', '322', '武侯区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2726', '322', '成华区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2727', '322', '龙泉驿区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2728', '322', '青白江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2729', '322', '新都区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2730', '322', '温江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2731', '322', '高新区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2732', '322', '高新西区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2733', '322', '都江堰市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2734', '322', '彭州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2735', '322', '邛崃市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2736', '322', '崇州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2737', '322', '金堂县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2738', '322', '双流县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2739', '322', '郫县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2740', '322', '大邑县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2741', '322', '蒲江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2742', '322', '新津县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2743', '322', '都江堰市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2744', '322', '彭州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2745', '322', '邛崃市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2746', '322', '崇州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2747', '322', '金堂县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2748', '322', '双流县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2749', '322', '郫县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2750', '322', '大邑县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2751', '322', '蒲江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2752', '322', '新津县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2753', '323', '涪城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2754', '323', '游仙区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2755', '323', '江油市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2756', '323', '盐亭县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2757', '323', '三台县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2758', '323', '平武县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2759', '323', '安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2760', '323', '梓潼县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2761', '323', '北川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2762', '324', '马尔康县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2763', '324', '汶川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2764', '324', '理县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2765', '324', '茂县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2766', '324', '松潘县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2767', '324', '九寨沟县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2768', '324', '金川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2769', '324', '小金县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2770', '324', '黑水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2771', '324', '壤塘县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2772', '324', '阿坝县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2773', '324', '若尔盖县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2774', '324', '红原县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2775', '325', '巴州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2776', '325', '通江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2777', '325', '南江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2778', '325', '平昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2779', '326', '通川区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2780', '326', '万源市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2781', '326', '达县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2782', '326', '宣汉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2783', '326', '开江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2784', '326', '大竹县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2785', '326', '渠县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2786', '327', '旌阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2787', '327', '广汉市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2788', '327', '什邡市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2789', '327', '绵竹市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2790', '327', '罗江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2791', '327', '中江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2792', '328', '康定县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2793', '328', '丹巴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2794', '328', '泸定县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2795', '328', '炉霍县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2796', '328', '九龙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2797', '328', '甘孜县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2798', '328', '雅江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2799', '328', '新龙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2800', '328', '道孚县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2801', '328', '白玉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2802', '328', '理塘县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2803', '328', '德格县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2804', '328', '乡城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2805', '328', '石渠县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2806', '328', '稻城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2807', '328', '色达县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2808', '328', '巴塘县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2809', '328', '得荣县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2810', '329', '广安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2811', '329', '华蓥市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2812', '329', '岳池县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2813', '329', '武胜县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2814', '329', '邻水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2815', '330', '利州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2816', '330', '元坝区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2817', '330', '朝天区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2818', '330', '旺苍县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2819', '330', '青川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2820', '330', '剑阁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2821', '330', '苍溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2822', '331', '峨眉山市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2823', '331', '乐山市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2824', '331', '犍为县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2825', '331', '井研县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2826', '331', '夹江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2827', '331', '沐川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2828', '331', '峨边', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2829', '331', '马边', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2830', '332', '西昌市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2831', '332', '盐源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2832', '332', '德昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2833', '332', '会理县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2834', '332', '会东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2835', '332', '宁南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2836', '332', '普格县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2837', '332', '布拖县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2838', '332', '金阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2839', '332', '昭觉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2840', '332', '喜德县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2841', '332', '冕宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2842', '332', '越西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2843', '332', '甘洛县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2844', '332', '美姑县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2845', '332', '雷波县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2846', '332', '木里', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2847', '333', '东坡区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2848', '333', '仁寿县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2849', '333', '彭山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2850', '333', '洪雅县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2851', '333', '丹棱县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2852', '333', '青神县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2853', '334', '阆中市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2854', '334', '南部县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2855', '334', '营山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2856', '334', '蓬安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2857', '334', '仪陇县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2858', '334', '顺庆区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2859', '334', '高坪区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2860', '334', '嘉陵区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2861', '334', '西充县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2862', '335', '市中区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2863', '335', '东兴区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2864', '335', '威远县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2865', '335', '资中县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2866', '335', '隆昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2867', '336', '东  区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2868', '336', '西  区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2869', '336', '仁和区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2870', '336', '米易县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2871', '336', '盐边县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2872', '337', '船山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2873', '337', '安居区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2874', '337', '蓬溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2875', '337', '射洪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2876', '337', '大英县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2877', '338', '雨城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2878', '338', '名山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2879', '338', '荥经县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2880', '338', '汉源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2881', '338', '石棉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2882', '338', '天全县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2883', '338', '芦山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2884', '338', '宝兴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2885', '339', '翠屏区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2886', '339', '宜宾县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2887', '339', '南溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2888', '339', '江安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2889', '339', '长宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2890', '339', '高县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2891', '339', '珙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2892', '339', '筠连县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2893', '339', '兴文县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2894', '339', '屏山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2895', '340', '雁江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2896', '340', '简阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2897', '340', '安岳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2898', '340', '乐至县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2899', '341', '大安区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2900', '341', '自流井区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2901', '341', '贡井区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2902', '341', '沿滩区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2903', '341', '荣县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2904', '341', '富顺县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2905', '342', '江阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2906', '342', '纳溪区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2907', '342', '龙马潭区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2908', '342', '泸县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2909', '342', '合江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2910', '342', '叙永县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2911', '342', '古蔺县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2912', '343', '和平区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2913', '343', '河西区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2914', '343', '南开区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2915', '343', '河北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2916', '343', '河东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2917', '343', '红桥区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2918', '343', '东丽区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2919', '343', '津南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2920', '343', '西青区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2921', '343', '北辰区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2922', '343', '塘沽区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2923', '343', '汉沽区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2924', '343', '大港区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2925', '343', '武清区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2926', '343', '宝坻区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2927', '343', '经济开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2928', '343', '宁河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2929', '343', '静海县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2930', '343', '蓟县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2931', '344', '城关区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2932', '344', '林周县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2933', '344', '当雄县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2934', '344', '尼木县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2935', '344', '曲水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2936', '344', '堆龙德庆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2937', '344', '达孜县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2938', '344', '墨竹工卡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2939', '345', '噶尔县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2940', '345', '普兰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2941', '345', '札达县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2942', '345', '日土县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2943', '345', '革吉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2944', '345', '改则县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2945', '345', '措勤县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2946', '346', '昌都县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2947', '346', '江达县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2948', '346', '贡觉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2949', '346', '类乌齐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2950', '346', '丁青县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2951', '346', '察雅县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2952', '346', '八宿县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2953', '346', '左贡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2954', '346', '芒康县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2955', '346', '洛隆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2956', '346', '边坝县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2957', '347', '林芝县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2958', '347', '工布江达县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2959', '347', '米林县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2960', '347', '墨脱县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2961', '347', '波密县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2962', '347', '察隅县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2963', '347', '朗县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2964', '348', '那曲县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2965', '348', '嘉黎县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2966', '348', '比如县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2967', '348', '聂荣县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2968', '348', '安多县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2969', '348', '申扎县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2970', '348', '索县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2971', '348', '班戈县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2972', '348', '巴青县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2973', '348', '尼玛县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2974', '349', '日喀则市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2975', '349', '南木林县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2976', '349', '江孜县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2977', '349', '定日县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2978', '349', '萨迦县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2979', '349', '拉孜县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2980', '349', '昂仁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2981', '349', '谢通门县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2982', '349', '白朗县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2983', '349', '仁布县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2984', '349', '康马县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2985', '349', '定结县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2986', '349', '仲巴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2987', '349', '亚东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2988', '349', '吉隆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2989', '349', '聂拉木县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2990', '349', '萨嘎县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2991', '349', '岗巴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2992', '350', '乃东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2993', '350', '扎囊县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2994', '350', '贡嘎县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2995', '350', '桑日县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2996', '350', '琼结县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2997', '350', '曲松县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2998', '350', '措美县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('2999', '350', '洛扎县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3000', '350', '加查县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3001', '350', '隆子县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3002', '350', '错那县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3003', '350', '浪卡子县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3004', '351', '天山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3005', '351', '沙依巴克区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3006', '351', '新市区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3007', '351', '水磨沟区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3008', '351', '头屯河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3009', '351', '达坂城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3010', '351', '米东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3011', '351', '乌鲁木齐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3012', '352', '阿克苏市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3013', '352', '温宿县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3014', '352', '库车县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3015', '352', '沙雅县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3016', '352', '新和县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3017', '352', '拜城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3018', '352', '乌什县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3019', '352', '阿瓦提县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3020', '352', '柯坪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3021', '353', '阿拉尔市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3022', '354', '库尔勒市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3023', '354', '轮台县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3024', '354', '尉犁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3025', '354', '若羌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3026', '354', '且末县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3027', '354', '焉耆', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3028', '354', '和静县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3029', '354', '和硕县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3030', '354', '博湖县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3031', '355', '博乐市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3032', '355', '精河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3033', '355', '温泉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3034', '356', '呼图壁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3035', '356', '米泉市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3036', '356', '昌吉市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3037', '356', '阜康市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3038', '356', '玛纳斯县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3039', '356', '奇台县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3040', '356', '吉木萨尔县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3041', '356', '木垒', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3042', '357', '哈密市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3043', '357', '伊吾县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3044', '357', '巴里坤', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3045', '358', '和田市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3046', '358', '和田县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3047', '358', '墨玉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3048', '358', '皮山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3049', '358', '洛浦县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3050', '358', '策勒县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3051', '358', '于田县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3052', '358', '民丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3053', '359', '喀什市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3054', '359', '疏附县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3055', '359', '疏勒县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3056', '359', '英吉沙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3057', '359', '泽普县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3058', '359', '莎车县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3059', '359', '叶城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3060', '359', '麦盖提县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3061', '359', '岳普湖县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3062', '359', '伽师县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3063', '359', '巴楚县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3064', '359', '塔什库尔干', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3065', '360', '克拉玛依市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3066', '361', '阿图什市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3067', '361', '阿克陶县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3068', '361', '阿合奇县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3069', '361', '乌恰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3070', '362', '石河子市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3071', '363', '图木舒克市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3072', '364', '吐鲁番市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3073', '364', '鄯善县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3074', '364', '托克逊县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3075', '365', '五家渠市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3076', '366', '阿勒泰市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3077', '366', '布克赛尔', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3078', '366', '伊宁市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3079', '366', '布尔津县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3080', '366', '奎屯市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3081', '366', '乌苏市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3082', '366', '额敏县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3083', '366', '富蕴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3084', '366', '伊宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3085', '366', '福海县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3086', '366', '霍城县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3087', '366', '沙湾县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3088', '366', '巩留县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3089', '366', '哈巴河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3090', '366', '托里县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3091', '366', '青河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3092', '366', '新源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3093', '366', '裕民县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3094', '366', '和布克赛尔', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3095', '366', '吉木乃县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3096', '366', '昭苏县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3097', '366', '特克斯县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3098', '366', '尼勒克县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3099', '366', '察布查尔', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3100', '367', '盘龙区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3101', '367', '五华区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3102', '367', '官渡区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3103', '367', '西山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3104', '367', '东川区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3105', '367', '安宁市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3106', '367', '呈贡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3107', '367', '晋宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3108', '367', '富民县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3109', '367', '宜良县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3110', '367', '嵩明县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3111', '367', '石林县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3112', '367', '禄劝', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3113', '367', '寻甸', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3114', '368', '兰坪', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3115', '368', '泸水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3116', '368', '福贡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3117', '368', '贡山', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3118', '369', '宁洱', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3119', '369', '思茅区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3120', '369', '墨江', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3121', '369', '景东', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3122', '369', '景谷', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3123', '369', '镇沅', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3124', '369', '江城', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3125', '369', '孟连', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3126', '369', '澜沧', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3127', '369', '西盟', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3128', '370', '古城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3129', '370', '宁蒗', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3130', '370', '玉龙', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3131', '370', '永胜县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3132', '370', '华坪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3133', '371', '隆阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3134', '371', '施甸县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3135', '371', '腾冲县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3136', '371', '龙陵县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3137', '371', '昌宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3138', '372', '楚雄市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3139', '372', '双柏县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3140', '372', '牟定县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3141', '372', '南华县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3142', '372', '姚安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3143', '372', '大姚县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3144', '372', '永仁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3145', '372', '元谋县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3146', '372', '武定县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3147', '372', '禄丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3148', '373', '大理市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3149', '373', '祥云县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3150', '373', '宾川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3151', '373', '弥渡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3152', '373', '永平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3153', '373', '云龙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3154', '373', '洱源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3155', '373', '剑川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3156', '373', '鹤庆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3157', '373', '漾濞', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3158', '373', '南涧', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3159', '373', '巍山', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3160', '374', '潞西市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3161', '374', '瑞丽市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3162', '374', '梁河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3163', '374', '盈江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3164', '374', '陇川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3165', '375', '香格里拉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3166', '375', '德钦县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3167', '375', '维西', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3168', '376', '泸西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3169', '376', '蒙自县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3170', '376', '个旧市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3171', '376', '开远市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3172', '376', '绿春县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3173', '376', '建水县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3174', '376', '石屏县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3175', '376', '弥勒县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3176', '376', '元阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3177', '376', '红河县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3178', '376', '金平', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3179', '376', '河口', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3180', '376', '屏边', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3181', '377', '临翔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3182', '377', '凤庆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3183', '377', '云县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3184', '377', '永德县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3185', '377', '镇康县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3186', '377', '双江', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3187', '377', '耿马', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3188', '377', '沧源', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3189', '378', '麒麟区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3190', '378', '宣威市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3191', '378', '马龙县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3192', '378', '陆良县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3193', '378', '师宗县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3194', '378', '罗平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3195', '378', '富源县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3196', '378', '会泽县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3197', '378', '沾益县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3198', '379', '文山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3199', '379', '砚山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3200', '379', '西畴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3201', '379', '麻栗坡县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3202', '379', '马关县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3203', '379', '丘北县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3204', '379', '广南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3205', '379', '富宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3206', '380', '景洪市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3207', '380', '勐海县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3208', '380', '勐腊县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3209', '381', '红塔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3210', '381', '江川县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3211', '381', '澄江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3212', '381', '通海县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3213', '381', '华宁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3214', '381', '易门县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3215', '381', '峨山', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3216', '381', '新平', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3217', '381', '元江', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3218', '382', '昭阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3219', '382', '鲁甸县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3220', '382', '巧家县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3221', '382', '盐津县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3222', '382', '大关县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3223', '382', '永善县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3224', '382', '绥江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3225', '382', '镇雄县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3226', '382', '彝良县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3227', '382', '威信县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3228', '382', '水富县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3229', '383', '西湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3230', '383', '上城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3231', '383', '下城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3232', '383', '拱墅区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3233', '383', '滨江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3234', '383', '江干区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3235', '383', '萧山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3236', '383', '余杭区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3237', '383', '市郊', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3238', '383', '建德市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3239', '383', '富阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3240', '383', '临安市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3241', '383', '桐庐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3242', '383', '淳安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3243', '384', '吴兴区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3244', '384', '南浔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3245', '384', '德清县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3246', '384', '长兴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3247', '384', '安吉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3248', '385', '南湖区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3249', '385', '秀洲区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3250', '385', '海宁市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3251', '385', '嘉善县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3252', '385', '平湖市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3253', '385', '桐乡市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3254', '385', '海盐县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3255', '386', '婺城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3256', '386', '金东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3257', '386', '兰溪市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3258', '386', '市区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3259', '386', '佛堂镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3260', '386', '上溪镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3261', '386', '义亭镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3262', '386', '大陈镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3263', '386', '苏溪镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3264', '386', '赤岸镇', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3265', '386', '东阳市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3266', '386', '永康市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3267', '386', '武义县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3268', '386', '浦江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3269', '386', '磐安县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3270', '387', '莲都区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3271', '387', '龙泉市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3272', '387', '青田县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3273', '387', '缙云县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3274', '387', '遂昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3275', '387', '松阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3276', '387', '云和县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3277', '387', '庆元县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3278', '387', '景宁', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3279', '388', '海曙区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3280', '388', '江东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3281', '388', '江北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3282', '388', '镇海区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3283', '388', '北仑区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3284', '388', '鄞州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3285', '388', '余姚市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3286', '388', '慈溪市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3287', '388', '奉化市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3288', '388', '象山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3289', '388', '宁海县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3290', '389', '越城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3291', '389', '上虞市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3292', '389', '嵊州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3293', '389', '绍兴县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3294', '389', '新昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3295', '389', '诸暨市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3296', '390', '椒江区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3297', '390', '黄岩区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3298', '390', '路桥区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3299', '390', '温岭市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3300', '390', '临海市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3301', '390', '玉环县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3302', '390', '三门县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3303', '390', '天台县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3304', '390', '仙居县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3305', '391', '鹿城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3306', '391', '龙湾区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3307', '391', '瓯海区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3308', '391', '瑞安市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3309', '391', '乐清市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3310', '391', '洞头县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3311', '391', '永嘉县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3312', '391', '平阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3313', '391', '苍南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3314', '391', '文成县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3315', '391', '泰顺县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3316', '392', '定海区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3317', '392', '普陀区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3318', '392', '岱山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3319', '392', '嵊泗县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3320', '393', '衢州市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3321', '393', '江山市', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3322', '393', '常山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3323', '393', '开化县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3324', '393', '龙游县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3325', '394', '合川区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3326', '394', '江津区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3327', '394', '南川区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3328', '394', '永川区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3329', '394', '南岸区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3330', '394', '渝北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3331', '394', '万盛区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3332', '394', '大渡口区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3333', '394', '万州区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3334', '394', '北碚区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3335', '394', '沙坪坝区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3336', '394', '巴南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3337', '394', '涪陵区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3338', '394', '江北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3339', '394', '九龙坡区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3340', '394', '渝中区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3341', '394', '黔江开发区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3342', '394', '长寿区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3343', '394', '双桥区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3344', '394', '綦江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3345', '394', '潼南县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3346', '394', '铜梁县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3347', '394', '大足县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3348', '394', '荣昌县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3349', '394', '璧山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3350', '394', '垫江县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3351', '394', '武隆县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3352', '394', '丰都县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3353', '394', '城口县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3354', '394', '梁平县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3355', '394', '开县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3356', '394', '巫溪县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3357', '394', '巫山县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3358', '394', '奉节县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3359', '394', '云阳县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3360', '394', '忠县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3361', '394', '石柱', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3362', '394', '彭水', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3363', '394', '酉阳', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3364', '394', '秀山', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3365', '395', '沙田区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3366', '395', '东区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3367', '395', '观塘区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3368', '395', '黄大仙区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3369', '395', '九龙城区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3370', '395', '屯门区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3371', '395', '葵青区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3372', '395', '元朗区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3373', '395', '深水埗区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3374', '395', '西贡区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3375', '395', '大埔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3376', '395', '湾仔区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3377', '395', '油尖旺区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3378', '395', '北区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3379', '395', '南区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3380', '395', '荃湾区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3381', '395', '中西区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3382', '395', '离岛区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3383', '396', '澳门', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3384', '397', '台北', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3385', '397', '高雄', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3386', '397', '基隆', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3387', '397', '台中', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3388', '397', '台南', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3389', '397', '新竹', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3390', '397', '嘉义', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3391', '397', '宜兰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3392', '397', '桃园县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3393', '397', '苗栗县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3394', '397', '彰化县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3395', '397', '南投县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3396', '397', '云林县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3397', '397', '屏东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3398', '397', '台东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3399', '397', '花莲县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3400', '397', '澎湖县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3401', '3', '合肥', '2', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3402', '3401', '庐阳区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3403', '3401', '瑶海区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3404', '3401', '蜀山区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3405', '3401', '包河区', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3406', '3401', '长丰县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3407', '3401', '肥东县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3408', '3401', '肥西县', '3', null, null, '0', null);
INSERT INTO `live_commdata_region` VALUES ('3409', '1', '海外', '1', null, '1387243968', '0', '1');
INSERT INTO `live_commdata_region` VALUES ('3411', '3409', '意大利', '2', null, '1387247214', '0', '1');

-- ----------------------------
-- Table structure for `live_handan`
-- ----------------------------
DROP TABLE IF EXISTS `live_handan`;
CREATE TABLE `live_handan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `opentime` datetime DEFAULT NULL,
  `handan_type` varchar(10) DEFAULT NULL,
  `position` int(11) DEFAULT NULL COMMENT '仓位百分比',
  `handan_product` varchar(30) DEFAULT NULL,
  `openprice` int(11) DEFAULT NULL COMMENT '开仓价',
  `stopprice` int(11) DEFAULT NULL COMMENT '止损价',
  `stopsurplus` int(11) DEFAULT NULL COMMENT '止盈价',
  `closeprice` int(11) DEFAULT NULL COMMENT '平仓价',
  `closetime` datetime DEFAULT NULL COMMENT '平仓时间',
  `earnpoint` int(11) DEFAULT NULL COMMENT '赚取点数',
  `bak` varchar(500) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  `mtime` int(11) DEFAULT NULL,
  `masterid` int(11) DEFAULT NULL COMMENT '直播主题ID',
  PRIMARY KEY (`id`),
  KEY `masterid` (`masterid`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_handan
-- ----------------------------
INSERT INTO `live_handan` VALUES ('13', '2014-05-28 08:18:50', '到价买入', '0', '华银15KG', '0', '0', '0', '0', '2014-05-28 08:18:50', '0', '', '分析师', '1401265138', null, '29');
INSERT INTO `live_handan` VALUES ('20', '2014-05-28 08:18:50', '到价买入', '0', '华银15KG', '0', '0', '0', '0', '2014-05-28 08:18:50', '0', '', '分析师', '1401265138', null, '29');
INSERT INTO `live_handan` VALUES ('24', '2014-05-28 08:18:50', '到价买入', '0', '华银15KG', '0', '0', '0', '0', '2014-05-28 08:18:50', '0', '', '分析师', '1401265138', null, '29');
INSERT INTO `live_handan` VALUES ('32', '2014-05-28 08:18:50', '到价买入', '0', '华银15KG', '0', '0', '0', '0', '2014-05-28 08:18:50', '0', '', '分析师', '1401265138', null, '29');
INSERT INTO `live_handan` VALUES ('36', '2014-05-28 08:18:50', '到价买入', '0', '华银15KG', '0', '0', '0', '0', '2014-05-28 08:18:50', '0', '', '分析师', '1401265138', null, '29');
INSERT INTO `live_handan` VALUES ('40', '2014-05-28 08:18:50', '到价买入', '0', '华银15KG', '0', '0', '0', '0', '2014-05-28 08:18:50', '0', '', '分析师', '1401265138', null, '29');
INSERT INTO `live_handan` VALUES ('44', '2014-05-28 08:18:50', '到价买入', '0', '华银15KG', '0', '0', '0', '0', '2014-05-28 08:18:50', '0', '', '分析师', '1401265138', null, '29');

-- ----------------------------
-- Table structure for `live_home_set`
-- ----------------------------
DROP TABLE IF EXISTS `live_home_set`;
CREATE TABLE `live_home_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL,
  `c-title` varchar(120) NOT NULL,
  `desc` varchar(500) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  `imgthumb` varchar(100) DEFAULT NULL,
  `sort` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL,
  `cateid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_home_set
-- ----------------------------
INSERT INTO `live_home_set` VALUES ('80', 'TTTTTTTT', 'tttttttt', '', '<div class=\"j-i-con\">\n	<div class=\"j-i-hot\">\n		<img src=\"./upload/pages/20130228/227212e7737a9aa14b07fa6a9bf41e76.png\" alt=\"\" /> \n		<div>\n			<h2>\n				森德金融研究所\n			</h2>\n			<p>\n				Sendo Financial Research Institute\n			</p>\n		</div>\n	</div>\n	<ul class=\"j-i-slogan\">\n		<li>\n			<strong>定位：</strong>中国最卓越的贵金属投资研究所\n		</li>\n		<li>\n			<strong>理念：</strong>广而严整谓之森，从道而行谓之德\n		</li>\n		<li>\n			<strong>使命：</strong>以3A为核心，打造A friend，A key，A world\n		</li>\n	</ul>\n	<ul class=\"j-i-sende\">\n		<li>\n			A friend —— 森德是您投资路上的良师益友。\n		</li>\n		<li>\n			A key —— 森德是您开启财富之门的金钥匙。\n		</li>\n		<li>\n			A world —— 森德与您共创贵金属投资大世界。\n		</li>\n	</ul>\n</div>', 'ddddddddddddd', '1362044400', '1370437706', 'upload/pages/20130228/00d831e441cc6d8c458d8eda62ff07f7.jpg', '0', '1', '64');
INSERT INTO `live_home_set` VALUES ('81', '人物志', '本期明星', '', '<div class=\"j-p-con\">\n	<div class=\"j-p-img\">\n		<img alt=\"\" src=\"./upload/pages/20130228/cbc216a6d1f212e2969586ef2eb21923.jpg\" /> \n		<p>\n			陈明燕 <span id=\"__kindeditor_bookmark_end_3__\"></span> \n		</p>\n	</div>\n	<div class=\"j-p-info\">\n		上海交通大学MBA <br />\n具有多年金融市场实战经验<br />\n曾任职香港知名金融机构，负责宏观研究及资金管理工作<br />\n现任：森德金融研究所 主任研究员<br />\n<br />\n《银天下日刊》主编<br />\n《银天下特刊》主编<br />\n《银天下周刊》宏观栏目主编<br />\n独家研创《波段制胜秘笈》、在变化莫测的贵金属市场，获得持续、稳定的盈利！<br />\n	</div>\n</div>', '34343434343', '1362045241', '1370437727', '', '0', '1', '64');
INSERT INTO `live_home_set` VALUES ('82', '谈股论金', '白银带给我的，是另一种人生', '', '<ul class=\"m-j-list\">\n	<li>\n		<a href=\"http://www.baidao.com/adimages/ad/20121025/index.html\" target=\"_bank\"><img src=\"./upload/pages/20130228/d9618b8f63ec7f3badfda31599b14d17.jpg\" alt=\"\" /> </a> \n		<p>\n			<a href=\"http://www.baidao.com/adimages/ad/20121025/index.html\" target=\"_bank\">9月直播培训活动颁奖典礼</a> \n		</p>\n	</li>\n	<li>\n		<a href=\"http://www.baidao.com/adimages/ad/20120918/index.html\" target=\"_bank\"><img src=\"./upload/pages/20130228/11980aee8ca049eaf206e2c2d6d6dbeb.jpg\" alt=\"\" /> </a> \n		<p>\n			<a href=\"http://www.baidao.com/adimages/ad/20120918/index.html\" target=\"_bank\">QE3白银之夜精彩回顾</a> \n		</p>\n	</li>\n	<li>\n		<a href=\"http://www.baidao.com/adimages/ad/2012124/index.html\" target=\"_bank\"><img src=\"./upload/pages/20130228/8e5b67e1287d7096f17842977b8fcab7.jpg\" alt=\"\" /> </a> \n		<p>\n			<a href=\"http://www.baidao.com/adimages/ad/2012124/index.html\" target=\"_bank\">拜师军团突破千人大关</a> \n		</p>\n	</li>\n	<li>\n		<a href=\"http://www.baidao.com/adimages/ad/20121024/index.html\" target=\"_bank\"><img src=\"./upload/pages/20130228/699a4b77e0d17c301bf3d55105cee91e.jpg\" alt=\"\" /> </a> \n		<p>\n			<a href=\"http://www.baidao.com/adimages/ad/20121024/index.html\" target=\"_bank\">银天下iPhone版伴您随行</a> \n		</p>\n	</li>\n	<li>\n		<a href=\"http://www.baidao.com/ad/v/doc/ad/20121107/index.html\" target=\"_bank\"><img src=\"./upload/pages/20130228/435116835dba58c4bed202db306bf1ee.jpg\" alt=\"\" /> </a> \n		<p>\n			<a href=\"http://www.baidao.com/ad/v/doc/ad/20121107/index.html\" target=\"_bank\">融金汇银车队勇夺前三</a> \n		</p>\n	</li>\n	<li>\n		<a href=\"http://www.tiantong99.com/templets/tiantong/ym/201212312/index.html\" target=\"_bank\"><img src=\"./upload/pages/20130228/4b64e5c9c9141ae5adde8f6524a0ea9b.jpg\" alt=\"\" /> </a> \n		<p>\n			<a href=\"http://www.tiantong99.com/templets/tiantong/ym/201212312/index.html\" target=\"_bank\">森德爱心传递首发站</a> \n		</p>\n	</li>\n</ul>', 'fdfsfssfsf', '1362045653', '1370437864', '', '0', '1', '64');
INSERT INTO `live_home_set` VALUES ('83', '进步墙', 'fdfdfdfdfd', '', '<ul class=\"p-w-list\">\n	<li>\n		<img src=\"./upload/pages/20130302/3e1d4857fc42e05aefd0b47d6a6c47db.png\" alt=\"\" /> \n		<div class=\"p-w-l-info\">\n			<h2>\n				银天下3.3正式上线\n			</h2>\n<span class=\"pwl-time\"></span><span class=\"pwl-name\">【商科洁】</span> \n			<p>\n				做设计的可能看起来有点孤独，常常对着电脑不善言谈。闲暇时分不自主地去直播室看银友们互动谈话，很温馨很奋进，促使着我：银天下界面会更友好，因为我们一直在努力！\n			</p>\n		</div>\n	</li>\n	<li>\n		<img src=\"./upload/pages/20130302/e1fe0d51184c089b7621ea4e2d4573ac.png\" alt=\"\" /> \n		<div class=\"p-w-l-info\">\n			<h2>\n				银天下3.3正式上线\n			</h2>\n<span class=\"pwl-time\"></span><span class=\"pwl-name\">【王欢】</span> \n			<p>\n				同事都笑我是老好人，银天下产品技术后台一有啥紧急状态总是我第一个上。嘿嘿，为了广大奋斗在前线的银友们和分析师操盘手们能赚更多的钱，我值了！\n			</p>\n		</div>\n	</li>\n	<li>\n		<img src=\"./upload/pages/20130302/24466c8618eb5898e0868b54e58cbf50.png\" alt=\"\" /> \n		<div class=\"p-w-l-info\">\n			<h2>\n				银天下3.3正式上线\n			</h2>\n<span class=\"pwl-time\"></span><span class=\"pwl-name\">【马如麟】</span> \n			<p>\n				产品部是做什么的，就是一切为了用户，用户体验至上。为此，银天下3.3版相对于之前版本改进了许多，特别是直播大厅使用感觉更顺溜了，快去看看吧……\n			</p>\n		</div>\n	</li>\n</ul>', 'fdfdfdfdfd', '1362052213', '1370437671', '', '0', '1', '64');
INSERT INTO `live_home_set` VALUES ('84', '直播大厅', 'fdfdfd', '', '每日9:00—24:00，分析师在线解盘、喊单，上万名投资者在这里分享忧乐', 'stock', '1362053642', '1362961836', 'upload/pages/20130228/903cac76392b52fd18183f73c2673da9.png', '0', '1', '66');
INSERT INTO `live_home_set` VALUES ('85', '实时行情', 'sfsfs', '', '现货白银、黄金T+D等8大品种实时报价，析需求<img src=\"http://localhost/project/stock/assets/kindeditor/plugins/emoticons/images/0.gif\" alt=\"\" border=\"0\" />', 'dfdfd', '1362054058', '1362961850', 'upload/pages/20130302/77d20cd94e21c325cc06c22c7faca320.png', '0', '1', '66');
INSERT INTO `live_home_set` VALUES ('86', '在线资讯', 'gdgd', '', '您关注的财经数据、贵金属要闻、名家专栏一网打尽，全面知悉，省时省力', 'dgdg', '1362054120', '1362961860', 'upload/pages/20130302/ac0195e8c6da0f765137bb2644a52d5f.png', '0', '1', '66');
INSERT INTO `live_home_set` VALUES ('87', 'AAA内参', 'fsfsfs', '', '专家研究员精彩解读市场每日09:00提供出入场点位，权威报告，深入浅出', 'gdgd', '1362054148', '1362961871', 'upload/pages/20130302/113a8ef3c7911ec8b1a20682bf5d06d4.png', '0', '1', '66');
INSERT INTO `live_home_set` VALUES ('88', 'Vip专区', 'ffsfs', '', '《交易之声》、绿色通道、专家面对面账户分析报告，VIP客户专属服务', 'http://223.26.59.97/project/chatsystem/index.php/help/perpage/70', '1362054175', '1362964081', 'upload/pages/20130302/b0e016b55007a557977c29123c5ed159.png', '0', '1', '66');
INSERT INTO `live_home_set` VALUES ('89', '模拟大赛', 'fdfdfd', '', '大赛英雄排行榜', 'simula', '1362054255', '1362961892', 'upload/pages/20130302/c4104224e41d16eb01ee4384411e36ff.png', '0', '1', '66');
INSERT INTO `live_home_set` VALUES ('90', '谈股论金简介：', '简介简介', '', '国内首款贵金属投资服务平台，由森德金融研究所专业打造。集市场资讯、行情走势、直播互动、操盘建议、交易策略等于一体，为客户提供全方位一站式的全新服务。', 'fdfdfd', '1362054941', '1362961907', 'upload/pages/20130228/1c07e2045a253a4a63d2cdea3a53a87a.png', '0', '1', '67');
INSERT INTO `live_home_set` VALUES ('91', '团队规模：', '团队规模：', '', '57位专业分析师，他们是学术掌门、是实战大师、是媒体明星、是知名财经评论家，但他们在这里，只有一个身份——您投资路上的良师益友。', 'fffff', '1362054984', '1362961918', 'upload/pages/20130228/be8d59253d52e83bb9badf5f53445a43.png', '0', '1', '67');
INSERT INTO `live_home_set` VALUES ('92', '专业素质：', '专业素质：', '', '成为银天下的智囊团，是森德金融研究所最近最值得骄傲的事了。经过层层选拔（历史数据调查、实盘操作高水准考核、专业播主培训等）最终才能在这里微笑着和大家道声“早安，直播开始了”。', 'dddddd', '1362055049', '1362961929', 'upload/pages/20130228/35ccc9af6b50210143383e4e26597aa3.png', '0', '1', '67');
INSERT INTO `live_home_set` VALUES ('93', '自由添加主题', '', '', '', '', '1362450850', '1362453050', '', '0', '0', null);

-- ----------------------------
-- Table structure for `live_jsvote`
-- ----------------------------
DROP TABLE IF EXISTS `live_jsvote`;
CREATE TABLE `live_jsvote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_user` tinyint(3) unsigned NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `ip` int(11) DEFAULT NULL,
  `votedate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_jsvote
-- ----------------------------
INSERT INTO `live_jsvote` VALUES ('1', '83', '83', '2147483647', '2015-05-17');
INSERT INTO `live_jsvote` VALUES ('2', '85', '83', '2147483647', '2015-04-06');
INSERT INTO `live_jsvote` VALUES ('3', '85', '83', '2147483647', '2015-05-17');
INSERT INTO `live_jsvote` VALUES ('4', '85', '83', '2147483647', '2015-05-17');
INSERT INTO `live_jsvote` VALUES ('5', '85', '83', '2147483647', '2015-05-16');
INSERT INTO `live_jsvote` VALUES ('6', '85', '48636970', '2147483647', '2015-05-17');
INSERT INTO `live_jsvote` VALUES ('7', '85', '70107960', '2147483647', '2015-05-17');
INSERT INTO `live_jsvote` VALUES ('8', '85', '70107960', '2147483647', '2015-05-17');
INSERT INTO `live_jsvote` VALUES ('9', '85', '70107960', '2147483647', '2015-05-17');
INSERT INTO `live_jsvote` VALUES ('10', '85', '70107960', '2147483647', '2015-05-17');
INSERT INTO `live_jsvote` VALUES ('11', '85', '70107960', '2147483647', '2015-05-17');
INSERT INTO `live_jsvote` VALUES ('12', '85', '70107960', '2147483647', '2015-05-17');
INSERT INTO `live_jsvote` VALUES ('13', '85', '70107960', '2147483647', '2015-05-17');
INSERT INTO `live_jsvote` VALUES ('14', '85', '70107960', '2147483647', '2015-05-17');
INSERT INTO `live_jsvote` VALUES ('15', '85', '70107960', '2147483647', '2015-05-17');
INSERT INTO `live_jsvote` VALUES ('16', '85', '86', '2147483647', '2015-05-17');
INSERT INTO `live_jsvote` VALUES ('17', '85', '48458840', '2147483647', '2015-05-18');
INSERT INTO `live_jsvote` VALUES ('18', '85', '59172919', '1857282855', '2015-05-19');
INSERT INTO `live_jsvote` VALUES ('19', '85', '59172919', '1857282855', '2015-05-19');
INSERT INTO `live_jsvote` VALUES ('20', '85', '59172919', '1857282855', '2015-05-19');
INSERT INTO `live_jsvote` VALUES ('21', '85', '56527939', '-1212557907', '2015-05-20');
INSERT INTO `live_jsvote` VALUES ('22', '85', '49068947', '1857283162', '2015-05-24');
INSERT INTO `live_jsvote` VALUES ('23', '85', '49068947', '1857283162', '2015-05-24');
INSERT INTO `live_jsvote` VALUES ('24', '85', '49068947', '1857283162', '2015-05-24');
INSERT INTO `live_jsvote` VALUES ('25', '85', '49068947', '1857283162', '2015-05-24');
INSERT INTO `live_jsvote` VALUES ('26', '85', '71798144', '-573738501', '2015-05-25');
INSERT INTO `live_jsvote` VALUES ('27', '85', '5024739', '1857283162', '2015-05-26');
INSERT INTO `live_jsvote` VALUES ('28', '85', '5024739', '1857283162', '2015-05-26');
INSERT INTO `live_jsvote` VALUES ('29', '86', '5024739', '1857283162', '2015-05-26');
INSERT INTO `live_jsvote` VALUES ('30', '85', '29425322', '1857283162', '2015-05-26');
INSERT INTO `live_jsvote` VALUES ('31', '86', '29425322', '1857283162', '2015-05-26');
INSERT INTO `live_jsvote` VALUES ('32', '86', '93812099', '-573750477', '2015-05-26');
INSERT INTO `live_jsvote` VALUES ('33', '85', '93812099', '-573750477', '2015-05-26');
INSERT INTO `live_jsvote` VALUES ('34', '85', '39416234', '1857283162', '2015-05-27');
INSERT INTO `live_jsvote` VALUES ('35', '86', '39416234', '1857283162', '2015-05-27');
INSERT INTO `live_jsvote` VALUES ('36', '86', '69834186', '-1212556442', '2015-05-29');
INSERT INTO `live_jsvote` VALUES ('37', '85', '83829762', '1857148556', '2015-06-01');
INSERT INTO `live_jsvote` VALUES ('38', '86', '83829762', '1857148556', '2015-06-01');
INSERT INTO `live_jsvote` VALUES ('39', '92', '92', '-1212558229', '2015-06-02');
INSERT INTO `live_jsvote` VALUES ('40', '114', '111', '-573738786', '2015-06-03');
INSERT INTO `live_jsvote` VALUES ('41', '114', '28589859', '1857148556', '2015-06-04');
INSERT INTO `live_jsvote` VALUES ('42', '114', '90', '-552722533', '2015-06-05');
INSERT INTO `live_jsvote` VALUES ('43', '114', '97719524', '-573750485', '2015-06-08');
INSERT INTO `live_jsvote` VALUES ('44', '114', '117', '-573750485', '2015-06-09');
INSERT INTO `live_jsvote` VALUES ('45', '114', '121', '-573750485', '2015-06-09');

-- ----------------------------
-- Table structure for `live_livecontent`
-- ----------------------------
DROP TABLE IF EXISTS `live_livecontent`;
CREATE TABLE `live_livecontent` (
  `contentid` int(11) NOT NULL AUTO_INCREMENT,
  `contentcate` int(11) DEFAULT NULL COMMENT '直播内容分类',
  `content` text,
  `author` varchar(30) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `masterid` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '1' COMMENT '1:所有人可见，2：VIP可见；',
  `istop` tinyint(4) DEFAULT '0' COMMENT '1:置顶',
  `ishot` tinyint(4) DEFAULT '0' COMMENT '1:精华',
  `mtime` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM AUTO_INCREMENT=528 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_livecontent
-- ----------------------------

-- ----------------------------
-- Table structure for `live_livecontent_history`
-- ----------------------------
DROP TABLE IF EXISTS `live_livecontent_history`;
CREATE TABLE `live_livecontent_history` (
  `contentid` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `author` varchar(30) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `masterid` int(11) DEFAULT NULL,
  `type` tinyint(4) DEFAULT '1' COMMENT '1:所有人可见，2：VIP可见；',
  `actime` int(11) DEFAULT NULL,
  `hisotrydate` varchar(10) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`contentid`)
) ENGINE=MyISAM AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_livecontent_history
-- ----------------------------
INSERT INTO `live_livecontent_history` VALUES ('166', '<p>\n	haha\n</p>', '亿洋网络', '63', '29', '1', '1402326110', null, '1422875763');
INSERT INTO `live_livecontent_history` VALUES ('167', '<img src=\"http://local.yuyaoit.cn/project/eysystem/ey_goldchat/simple_yy/themes/comm/js/kindeditor/plugins/flower/images/63.gif\" /><img src=\"http://local.yuyaoit.cn/project/eysystem/ey_goldchat/simple_yy/themes/comm/js/kindeditor/plugins/flower/images/63.gif\" /><img src=\"http://local.yuyaoit.cn/project/eysystem/ey_goldchat/simple_yy/themes/comm/js/kindeditor/plugins/flower/images/63.gif\" /><img src=\"http://local.yuyaoit.cn/project/eysystem/ey_goldchat/simple_yy/themes/comm/js/kindeditor/plugins/flower/images/63.gif\" />', '亿洋网络', '63', '29', '1', '1402326920', null, '1422875763');
INSERT INTO `live_livecontent_history` VALUES ('168', '我是播主，我是播主亲亲亲亲亲', '亿洋网络', '63', '29', '1', '1403856709', null, '1422875763');
INSERT INTO `live_livecontent_history` VALUES ('169', '网友互动', '亿洋网络', '63', '29', '1', '1403856732', null, '1422875763');

-- ----------------------------
-- Table structure for `live_livemaster`
-- ----------------------------
DROP TABLE IF EXISTS `live_livemaster`;
CREATE TABLE `live_livemaster` (
  `masterid` int(11) NOT NULL AUTO_INCREMENT,
  `mastertitle` varchar(100) DEFAULT NULL,
  `masterinfo` varchar(1000) DEFAULT NULL,
  `roomid` int(11) DEFAULT NULL,
  `hits` int(11) DEFAULT '0',
  `btime` int(11) DEFAULT NULL,
  `etime` int(11) DEFAULT NULL,
  `author` varchar(50) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '0:未生效；1：已开始；2：结束；-1：被关闭',
  `mtime` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`masterid`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_livemaster
-- ----------------------------
INSERT INTO `live_livemaster` VALUES ('29', '亿洋网络直播', '直播主题简介', '26', '0', null, '1403856732', 'ey_test', '63', null, '2', null, '1396505255');

-- ----------------------------
-- Table structure for `live_liveroom`
-- ----------------------------
DROP TABLE IF EXISTS `live_liveroom`;
CREATE TABLE `live_liveroom` (
  `roomid` int(11) NOT NULL AUTO_INCREMENT,
  `roomname` varchar(100) DEFAULT NULL,
  `cateid` int(11) DEFAULT NULL,
  `roominfo` varchar(2000) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `userinfo` varchar(1000) DEFAULT NULL,
  `imgthumb` varchar(100) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0',
  `mtime` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  `btime` tinyint(4) DEFAULT NULL,
  `etime` tinyint(4) DEFAULT NULL,
  `reason` varchar(1000) DEFAULT NULL,
  `linkphone` varchar(30) DEFAULT NULL,
  `linkqq` varchar(20) DEFAULT NULL,
  `linkman` varchar(30) DEFAULT NULL,
  `roompass` varchar(32) DEFAULT NULL,
  `hits` int(11) DEFAULT '0',
  PRIMARY KEY (`roomid`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_liveroom
-- ----------------------------
INSERT INTO `live_liveroom` VALUES ('26', '泰世通直播系统', '29', '粤贵银是经广东省政府同意，由广东省经济和信息化委员会批复成立，经广东省黄金协会以及省地方国企组建，在国务院、央行等五部委联合颁布的关于中国金融创新文件指示精神之下，特别是国务院在中国经济特区中设立的前台经济特区指示精神之下，广东省政府对贵金属市场进行合理合规性管理基础上设立广东省贵金属交易中心所设立的第一个贵金属现货交易产品。', '63', '申请人简介', '', '0', '1', '1433240378', '1396505196', '9', '17', '申请理由', '15959595959', '', 'ey_test', '123456', '6148');

-- ----------------------------
-- Table structure for `live_login_log`
-- ----------------------------
DROP TABLE IF EXISTS `live_login_log`;
CREATE TABLE `live_login_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `username` varchar(30) DEFAULT NULL,
  `region` varchar(50) DEFAULT NULL,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `cdate` varchar(15) DEFAULT NULL,
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`logid`),
  KEY `log_time` (`ctime`) USING BTREE,
  KEY `user_id` (`userid`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1582 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_login_log
-- ----------------------------
INSERT INTO `live_login_log` VALUES ('1483', '63', '111111', '本机地址  ', '127.0.0.1', '2014-07-25', '1406273073');
INSERT INTO `live_login_log` VALUES ('1484', '74', '222222', '本机地址  ', '127.0.0.1', '2014-07-25', '1406273383');
INSERT INTO `live_login_log` VALUES ('1485', '80', '666666', '本机地址  ', '127.0.0.1', '2014-07-25', '1406257363');
INSERT INTO `live_login_log` VALUES ('1486', '82', 'test3', '本机地址  ', '127.0.0.1', '2014-07-25', '1406272158');
INSERT INTO `live_login_log` VALUES ('1487', '63', '111111', '本机地址  ', '127.0.0.1', '2014-07-28', '1406540530');
INSERT INTO `live_login_log` VALUES ('1488', '63', '111111', '本机地址  ', '127.0.0.1', '2014-07-31', '1406774545');
INSERT INTO `live_login_log` VALUES ('1489', '83', 'leidi', '湖南省衡阳市 电信', '124.228.17.64', '2015-03-25', '1427277000');
INSERT INTO `live_login_log` VALUES ('1490', '83', 'leidi', '山西省长治市 联通ADSL', '60.220.213.14', '2015-03-30', '1427727763');
INSERT INTO `live_login_log` VALUES ('1491', '83', 'leidi', '湖南省衡阳市 电信', '118.254.185.248', '2015-03-31', '1427782260');
INSERT INTO `live_login_log` VALUES ('1492', '84', '123456', '上海市 电信', '101.81.96.150', '2015-04-02', '1427948420');
INSERT INTO `live_login_log` VALUES ('1493', '83', 'leidi', '湖南省 电信', '223.147.131.96', '2015-04-09', '1428559791');
INSERT INTO `live_login_log` VALUES ('1494', '85', 'xiaoxiao', '局域网 对方和您在同一内部网', '192.168.0.114', '2015-05-12', '1431409388');
INSERT INTO `live_login_log` VALUES ('1495', '83', 'leidi', '局域网 对方和您在同一内部网', '192.168.0.114', '2015-05-13', '1431507935');
INSERT INTO `live_login_log` VALUES ('1496', '83', 'leidi', '局域网 对方和您在同一内部网', '192.168.0.114', '2015-05-14', '1431589044');
INSERT INTO `live_login_log` VALUES ('1497', '85', 'xiaoxiao', '局域网 对方和您在同一内部网', '192.168.0.114', '2015-05-14', '1431592221');
INSERT INTO `live_login_log` VALUES ('1498', '85', 'xiaoxiao', '局域网 对方和您在同一内部网', '192.168.0.114', '2015-05-15', '1431681114');
INSERT INTO `live_login_log` VALUES ('1499', '83', 'leidi', '局域网 对方和您在同一内部网', '192.168.0.114', '2015-05-15', '1431681133');
INSERT INTO `live_login_log` VALUES ('1500', '84', '123456', '局域网 对方和您在同一内部网', '192.168.0.114', '2015-05-15', '1431681185');
INSERT INTO `live_login_log` VALUES ('1501', '83', 'leidi', '局域网 对方和您在同一内部网', '192.168.0.114', '2015-05-17', '1431853697');
INSERT INTO `live_login_log` VALUES ('1502', '85', 'xiaoxiao', '局域网 对方和您在同一内部网', '192.168.0.114', '2015-05-17', '1431832205');
INSERT INTO `live_login_log` VALUES ('1503', '84', '123456', '局域网 对方和您在同一内部网', '192.168.0.114', '2015-05-17', '1431832676');
INSERT INTO `live_login_log` VALUES ('1504', '86', '12345678', '局域网 对方和您在同一内部网', '192.168.0.114', '2015-05-17', '1431868214');
INSERT INTO `live_login_log` VALUES ('1505', '85', 'xiaoxiao', '湖南省衡阳市 电信ADSL', '222.241.181.132', '2015-05-18', '1431943338');
INSERT INTO `live_login_log` VALUES ('1506', '83', 'leidi', '局域网 对方和您在同一内部网', '192.168.0.114', '2015-05-18', '1431911288');
INSERT INTO `live_login_log` VALUES ('1507', '84', '123456', '局域网 对方和您在同一内部网', '192.168.0.114', '2015-05-18', '1431913582');
INSERT INTO `live_login_log` VALUES ('1508', '87', 'haha', '局域网 对方和您在同一内部网', '192.168.0.114', '2015-05-18', '1431918939');
INSERT INTO `live_login_log` VALUES ('1509', '86', '12345678', '山西省大同市 联通', '221.205.67.51', '2015-05-26', '1432612326');
INSERT INTO `live_login_log` VALUES ('1510', '89', '1234567', '山西省太原市 联通', '183.185.212.107', '2015-06-02', '1433214072');
INSERT INTO `live_login_log` VALUES ('1511', '92', '750197119', '山西省太原市 联通', '183.185.212.107', '2015-06-02', '1433214952');
INSERT INTO `live_login_log` VALUES ('1512', '93', 'dongzheng', '山西省太原市 联通', '183.185.212.107', '2015-06-02', '1433215913');
INSERT INTO `live_login_log` VALUES ('1513', '98', 'zhangyong', '山西省太原市 联通', '183.185.212.107', '2015-06-02', '1433216680');
INSERT INTO `live_login_log` VALUES ('1514', '94', '李放放', '山西省太原市 联通', '183.185.212.107', '2015-06-02', '1433217962');
INSERT INTO `live_login_log` VALUES ('1515', '101', '18005625966', '山西省太原市 联通', '183.185.212.107', '2015-06-02', '1433225148');
INSERT INTO `live_login_log` VALUES ('1516', '102', '13911644336', '山西省太原市 联通', '183.185.212.107', '2015-06-02', '1433225741');
INSERT INTO `live_login_log` VALUES ('1517', '106', 'liuruncheng', '山西省太原市 联通', '183.185.212.107', '2015-06-02', '1433229908');
INSERT INTO `live_login_log` VALUES ('1518', '108', 'anjie', '山西省太原市 联通', '183.185.212.107', '2015-06-02', '1433240118');
INSERT INTO `live_login_log` VALUES ('1519', '111', 'gaoxinping', '山西省太原市 联通', '183.185.212.107', '2015-06-02', '1433240810');
INSERT INTO `live_login_log` VALUES ('1520', '104', '18635612238', '山西省太原市小店区 联通ADSL', '221.205.112.222', '2015-06-03', '1433296616');
INSERT INTO `live_login_log` VALUES ('1521', '100', 'weiyun', '山西省太原市小店区 联通ADSL', '221.205.112.222', '2015-06-03', '1433297286');
INSERT INTO `live_login_log` VALUES ('1522', '113', '1129973911', '山西省太原市小店区 联通ADSL', '221.205.112.222', '2015-06-03', '1433298823');
INSERT INTO `live_login_log` VALUES ('1523', '111', 'gaoxinping', '山西省太原市小店区 联通ADSL', '221.205.112.222', '2015-06-03', '1433302143');
INSERT INTO `live_login_log` VALUES ('1524', '105', '13292715555', '山西省太原市小店区 联通ADSL', '221.205.112.222', '2015-06-03', '1433326013');
INSERT INTO `live_login_log` VALUES ('1525', '90', '1234', '山西省 电信', '223.14.31.155', '2015-06-05', '1433495972');
INSERT INTO `live_login_log` VALUES ('1526', '92', '750197119', '山西省太原市 联通', '183.184.37.109', '2015-06-08', '1433755969');
INSERT INTO `live_login_log` VALUES ('1527', '108', 'anjie', '山西省大同市 联通', '221.205.67.43', '2015-06-08', '1433772497');
INSERT INTO `live_login_log` VALUES ('1528', '118', '2892756771', '山西省大同市 联通', '221.205.67.43', '2015-06-09', '1433820258');
INSERT INTO `live_login_log` VALUES ('1529', '122', '489511945', '山西省大同市 联通', '221.205.67.43', '2015-06-09', '1433814670');
INSERT INTO `live_login_log` VALUES ('1530', '120', '574136472', '山西省大同市 联通', '221.205.67.43', '2015-06-09', '1433816389');
INSERT INTO `live_login_log` VALUES ('1531', '113', '1129973911', '山西省大同市 联通', '221.205.67.43', '2015-06-09', '1433816539');
INSERT INTO `live_login_log` VALUES ('1532', '117', '1469591921', '山西省大同市 联通', '221.205.67.43', '2015-06-09', '1433821986');
INSERT INTO `live_login_log` VALUES ('1533', '121', '932424766', '山西省大同市 联通', '221.205.67.43', '2015-06-09', '1433817153');
INSERT INTO `live_login_log` VALUES ('1534', '124', '147427107', '山西省大同市 联通', '221.205.67.43', '2015-06-09', '1433818235');
INSERT INTO `live_login_log` VALUES ('1535', '94', '李放放', '山西省大同市 联通', '221.205.67.43', '2015-06-09', '1433822153');
INSERT INTO `live_login_log` VALUES ('1536', '126', '1901172848', '山西省大同市 联通', '221.205.67.43', '2015-06-09', '1433819471');
INSERT INTO `live_login_log` VALUES ('1537', '114', 'xufujun', '山西省大同市 联通', '221.205.67.43', '2015-06-09', '1433819866');
INSERT INTO `live_login_log` VALUES ('1538', '115', '13292128950', '河北省张家口市 联通', '221.194.244.97', '2015-06-09', '1433822655');
INSERT INTO `live_login_log` VALUES ('1539', '92', '750197119', '山西省大同市 联通', '221.205.67.43', '2015-06-09', '1433820132');
INSERT INTO `live_login_log` VALUES ('1540', '91', '12345', '山西省大同市 联通', '221.205.67.43', '2015-06-09', '1433820784');
INSERT INTO `live_login_log` VALUES ('1541', '102', '13911644336', '山西省大同市 联通', '221.205.67.43', '2015-06-09', '1433821020');
INSERT INTO `live_login_log` VALUES ('1542', '127', 'liuzihan', '山西省太原市 电信', '110.177.45.53', '2015-06-09', '1433856429');
INSERT INTO `live_login_log` VALUES ('1543', '91', '12345', '山西省太原市 联通', '171.117.29.143', '2015-06-10', '1433913703');
INSERT INTO `live_login_log` VALUES ('1544', '92', '750197119', '山西省太原市 联通', '171.117.29.143', '2015-06-10', '1433921366');
INSERT INTO `live_login_log` VALUES ('1545', '103', '13506480668', '山西省太原市 联通', '171.117.29.143', '2015-06-10', '1433901536');
INSERT INTO `live_login_log` VALUES ('1546', '127', 'liuzihan', '湖南省衡阳市 电信', '124.228.193.68', '2015-06-10', '1433907286');
INSERT INTO `live_login_log` VALUES ('1547', '114', 'xufujun', '山西省太原市 联通', '171.117.29.143', '2015-06-10', '1433919584');
INSERT INTO `live_login_log` VALUES ('1548', '128', 'leidi', '湖南省衡阳市 电信ADSL', '218.77.74.51', '2015-06-10', '1433907195');
INSERT INTO `live_login_log` VALUES ('1549', '102', '13911644336', '北京市 电信', '124.127.159.104', '2015-06-10', '1433940410');
INSERT INTO `live_login_log` VALUES ('1550', '113', '1129973911', '山西省太原市 联通', '171.117.29.143', '2015-06-10', '1433921465');
INSERT INTO `live_login_log` VALUES ('1551', '117', '1469591921', '山西省太原市 联通', '171.117.29.143', '2015-06-10', '1433922311');
INSERT INTO `live_login_log` VALUES ('1552', '118', '2892756771', '山西省太原市 联通', '171.117.29.143', '2015-06-10', '1433921519');
INSERT INTO `live_login_log` VALUES ('1553', '120', '574136472', '山西省太原市 联通', '171.117.29.143', '2015-06-10', '1433921555');
INSERT INTO `live_login_log` VALUES ('1554', '126', '1901172848', '山西省太原市 联通', '171.117.29.143', '2015-06-10', '1433921583');
INSERT INTO `live_login_log` VALUES ('1555', '94', '李放放', '山西省太原市 联通', '171.117.29.143', '2015-06-10', '1433922382');
INSERT INTO `live_login_log` VALUES ('1556', '124', '147427107', '山西省太原市 联通', '171.117.29.143', '2015-06-10', '1433921642');
INSERT INTO `live_login_log` VALUES ('1557', '93', 'dongzheng', '广东省深圳市 长城宽带', '115.174.82.78', '2015-06-10', '1433921831');
INSERT INTO `live_login_log` VALUES ('1558', '92', '750197119', '山西省太原市 联通', '171.116.59.200', '2015-06-11', '1434007043');
INSERT INTO `live_login_log` VALUES ('1559', '125', '2818430997', '山西省太原市 联通', '171.116.59.200', '2015-06-11', '1434007277');
INSERT INTO `live_login_log` VALUES ('1560', '124', '147427107', '山西省太原市 联通', '171.116.59.200', '2015-06-11', '1434007326');
INSERT INTO `live_login_log` VALUES ('1561', '97', '李放放2', '山西省太原市 联通', '171.116.59.200', '2015-06-11', '1434007870');
INSERT INTO `live_login_log` VALUES ('1562', '123', '2576383942', '山西省太原市 联通', '171.116.59.200', '2015-06-11', '1434008908');
INSERT INTO `live_login_log` VALUES ('1563', '113', '1129973911', '山西省太原市 联通', '171.116.59.200', '2015-06-11', '1434008160');
INSERT INTO `live_login_log` VALUES ('1564', '118', '2892756771', '山西省太原市 联通', '171.116.59.200', '2015-06-11', '1434010258');
INSERT INTO `live_login_log` VALUES ('1565', '119', '353909204', '山西省太原市 联通', '171.116.59.200', '2015-06-11', '1434008791');
INSERT INTO `live_login_log` VALUES ('1566', '126', '1901172848', '山西省太原市 联通', '171.116.59.200', '2015-06-11', '1434012168');
INSERT INTO `live_login_log` VALUES ('1567', '98', 'zhangyong', '山西省太原市 联通', '171.116.59.200', '2015-06-11', '1434008497');
INSERT INTO `live_login_log` VALUES ('1568', '101', '18005625966', '安徽省铜陵市 电信', '117.57.49.162', '2015-06-11', '1434012332');
INSERT INTO `live_login_log` VALUES ('1569', '93', 'dongzheng', '广东省深圳市 长城宽带', '115.174.82.78', '2015-06-11', '1434009477');
INSERT INTO `live_login_log` VALUES ('1570', '115', '13292128950', '河北省邢台市 联通', '60.6.145.134', '2015-06-11', '1434013928');
INSERT INTO `live_login_log` VALUES ('1571', '92', '750197119', '山西省太原市 联通', '118.81.241.62', '2015-06-12', '1434094078');
INSERT INTO `live_login_log` VALUES ('1572', '126', '1901172848', '山西省太原市 联通', '118.81.241.62', '2015-06-12', '1434096833');
INSERT INTO `live_login_log` VALUES ('1573', '123', '2576383942', '山西省太原市 联通', '118.81.241.62', '2015-06-12', '1434094179');
INSERT INTO `live_login_log` VALUES ('1574', '113', '1129973911', '山西省太原市 联通', '118.81.241.62', '2015-06-12', '1434094418');
INSERT INTO `live_login_log` VALUES ('1575', '97', '李放放2', '山西省太原市 联通', '118.81.241.62', '2015-06-12', '1434095356');
INSERT INTO `live_login_log` VALUES ('1576', '99', 'wangwei', '山西省太原市 联通', '118.81.241.62', '2015-06-12', '1434095468');
INSERT INTO `live_login_log` VALUES ('1577', '118', '2892756771', '山西省太原市 联通', '118.81.241.62', '2015-06-12', '1434095840');
INSERT INTO `live_login_log` VALUES ('1578', '115', '13292128950', '河北省邢台市 联通', '60.6.157.230', '2015-06-12', '1434106331');
INSERT INTO `live_login_log` VALUES ('1579', '92', '750197119', '山西省太原市 联通', '171.118.222.66', '2015-06-15', '1434359700');
INSERT INTO `live_login_log` VALUES ('1580', '127', 'liuzihan', '山西省太原市 电信', '110.177.45.53', '2015-06-16', '1434464721');
INSERT INTO `live_login_log` VALUES ('1581', '130', 'w123456', '山西省晋中市 联通', '60.223.136.117', '2015-06-16', '1434448697');

-- ----------------------------
-- Table structure for `live_master_q2a`
-- ----------------------------
DROP TABLE IF EXISTS `live_master_q2a`;
CREATE TABLE `live_master_q2a` (
  `questionid` int(11) NOT NULL AUTO_INCREMENT,
  `questioncontent` tinytext,
  `questionname` varchar(30) DEFAULT NULL,
  `answercontent` tinytext,
  `answername` varchar(30) DEFAULT NULL,
  `masterid` int(11) DEFAULT NULL,
  `tolive` tinyint(4) DEFAULT '0' COMMENT '1:推送到直播室',
  `status` tinyint(4) DEFAULT '0' COMMENT '0：未回答；1：已回答',
  `mtime` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  `questionuserid` int(11) DEFAULT NULL,
  `answeruserid` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionid`)
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_master_q2a
-- ----------------------------
INSERT INTO `live_master_q2a` VALUES ('100', '这是我刚刚提的问题', '阿二二', null, null, '29', '0', '0', null, '1401864564', '69', null);
INSERT INTO `live_master_q2a` VALUES ('104', '我再提个问题看看', '阿二二', '我又回答了', '亿洋网络', '29', '0', '0', '1403856485', '1401864640', '69', '63');
INSERT INTO `live_master_q2a` VALUES ('103', '我要问问题向播主', '3333', '我回答了，请确认', '亿洋网络', '29', '0', '0', '1403856462', '1403856443', '75', '63');

-- ----------------------------
-- Table structure for `live_notice`
-- ----------------------------
DROP TABLE IF EXISTS `live_notice`;
CREATE TABLE `live_notice` (
  `noticeid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL,
  `link` varchar(120) DEFAULT NULL,
  `content` text NOT NULL,
  `author` varchar(30) DEFAULT NULL,
  `imgthumb` varchar(100) NOT NULL,
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `mid` int(10) NOT NULL DEFAULT '0',
  `sort` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`noticeid`)
) ENGINE=MyISAM AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_notice
-- ----------------------------

-- ----------------------------
-- Table structure for `live_pages`
-- ----------------------------
DROP TABLE IF EXISTS `live_pages`;
CREATE TABLE `live_pages` (
  `pageid` int(11) NOT NULL AUTO_INCREMENT,
  `cateid` int(11) DEFAULT NULL,
  `title` varchar(120) NOT NULL,
  `keywords` varchar(120) NOT NULL,
  `desc` varchar(500) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(30) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `source` varchar(100) NOT NULL,
  `imgthumb` varchar(100) NOT NULL,
  `color` char(7) NOT NULL,
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `realhits` int(10) unsigned NOT NULL DEFAULT '0',
  `ctime` int(10) unsigned NOT NULL DEFAULT '0',
  `mtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `mid` int(10) NOT NULL DEFAULT '0',
  `sort` int(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`pageid`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_pages
-- ----------------------------
INSERT INTO `live_pages` VALUES ('84', '100', '合作伙伴', '', '', '<p>&nbsp;</p>\n<h2 style=\"border-bottom: #ccc 1px dotted; line-height: 34px; padding-left: 15px; background: url(/images/articl/bg3.jpg) no-repeat left 50%; height: 34px; font-size: 16px\">新华浙江大宗商品交易中心</h2>\n<p><img alt=\"新华浙江大宗商品交易中心\" style=\"border-bottom: #ccc 1px solid; border-left: #ccc 1px solid; padding-bottom: 10px; padding-left: 10px; width: 200px; padding-right: 10px; float: right; margin-left: 15px; border-top: #ccc 1px solid; border-right: #ccc 1px solid; padding-top: 10px\" src=\"/images/articl/xinhua.jpg\" />新华浙江大宗商品交易中心由中经社控股有限公司全资设立的新华社金融信息交易所和杭州兴利投资有限公司共同组建。交易中心将在国家法律法规范围内开展大宗商品现货电子交易，交易品种拟涵盖贵金属、有色金属、石化产品等领域。</p>\n<p>&nbsp;</p>\n<h2 style=\"border-bottom: #ccc 1px dotted; line-height: 34px; padding-left: 15px; background: url(/images/articl/bg3.jpg) no-repeat left 50%; height: 34px; font-size: 16px\">中国农业银行</h2>\n<p><img alt=\"中国农业银行\" style=\"border-bottom: #ccc 1px solid; border-left: #ccc 1px solid; width: 200px; float: right; margin-left: 15px; border-top: #ccc 1px solid; border-right: #ccc 1px solid\" src=\"/images/articl/nyyh.jpg\" />中国农业银行（Agricultural Bank of China，简称ABC，农行）是中国大型上市银行，中国五大银行之一。最初成立于1951年(辛卯年)，是新中国成立的第一家国有商业银行，也是中国金融体系的重要组成部分，总行设在北京。数年来，中国农行一直位居世界五百强企业之列，在&ldquo;全球银行1000强&rdquo;中排名前7位，穆迪信用评级为A1。2009年，中国农行由国有独资商业银行整体改制为现代化股份制商业银行，并在2010年完成&ldquo;A+H&rdquo;两地上市，总市值位列全球上市银行第五位。</p>\n<p>&nbsp;</p>\n<h2 style=\"border-bottom: #ccc 1px dotted; line-height: 34px; padding-left: 15px; background: url(/images/articl/bg3.jpg) no-repeat left 50%; height: 34px; font-size: 16px\">杭州银行</h2>\n<p><img alt=\"杭州银行\" style=\"border-bottom: #ccc 1px solid; border-left: #ccc 1px solid; width: 200px; float: right; margin-left: 15px; border-top: #ccc 1px solid; border-right: #ccc 1px solid\" src=\"/images/articl/hzyh.jpg\" />杭州银行成立于1996年9月26日，经过十五年的努力，现已发展成为一家初具规模、资产质量良好、盈利能力较强、综合实力跻身全国城市商业银行前列的具有良好投资价值的股份制商业银行。 目前，本行正通过&ldquo;引资&rdquo;实现&ldquo;引智&rdquo;，借鉴和引进吸收先进经营理念，致力于增强核心竞争力，打造成为中国价值领先银行。</p>\n<p>&nbsp;</p>\n<h2 style=\"border-bottom-color: rgb(204, 204, 204); border-bottom-width: 1px; border-bottom-style: dotted; line-height: 34px; padding-left: 15px; background-image: url(http://www.hxylpme.com/images/articl/bg3.jpg); height: 34px; font-size: 16px; background-position: 0% 50%; background-repeat: no-repeat no-repeat;\">中国兴业银行</h2>\n<p><img alt=\"中国兴业银行\" src=\"/images/articl/xyyh.jpg\" style=\"border: 1px solid rgb(204, 204, 204); width: 200px; float: right; margin-left: 15px;\" />兴业银行（Industrial Bank），原名福建兴业银行，是总部位于中国福建省福州市的一家全国性股份制商业银行；是经国务院、中国人民银行批准成立的首批股份制商业银行之一，2007年2月5日正式在上海证券交易所挂牌上市，注册资本50亿元。截至2008年末，兴业银行资产总额为10209亿元，全年累计实现净利润113.85亿元，不良贷款率0.83%。&nbsp;</p>\n<p>&nbsp;</p>\n<h2 style=\"border-bottom-color: rgb(204, 204, 204); border-bottom-width: 1px; border-bottom-style: dotted; line-height: 34px; padding-left: 15px; background-image: url(http://www.hxylpme.com/images/articl/bg3.jpg); height: 34px; font-size: 16px; background-position: 0% 50%; background-repeat: no-repeat no-repeat;\">中国工商银行</h2>\n<p><img alt=\"中国工商银行\" src=\"/images/articl/gsyh.jpg\" style=\"border: 1px solid rgb(204, 204, 204); width: 200px; float: right; margin-left: 15px;\" />中国工商银行（全称：中国工商银行股份有限公司）成立于1984年，是中国五大银行之首，世界五百强企业之一，拥有中国最大的客户群，是中国最大的商业银行。 中国工商银行是中国最大的国有独资商业银行，基本任务是依据国家的法律和法规，通过国内外开展融资活动筹集社会资金，加强信贷资金管理，支持企业生产和技术改造，为我国经济建设服务。2013年4月18日，《福布斯》2013全球企业2000强榜单出炉，中国工商银行超越埃克森美孚，成为全球最大企业。&nbsp;</p>\n<p>&nbsp;</p>\n<h2 style=\"border-bottom-color: rgb(204, 204, 204); border-bottom-width: 1px; border-bottom-style: dotted; line-height: 34px; padding-left: 15px; background-image: url(http://www.hxylpme.com/images/articl/bg3.jpg); height: 34px; font-size: 16px; background-position: 0% 50%; background-repeat: no-repeat no-repeat;\">中国建设银行</h2>\n<p><img alt=\"中国建设银行\" src=\"/images/articl/jsyh.jpg\" style=\"border: 1px solid rgb(204, 204, 204); width: 200px; float: right; margin-left: 15px;\" />中国建设银行（简称建设银行或建行，最初名为中国人民建设银行）成立于1954年10月1日，是股份制商业银行。 是国有五大商业银行之一。中国建设银行主要经营领域包括公司银行业务、个人银行业务和资金业务，中国内地设有分支机构14,121 家（2012年），在香港，台湾，墨尔本等地设有分行，拥有建行亚洲、建信租赁、建银国际等金融机构。2013年4月18日，《福布斯》2013全球企业2000强榜单出炉，中国建设银行仅次于中国工商银行，成为全球第二大企业。</p>\n<p>&nbsp;</p>', '', '', '', '', '', '0', '0', '1395986858', '0', '0', '0', '4', '1');
INSERT INTO `live_pages` VALUES ('85', '100', '组织架构', '', '', '<img src=\"/project/eysystem/ey_goldchat/c_feibei/upload/news/20140328/55868a86289e2d9f1bed147edbb88e1b.jpg\" alt=\"\" />', '', '', '', '', '', '0', '0', '1395986898', '0', '0', '0', '7', '1');
INSERT INTO `live_pages` VALUES ('86', '100', '企业文化', '', '', '<p>\n	<strong>核心价值：</strong>诚信、创新、共赢\n</p>\n<p>\n	<strong>经营理念：</strong>国家利益高于一切，服务实体经济是国家根本\n</p>\n<p>\n	<strong>品牌使命：</strong>推动中国商品流通标准化、现代化建设，规范中国商品交易定价体系，为中国商品在国际市场行争取定价权，为中国经济持续健康发展服务。\n</p>\n<strong>企业愿景：</strong>创导大宗商品投资领导品牌', '', '', '', '', '', '0', '0', '1395986917', '0', '0', '0', '8', '1');
INSERT INTO `live_pages` VALUES ('126', '147', '青交所', '', '', '<div id=\"dhzzzz\">\n	<div id=\"dhzzz-tit\">\n		<div id=\"dhzzz-tit-left\">\n			罗弈金格\n		</div>\n		<div id=\"dhzzz-tit-right\">\n			<a href=\"#\"> <img alt=\"\" src=\"images/tit2.gif\" /></a> \n		</div>\n	</div>\n	<table class=\"tbvvv\" border=\"1\" cellpadding=\"10\" cellspacing=\"0\" width=\"708\">\n		<tbody>\n			<tr>\n				<td bgcolor=\"#fdf5eb\" width=\"30%\" height=\"22\">\n					产品规格\n				</td>\n				<td align=\"left\">\n					10公斤、50公斤、100公斤\n				</td>\n			</tr>\n			<tr>\n				<td bgcolor=\"#fdf5eb\" height=\"22\">\n					杠杆\n				</td>\n				<td align=\"left\">\n					50倍\n				</td>\n			</tr>\n			<tr>\n				<td bgcolor=\"#fdf5eb\" height=\"22\">\n					保证金\n				</td>\n				<td align=\"left\">\n					10公斤：800元左右<br />\n50公斤：4000元左右<br />\n100公斤：8000元左右\n				</td>\n			</tr>\n			<tr>\n				<td bgcolor=\"#fdf5eb\" height=\"22\">\n					手续费\n				</td>\n				<td align=\"left\">\n					10公斤：100元<br />\n50公斤：475元(9.5折)<br />\n100公斤：900元(9折)\n				</td>\n			</tr>\n			<tr>\n				<td bgcolor=\"#fdf5eb\" height=\"22\">\n					点差、滑点\n				</td>\n				<td align=\"left\">\n					无点差、无滑点\n				</td>\n			</tr>\n			<tr>\n				<td bgcolor=\"#fdf5eb\" height=\"22\">\n					隔夜费\n				</td>\n				<td align=\"left\">\n					0.8元/公斤，每天结算时间收取\n				</td>\n			</tr>\n			<tr>\n				<td bgcolor=\"#fdf5eb\" height=\"22\">\n					出入金\n				</td>\n				<td align=\"left\">\n					入金：交易日早6：00到凌晨24：00，入金不收费<br />\n出金：交易日早9：00到下午18：00，出金农行收取20元手续费\n				</td>\n			</tr>\n			<tr>\n				<td bgcolor=\"#fdf5eb\" height=\"22\">\n					交易时间\n				</td>\n				<td align=\"left\">\n					周一早8：00至周六早5：00（结算时间、国际市场休息除外）\n				</td>\n			</tr>\n			<tr>\n				<td bgcolor=\"#fdf5eb\" height=\"22\">\n					结算时间\n				</td>\n				<td align=\"left\">\n					早5：00-6：00\n				</td>\n			</tr>\n			<tr>\n				<td bgcolor=\"#fdf5eb\" height=\"22\">\n					安全性\n				</td>\n				<td align=\"left\">\n					资金由北京农行总行三方存管\n				</td>\n			</tr>\n			<tr>\n				<td bgcolor=\"#fdf5eb\" height=\"22\">\n					优势\n				</td>\n				<td align=\"left\">\n					1、保证金低，手续费低<br />\n2、资金安全，无开户门槛限制<br />\n3、可手机看盘和交易，只要是安卓操作系统均可下载手机操作软件<br />\n4、MT5交易软件，操作方便<br />\n5、平台稳定性好，非农等大型数据行情下单流畅\n				</td>\n			</tr>\n		</tbody>\n	</table>\n</div>', '', null, '', '', '', '0', '0', '1400144456', '1400465738', '0', '0', '3', '1');
INSERT INTO `live_pages` VALUES ('125', '147', '中矿国际', '', '', '<p class=\"MsoNormal\">\n	<b><span style=\"font-size:16.0pt;line-height:150%;font-family:宋体;color:#333333;\">一、关于理财<span></span></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-indent:23.6pt;\">\n	<b><span style=\"font-size:12.0pt;line-height:150%;font-family:宋体;color:black;\">所谓：你不理财，财不理你。<span></span></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-indent:23.6pt;\">\n	<b><span style=\"font-size:12.0pt;line-height:150%;font-family:宋体;color:black;\">挣钱是重要的，但是更重要的是要懂得如何留住这些钱，让其保值增值。许多人说投资有风险，其实投资本身不会有风险，失控的投资才有风险。投资本身并不冒险，只是因为缺乏投资技巧的投资者，才导致了投资的高风险。真正的投资者总是能未雨绸缪，非投资者却总想猜测将来会发生什么、什么时间发生。\n投资有风险，究其原因主要有三点：<span>1</span>．他们没有接受过<span>“</span>如何成为投资者<span>”</span>的专门训练。<span>2</span>．其次，多数投资者缺乏控制力。<span>3</span>．多数投资者是从外部投资，而不是从内部投资。<span><span>&nbsp; </span></span></span></b><b><span style=\"font-size:18.0pt;line-height:150%;font-family:宋体;color:#333333;\"></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;background:white;\" align=\"left\">\n	<b><span style=\"font-size:16.0pt;line-height:200%;font-family:宋体;color:#333333;\">二、选择金银贵金属交易投资的<span style=\"background:silver;\">11</span><span style=\"background:silver;\">大理由</span><span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;text-indent:29.5pt;background:white;\" align=\"left\">\n	<b><span style=\"font-size:12.0pt;line-height:200%;font-family:宋体;\">1</span></b><b><span style=\"font-size:12.0pt;line-height:200%;font-family:宋体;\">、交易服务模式好：国内唯一采用国际上最先进的<span>OTC</span>交易模式，见价成交，促进交易获利机会增多，无撮合竞价存在的问题。</span></b><b><span style=\"font-size:12.0pt;line-height:200%;background:white;\"><span>&nbsp;&nbsp;&nbsp; </span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;text-indent:29.5pt;background:white;\" align=\"left\">\n	<b><span style=\"font-size:12.0pt;line-height:200%;font-family:宋体;\">2</span></b><b><span style=\"font-size:12.0pt;line-height:200%;font-family:宋体;\">、交易服务时间长</span></b><span style=\"font-size:12.0pt;line-height:200%;font-family:宋体;\">：</span><b><span style=\"font-size:12.0pt;line-height:200%;font-family:宋体;\">中矿国际贵金属交易时间基本上与国际同步，</span></b><b><span style=\"font-size:12.0pt;line-height:200%;font-family:宋体;\">最长每天接近<span>24</span>小时交易，涵盖国际上所有主要的贵金属交易市场时间，为</span></b><b><span style=\"font-size:12.0pt;line-height:200%;font-family:宋体;\">国内其他交易场所不可比拟。</span></b><b><span style=\"font-size:12.0pt;line-height:200%;background:white;\"></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;text-indent:24.1pt;\" align=\"left\">\n	<b><span style=\"font-size:12.0pt;font-family:宋体;\">3</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">、交易服务速度快：<span>T+0</span>交易方式，资金结算时间短，买了马上可以卖，卖了可以马上买，当日可进行多次交易，提供更多投资机遇。<span></span></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;text-indent:24.1pt;\" align=\"left\">\n	<b><span style=\"font-size:12.0pt;font-family:宋体;\">4</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">、交易方向为双向：买涨买跌，只要方向判断准确都可获利。赚钱机会多，白银涨，您做多，赚；白银跌，您做空，也赚！（股票只有涨才会赚，跌则亏或只能观望）</span></b><span style=\"font-size:12.0pt;font-family:宋体;\"></span> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;text-indent:24.1pt;\" align=\"left\">\n	<b><span style=\"font-size:12.0pt;font-family:宋体;\">5</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">、交易保证金低：保证金低至<span>2%</span>，正规途径下目前国内最低</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">开户资金<span>10</span>万元，目前每一手白银交易约<span>7000</span>元，按<span>50</span>倍的资金杠杆，以小博大， 使小资金也可以获取大利润。</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\"></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;text-indent:24.1pt;\" align=\"left\">\n	<b><span style=\"font-size:12.0pt;font-family:宋体;\">6</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">、交易</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">风险可控制：可预设止损点，把损失风险控制在一定范围内；也可</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">设置止盈位，方便客户获利出场。<span></span></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;text-indent:24.1pt;\" align=\"left\">\n	<b><span style=\"font-size:12.0pt;font-family:宋体;\">7</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">、 交易无庄家操纵：全球每日贵金属交易量超过<span>20</span>万亿美元，任何人或任何财团都没有能力控制它。</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\"></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;text-indent:24.1pt;\" align=\"left\">\n	<b><span style=\"font-size:12.0pt;font-family:宋体;\">8</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">、交易无涨跌停板：与国际上金融交易市场接轨，涨跌波幅大，不限制市场影响产生的应涨跌停收益情况。<span></span></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;text-indent:24.1pt;\" align=\"left\">\n	<b><span style=\"font-size:12.0pt;font-family:宋体;\">9</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">、</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">保值增值强</span></b><span style=\"font-size:12.0pt;font-family:宋体;\">：<b>黄金、白银实物从古至今都是最佳保值产品之一，升值潜力大；现在世界上通货膨胀加剧，</b></span><b><span style=\"font-size:12.0pt;font-family:宋体;\">由于信用危机而出现波动贬值时，黄金、白银就会升值，</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">将推进黄金增值。</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\"></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;text-indent:24.1pt;\" align=\"left\">\n	<b><span style=\"font-size:12.0pt;font-family:宋体;\">10</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">、投资</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">趋势好</span></b><span style=\"font-size:12.0pt;font-family:宋体;\">：<b>投资白银在国内才刚刚兴起，股票、房地产、基金等投资品种都已经淡漠的时候，白银等贵金属投资可令你耳目一新。</b></span><b><span style=\"font-size:12.0pt;font-family:宋体;\"></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;text-indent:24.1pt;\" align=\"left\">\n	<b><span style=\"font-size:12.0pt;font-family:宋体;\">11</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">、</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">操作简单：</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">单独白银一只投资品种，利于投资者深入研究，集中精力关注，</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">不象选股那么麻烦。<span></span></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;text-indent:24.1pt;\" align=\"left\">\n	<b><span style=\"font-size:12.0pt;font-family:宋体;\">12</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">、 价格受影响固定：</span></b><b><span style=\"font-size:12.0pt;font-family:宋体;\">白银等贵金属受国际上各种政治、经济、突发事件的影响，通常主要受原油、美元、欧元、外股、失业率、货币政策、通货膨胀等影响较大，白银价格经常处于剧烈的波动之中，可以利用这差价进行套利买、卖，增加获利机会。<span></span></span></b> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;background:white;\" align=\"left\">\n	<b><span style=\"font-size:16.0pt;font-family:宋体;color:#2B2B2B;\">三、中矿国际的优势：</span></b><span style=\"font-size:16.0pt;font-family:宋体;color:#2B2B2B;\"></span> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;background:white;\" align=\"left\">\n	<b><span style=\"font-family:宋体;color:#2B2B2B;\">1</span></b><b><span style=\"font-family:宋体;color:#2B2B2B;\">、银行官网签约<span>:</span></span></b><b><span style=\"font-family:宋体;color:red;\">客户自己在农业银行官方网站办理签约，确保资金安全<span>.</span></span></b><span style=\"font-family:宋体;color:#2B2B2B;\"></span> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;background:white;\" align=\"left\">\n	<b><span style=\"font-family:宋体;color:#2B2B2B;\">2</span></b><b><span style=\"font-family:宋体;color:#2B2B2B;\">、北京交易所<span>:</span></span></b><b><span style=\"font-family:宋体;color:red;\">北京政府批准合法保证金产品<span>.</span></span></b><span style=\"font-family:宋体;color:#2B2B2B;\"></span> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;background:white;\" align=\"left\">\n	<b><span style=\"font-family:宋体;color:#2B2B2B;\">3</span></b><b><span style=\"font-family:宋体;color:#2B2B2B;\">、权威机构<span>:</span></span></b><b><span style=\"font-family:宋体;color:red;\">腾讯财经频道黄金栏目特约机构，可自己进入腾讯财经频道查询。</span></b><span style=\"font-family:宋体;color:#2B2B2B;\"></span> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;background:white;\" align=\"left\">\n	<b><span style=\"font-family:宋体;color:#2B2B2B;\">4</span></b><b><span style=\"font-family:宋体;color:#2B2B2B;\">、双向操作<span>:</span></span></b><b><span style=\"font-family:宋体;color:red;\">可以买涨买跌，没有行情好坏之分，买对一个方向即可赚钱。</span></b><span style=\"font-family:宋体;color:#2B2B2B;\"></span> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;background:white;\" align=\"left\">\n	<b><span style=\"font-family:宋体;color:#2B2B2B;\">5</span></b><b><span style=\"font-family:宋体;color:#2B2B2B;\">、<span>T+0</span>交易<span>:</span></span></b><b><span style=\"font-family:宋体;color:red;\">随时建仓随时减仓或者平仓，无需第二天，不错过赚钱的机会。</span></b><span style=\"font-family:宋体;color:#2B2B2B;\"></span> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;background:white;\" align=\"left\">\n	<b><span style=\"font-family:宋体;color:#2B2B2B;\">6</span></b><b><span style=\"font-family:宋体;color:#2B2B2B;\">、交易时间<span>:</span></span></b><b><span style=\"font-family:宋体;color:red;\">24</span></b><b><span style=\"font-family:宋体;color:red;\">小时连续交易（早上<span>6</span>：<span>00-</span>凌晨<span>5</span>：<span>00</span>），可用休闲时间交易。</span></b><span style=\"font-family:宋体;color:#2B2B2B;\"></span> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;background:white;\" align=\"left\">\n	<b><span style=\"font-family:宋体;color:#2B2B2B;\">7</span></b><b><span style=\"font-family:宋体;color:#2B2B2B;\">、公平 公正 公开<span>:</span></span></b><b><span style=\"font-family:宋体;color:red;\">全世界同步报价，无庄家控盘，人人平等<span>.</span></span></b><span style=\"font-family:宋体;color:#2B2B2B;\"></span> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;background:white;\" align=\"left\">\n	<b><span style=\"font-family:宋体;color:#2B2B2B;\">8</span></b><b><span style=\"font-family:宋体;color:#2B2B2B;\">、<span>T+0</span>出入金<span>(</span>存取款<span>):</span></span></b><b><span style=\"font-family:宋体;color:red;\">一秒钟到账，能更好的调动资金。</span></b><span style=\"font-family:宋体;color:#2B2B2B;\"></span> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;background:white;\" align=\"left\">\n	<b><span style=\"font-family:宋体;color:#2B2B2B;\">9</span></b><b><span style=\"font-family:宋体;color:#2B2B2B;\">、资金门槛低<span>:</span></span></b><b><span style=\"font-family:宋体;color:red;\">起始资金<span>3W</span>即可免费办理开户，适合中小投资者，大资金投资者可先小投入尝试。</span></b><span style=\"font-family:宋体;color:#2B2B2B;\"></span> \n</p>\n<p class=\"MsoNormal\" style=\"text-align:left;background:white;\" align=\"left\">\n	<b><span style=\"font-family:宋体;color:#2B2B2B;\">10</span></b><b><span style=\"font-family:宋体;color:#2B2B2B;\">、（全国各地）均可办理开户<span>.</span>详情请联系本人</span></b><span style=\"font-family:宋体;color:#2B2B2B;\"></span> \n</p>\n<p class=\"MsoNormal\">\n	<b><span style=\"font-family:宋体;color:red;\">不在乎方向的对错，在于方向对的时候，你能赚多少；方向错的时候，你亏损多少？\n专业的团队，合法的公司，安全的资金渠道，选择我们，你已成功一大半<span>.</span></span></b><span style=\"font-family:宋体;color:#2B2B2B;\"></span><span></span> \n</p>\n<p class=\"MsoNormal\">\n	<span>&nbsp;</span> \n</p>\n<table class=\"MsoNormalTable\" style=\"border-collapse:collapse;border:none;\" align=\"left\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\">\n	<tbody>\n		<tr>\n			<td colspan=\"8\" style=\"border:1pt solid #666699;\" width=\"656\">\n				<h1 class=\"MsoNormal\" style=\"text-align:center;vertical-align:middle;\" align=\"center\">\n					<span style=\"color:#000000;\">《中矿国际交易规则》</span> \n				</h1>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-family:&quot;color:black;background:white;\"></span><b><span style=\"font-family:宋体;color:#333333;background:white;\">交易品种</span></b><span style=\"color:black;background:white;\"></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">至尊宝<span></span></span></b> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">至尊宝<span></span></span></b> \n				</p>\n			</td>\n			<td colspan=\"2\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">标准银<span>10KG</span></span></b> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">标准银<span>30KG</span></span></b> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">标准银<span>50KG</span></span></b> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"92\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">标准银<span>100KG</span></span></b> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">交易单位<span></span></span></b> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">1</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">/</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">手</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">3</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">/</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">手<span></span></span> \n				</p>\n			</td>\n			<td colspan=\"2\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">10</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克<span>/</span>手<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">30</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克<span>/</span>手<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">50</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克<span>/</span>手<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"92\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">100</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克<span>/</span>手<span></span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">最小变动单位<span></span></span></b> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">0.01</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">/</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">克</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">0.01</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">/</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克<span></span></span> \n				</p>\n			</td>\n			<td colspan=\"2\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">0.1</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>克<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">0.1</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>克<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">0.1</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>克<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"92\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">0.1</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>克<span></span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">报价单位<span></span></span></b> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">/</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">克<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">/</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">克<span></span></span> \n				</p>\n			</td>\n			<td colspan=\"2\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">/</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">克<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">/</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">克<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">/</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">克<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"92\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">/</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">克<span></span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">最小交易限额单笔最大</span></b><b><span style=\"font-family:&quot;color:#333333;background:white;\"></span></b> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">100</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">克<span></span></span> \n				</p>\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">（<span>50</span>手）</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">300</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">克<span></span></span> \n				</p>\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">（<span>50</span>手）</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n			</td>\n			<td colspan=\"2\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">10</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">（</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">50</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">手）</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">30</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克<span></span></span> \n				</p>\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">（<span>50</span>手）</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">50</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克<span></span></span> \n				</p>\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">（<span>50</span>手）</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"92\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">&nbsp;</span> \n				</p>\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">100</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克<span></span></span> \n				</p>\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">（<span>50</span>手）</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n				<p class=\"MsoNormal\" style=\"background:white;vertical-align:middle;\">\n					<span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">&nbsp;</span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">最大持仓量<span></span></span></b> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">200</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">手</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">200</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">手</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n			</td>\n			<td colspan=\"2\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">200</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">手</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">200</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">手</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">200</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">手</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"92\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">200</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">手</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\"></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">点<span><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span>差<span></span></span></b> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">100</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/KG</span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">300</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>3KG</span></span> \n				</p>\n			</td>\n			<td colspan=\"2\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">50</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/10KG</span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">150</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/30KG</span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">225</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/50KG</span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"92\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">450</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/100KG</span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">手<span><span>&nbsp; </span></span>续<span><span>&nbsp; </span></span>费<span></span></span></b> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">100</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/KG</span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">300</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/3KG</span></span> \n				</p>\n			</td>\n			<td colspan=\"2\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">50</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/10KG</span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">150</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/30KG</span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">225</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/50KG</span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"92\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">450</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/100KG</span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\"><span>&nbsp;</span></span></b><b><span style=\"font-family:宋体;color:#333333;background:white;\">仓息（订货）<span></span></span></b> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">23</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>手<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">69</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>手<span></span></span> \n				</p>\n			</td>\n			<td colspan=\"2\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">8</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>手<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">24</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>手<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">40</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>手<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"92\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">80</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>手<span></span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-indent:5.15pt;background:white;vertical-align:middle;\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">仓息（回购） <span></span></span></b> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">23</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>手<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">69</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>手<span></span></span> \n				</p>\n			</td>\n			<td colspan=\"2\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">8</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>手<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">24</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>手<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">40</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>手<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"92\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">80</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">元<span>/</span>手<span></span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"background:white;vertical-align:middle;\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">最大交易单位<span></span></span></b> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">3000</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">克<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">3000</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">克<span></span></span> \n				</p>\n			</td>\n			<td colspan=\"2\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"94\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">100</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">100</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"88\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">100</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克<span></span></span> \n				</p>\n			</td>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"92\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">100</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">千克<span></span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-indent:5.15pt;background:white;vertical-align:middle;\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">&nbsp;</span></b> \n				</p>\n				<p class=\"MsoNormal\" style=\"text-indent:5.15pt;background:white;vertical-align:middle;\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">订货比例<span></span></span></b> \n				</p>\n			</td>\n			<td colspan=\"7\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"543\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">预付<span>2%</span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-indent:5.15pt;background:white;vertical-align:middle;\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">资金托管<span></span></span></b> \n				</p>\n			</td>\n			<td colspan=\"3\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"271\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">第三方资金托管，柜台签约（农业银行）<span></span></span> \n				</p>\n			</td>\n			<td colspan=\"4\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"271\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">第三方支付，国内<span>18</span>家银行<span></span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-indent:5.15pt;background:white;vertical-align:middle;\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">出入金时间<span></span></span></b> \n				</p>\n			</td>\n			<td colspan=\"7\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"543\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">入金：不限；<span><span>&nbsp; </span></span>出金：</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">09:00--11:30<span>&nbsp; </span>13:30--17:00</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\"></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"background:white;vertical-align:middle;\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">账户最大入金<span></span></span></b> \n				</p>\n			</td>\n			<td colspan=\"7\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"543\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">不限<span></span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"background:white;vertical-align:middle;\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">当日最大出金<span></span></span></b> \n				</p>\n			</td>\n			<td colspan=\"7\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"543\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">30</span><span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">万<span></span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">清算时间<span></span></span></b> \n				</p>\n			</td>\n			<td colspan=\"7\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"543\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">05:00</span><span style=\"font-size:9.0pt;color:black;background:white;\">——</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">06:00</span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">办理手续时间<span></span></span></b> \n				</p>\n			</td>\n			<td colspan=\"7\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"543\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">9:00</span><span style=\"font-size:9.0pt;color:black;background:white;\">——</span><span style=\"font-size:9.0pt;font-family:&quot;color:black;background:white;\">17:30</span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">交易时间<span></span></span></b> \n				</p>\n			</td>\n			<td colspan=\"7\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"543\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">周一早上<span>8:00——</span>周六早<span>5:00</span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">交易方式<span></span></span></b> \n				</p>\n			</td>\n			<td colspan=\"7\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"543\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">双向委托交易，<span>t+0</span>交易<span></span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:solid #666699 1.0pt;background:white;\" width=\"113\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:宋体;color:#333333;background:white;\">交易机制<span></span></span></b> \n				</p>\n			</td>\n			<td colspan=\"7\" style=\"border:solid #666699 1.0pt;background:white;\" width=\"543\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:white;vertical-align:middle;\" align=\"center\">\n					<span style=\"font-size:9.0pt;font-family:宋体;color:black;background:white;\">实物<span>ECN</span>贸易平台，预付款保证金订货，回购<span></span></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"8\" style=\"border:solid #666699 1.0pt;background:#FFFF99;\" width=\"656\">\n				<p class=\"MsoNormal\" style=\"text-align:center;background:#FFFF99;vertical-align:middle;\" align=\"center\">\n					<b><span style=\"font-family:&quot;color:maroon;\"><span>&nbsp;&nbsp;&nbsp; </span></span></b><b><span style=\"font-family:宋体;color:maroon;\">中矿国际</span></b><b><span style=\"color:maroon;\">——</span></b><b><span style=\"font-family:宋体;color:maroon;\">电子商务部</span></b><span style=\"font-size:12.0pt;font-family:宋体;color:black;background:#FFFF99;\"></span> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td colspan=\"8\" style=\"border:solid #666699 1.0pt;background:#FFFF99;\" width=\"656\">\n				<p class=\"MsoNormal\" style=\"background:#FFFF99;vertical-align:middle;\">\n					<b><span style=\"font-family:&quot;color:maroon;\"><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></b> \n				</p>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"border:none;\" width=\"113\">\n				<br />\n			</td>\n			<td style=\"border:none;\" width=\"88\">\n				<br />\n			</td>\n			<td style=\"border:none;\" width=\"94\">\n				<br />\n			</td>\n			<td style=\"border:none;\" width=\"90\">\n				<br />\n			</td>\n			<td style=\"border:none;\" width=\"4\">\n				<br />\n			</td>\n			<td style=\"border:none;\" width=\"88\">\n				<br />\n			</td>\n			<td style=\"border:none;\" width=\"88\">\n				<br />\n			</td>\n			<td style=\"border:none;\" width=\"92\">\n				<br />\n			</td>\n		</tr>\n	</tbody>\n</table>\n<p class=\"MsoNormal\">\n	<span>&nbsp;</span> \n</p>', '', null, '', '', '', '0', '0', '1400144402', '1400476103', '0', '0', '2', '1');
INSERT INTO `live_pages` VALUES ('124', '147', '西部商品', '', '', '<ul>\n	<li>\n		<h3>\n			<span style=\"font-size:14px;\"><span style=\"font-family:arial, helvetica, sans-serif;\">螺纹钢</span></span>　\n		</h3>\n	</li>\n</ul>\n<p>\n	<span style=\"font-size:14px;\"><span style=\"font-family:arial, helvetica, sans-serif;\">　\n　螺纹钢是热轧带肋钢筋的俗称。 \n普通热轧钢筋其牌号由HRB和牌号的屈服点最小值构成。H、R、B分别为热轧（Hotrolled）、带肋（Ribbed）、钢筋（Bars）三个词的英\n文首位字母。热轧带肋钢筋分为HRB335（老牌号为20MnSi）、HRB400（老牌号为20MnSiV、20MnSiNb、20Mnti）、\nHRB500三个牌号。螺纹钢广泛用于房屋、桥梁、道路等土建工程建设。大到高速公路、铁路、桥梁、涵洞、隧道、防洪、水坝等公用设施，小到房屋建筑的基\n础、梁、柱、墙、板，螺纹钢都是不可或缺的结构材料。随着我国城镇化程度的不断深入，基础设施建设、房地产的蓬勃发展对螺纹钢的需求强烈。</span></span>\n</p>\n<p>\n	<img src=\"http://project.yuyaoit.cn/demo_livechat3/upload/pages/20140519/8fbee50341880c50b583e93b3d685cce.jpg\" alt=\"\" /> \n</p>\n<ul>\n	<li>\n		<h3>\n			飞天银\n		</h3>\n	</li>\n</ul>\n<p>\n	<span style=\"font-size:14px;\"><span style=\"font-family:arial, helvetica, sans-serif;\">&nbsp;　\n　白银，即银，因其色白，故称白银，与黄金相对。多用其作货币及装饰品。古代做通货时称白银。纯白银颜色白，掺有杂质金属光泽，质软，掺有杂质后变硬，颜\n色呈灰、红色。纯白银比重为10.5，熔点960.5℃，导电性能佳，溶于硝酸、硫酸中。银是古代发现的金属之一。银在自然界中虽然也有单质存在，但绝大\n部分是以化合态的形式存在。银具有很高的延展性，因此可以碾压成只有0.3微米厚的透明箔，1克重的银粒就可以拉成约两公里长的细丝。银的导热性和导电性\n在金属中名列前茅。</span></span>\n</p>\n<p>\n	<img src=\"http://project.yuyaoit.cn/demo_livechat3/upload/pages/20140519/284b8531074750b9ba28b364ac8ab3f6.jpg\" alt=\"\" />\n</p>\n<ul>\n	<li>\n		<h3>\n			铜\n		</h3>\n	</li>\n</ul>\n<p>\n	<span style=\"font-size:14px;\"><span style=\"font-family:arial, helvetica, sans-serif;\">　\n　铜是一种化学元素，它的化学符号是Cu（拉丁语：Cuprum），它的原子序数是29，是一种过渡金属。铜是人类发现最早的金属之一，也是人类广泛使用\n的第一种金属。铜和它的一些合金有较好的耐腐蚀能力，又因为有光泽，容易加工，因此被用于制造货币。铜也被用于制造武器、器皿以及电缆。在潮湿的空气里，\n铜的表面会生成一层绿色的铜绿。铜是人类最早发现的金属之一，也是最好的纯金属之一，属于重金属这一行列。同时铜也是人体所含微量元素之一。</span></span>\n</p>\n<p>\n	<img src=\"http://project.yuyaoit.cn/demo_livechat3/upload/pages/20140519/e9b339a7eb97076680f6e0dcf3f2df5f.jpg\" alt=\"\" />\n</p>\n<ul>\n	<li>\n		<h3>\n			铝\n		</h3>\n	</li>\n</ul>\n<p>\n	<span style=\"font-size:14px;\"><span style=\"font-family:arial, helvetica, sans-serif;\">　\n　铝，银白色轻金属，有延展性。商品常制成棒状、片状、箔状、粉状、带状和丝状。在潮湿空气中能形成一层防止金属腐蚀的氧化膜。铝粉和铝箔在空气中加热能\n猛烈燃烧，并发出眩目的白色火焰。易溶于稀硫酸、硝酸、盐酸、氢氧化钠和氢氧化钾溶液，难溶于水。相对密度2.70。熔点660℃。沸点2327℃。铝元\n素在地壳中的含量仅次于氧和硅，居第三位，是地壳中含量最丰富的金属元素。航空、建筑、汽车三大重要工业的发展，要求材料特性具有铝及其合金的独特性质，\n这就大大有利于这种新金属铝的生产和应用。应用极为广泛。</span></span>\n</p>\n<p>\n	<img src=\"http://project.yuyaoit.cn/demo_livechat3/upload/pages/20140519/3f2baaa661b8ceaca1374e42731be236.jpg\" alt=\"\" />\n</p>\n<ul>\n	<li>\n		<h3>\n			钻石\n		</h3>\n	</li>\n</ul>\n<p>\n	　　钻石，即矿物学中的金刚石，是碳元素经地质作用而形成，原生矿主要为金伯利岩和钾镁煌斑岩。钻石的化学成分是碳，是宝石中唯一由单一元素组成的。单晶\n体，晶体呈透明状，在自然界中单晶常以八面体、四面体和菱形十二面体出现，其颜色常为无色、淡黄色、淡褐色，天然产出的红色、蓝色、绿色等极其稀少。钻石\n属于金刚光泽，折射率为2.417，摩氏硬度为10，在宝石中硬度最高。密度为3.52g/cm<span style=\"color:#333333;background-color:#FFFFFF;\">²</span>，色散为0.044，是天然无色宝石中最高的，正是钻石具有较高的色散值，使得钻石按标准圆形明亮型琢型切割好后能产生五颜六色的火彩。\n</p>\n<p>\n	<img src=\"http://project.yuyaoit.cn/demo_livechat3/upload/pages/20140519/9646474e1f43f4d29be25a437fe19bfc.jpg\" alt=\"\" />\n</p>', '', null, '', '', '', '0', '0', '1400144361', '1400471091', '0', '0', '1', '1');
INSERT INTO `live_pages` VALUES ('105', '106', '常用软件', '', '', '<p>\n	真实客户端软件(xp版)<span style=\"font-size:14px;color:#666;\">版本：V3.4.0.2080 大小：14.8MB</span> \n</p>\n<p>\n	<a href=\"http://www.hbot.cn/uploadfile/hbot/Setup_XP(MD4.0).exe\">XP版下载</a> \n</p>\n<p>\n	真实客户端软件(win7版)<span style=\"font-size:14px;color:#666;\">版本：4.0.0.0 大小：4.62MB</span> \n</p>\n<p>\n	<a href=\"http://www.hbot.cn/uploadfile/hbot/Setup_Win7(MD4.0).exe\">win7版下载</a> \n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	软件部分界面截图：\n</p>\n<p style=\"text-align:center;text-indent:0px;\">\n	<img src=\"/images/articl/s1.jpg\" alt=\"软件欢迎页\" /><br />\n软件欢迎页<br />\n<img src=\"/images/articl/s2.jpg\" alt=\"软件分类选择\" /><br />\n软件分类选择<br />\n<img src=\"/d/file/download/soft/2014-03-13/52024a23522883aa81f98b04576257d6.jpg\" alt=\"adsw.jpg\" height=\"296\" width=\"664\" /><br />\n软件登录界面\n</p>', '', '', '鸿鑫御隆', '', '', '0', '0', '1395991920', '1400145015', '0', '0', '3', '1');
INSERT INTO `live_pages` VALUES ('106', '106', '中矿国际', '', '', '<p>\n	模拟客户端软件(xp版)&nbsp;<span style=\"font-size:14px;color:#666;\">版本：V3.4.0.2080 大小：13.0MB</span> \n</p>\n<p>\n	<a href=\"http://www.hbot.cn/uploadfile/hbot/Setup_XP(MD4.0)%20(moni).exe\">XP版下载</a> \n</p>\n<p>\n	模拟客户端软件(win7版) <span style=\"font-size:14px;color:#666;\">版本：4.0.0.0 &nbsp; &nbsp;大小： 4.6M &nbsp; &nbsp;适用系统：Vista/Win7/Win8</span> \n</p>\n<p>\n	<a href=\"http://www.hbot.cn/uploadfile/hbot/Setup_Win7(MD4.0)%20(moni).exe\">win7版下载</a> \n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	软件部分界面截图：\n</p>\n<p style=\"text-align:center;text-indent:0px;\">\n	<img src=\"/images/articl/s1.jpg\" alt=\"软件欢迎页\" /><br />\n软件欢迎页<br />\n<img src=\"/images/articl/s2.jpg\" alt=\"软件分类选择\" /><br />\n软件分类选择<br />\n<img src=\"/d/file/download/soft/2014-03-13/52024a23522883aa81f98b04576257d6.jpg\" alt=\"adsw.jpg\" height=\"296\" width=\"664\" /><br />\n软件登录界面\n</p>', '', '', '鸿鑫御隆 ', '', '', '0', '0', '1395991969', '1400145004', '0', '0', '2', '1');
INSERT INTO `live_pages` VALUES ('107', '106', '西部商品', '', '', '<h1 style=\"font-size:22px;font-family:\'microsoft yahei\';font-weight:normal;color:#CC0000;\">\n	<span style=\"font-size:large;\"><span style=\"color:#0000FF;\"><span style=\"line-height:28px;\">用微信\"扫一扫\"或专业二维码应用扫描下图，即可下载。</span></span></span> \n</h1>\n<h1 style=\"font-size:22px;font-family:\'microsoft yahei\';font-weight:normal;color:#CC0000;\">\n	<span style=\"font-size:smaller;\">贵金属通Android版下载</span> \n</h1>\n<p>\n	<img src=\"/d/file/download/soft/2014-03-03/6c9795613c875e18d07722ad142a99b3.jpg\" alt=\"android.jpg\" height=\"260\" width=\"260\" />&nbsp; &nbsp; &nbsp;&nbsp;<span style=\"color:#333333;font-family:\'microsoft yahei\';font-size:16px;line-height:28px;\">或点此</span><a href=\"http://42.120.23.200/soft/pmetong/guijinshutong.apk\"><span style=\"color:#FF0000;\"><strong>下载到电脑</strong></span></a><span style=\"color:#333333;font-family:\'microsoft yahei\';font-size:16px;line-height:28px;\">再从电脑中拷贝到手机中安装。</span> \n</p>\n<h1 style=\"font-size:22px;font-family:\'microsoft yahei\';font-weight:normal;color:#CC0000;\">\n	&nbsp;\n</h1>\n<h1 style=\"font-size:22px;font-family:\'microsoft yahei\';font-weight:normal;color:#CC0000;\">\n	<span style=\"font-size:smaller;\">贵金属通iphone版下载</span> \n</h1>\n<p>\n	<img alt=\"贵金属通winphone版下载\" src=\"/d/file/download/soft/2014-03-03/74d61c30be312895f50459a4487e3f30.jpg\" height=\"260\" width=\"260\" />&nbsp;&nbsp;<a href=\"https://itunes.apple.com/cn/app/gui-jin-shu-tong/id798532903?mt=8\" target=\"_blank\"><span style=\"color:#FF0000;\"><strong>查看下载地址</strong></span></a> \n</p>\n<p>\n	&nbsp;\n</p>\n<h1 style=\"font-size:22px;font-family:\'microsoft yahei\';font-weight:normal;color:#CC0000;\">\n	<span style=\"font-size:smaller;\">贵金属通winphone版下载</span> \n</h1>\n<p>\n	<img src=\"/d/file/download/soft/2014-03-04/c4a24f545768ebb6f7006e592c729fac.jpg\" alt=\"贵金属通winphone版客户端下载\" height=\"269\" width=\"269\" /><a href=\"http://www.windowsphone.com/zh-cn/store/app/%E8%B4%B5%E9%87%91%E5%B1%9E%E4%BA%A4%E6%98%93%E9%80%9A/1f3e05cd-c843-4366-aeec-abc7d2df4544\" target=\"_blank\"><span style=\"color:#FF0000;\"><strong>查看下载地址</strong></span></a> \n</p>\n<p>\n	&nbsp;\n</p>\n<h1 style=\"font-size:22px;font-family:\'microsoft yahei\';font-weight:normal;color:#CC0000;\">\n	<span style=\"font-size:smaller;\">贵金属通PC版</span> \n</h1>\n<h1 style=\"font-size:22px;font-family:\'microsoft yahei\';font-weight:normal;color:#CC0000;\">\n	<span style=\"color:#000000;\"><span style=\"font-size:large;\">（支持windows xp 、windows 7 、windows8等微软系统）</span></span><span style=\"font-size:large;\"> <a href=\"http://share.weiyun.com/261df8f09437204aa1e996e0a6df401d\"><span style=\"color:#FF0000;\">点击下载</span></a></span> \n</h1>\n<p>\n	&nbsp;\n</p>\n<p>\n	&nbsp;\n</p>\n<p>\n	&nbsp;\n</p>', '', '', '到底是谁', '', '', '0', '0', '1395992031', '1400144991', '0', '0', '1', '1');
INSERT INTO `live_pages` VALUES ('108', '110', '03月28日鸿鑫御隆早评', '', '', '周四国际货币基金组织(IMF)表示，已与乌克兰达成一笔140-180亿美元备用贷款协议，这项协议将在未来两年进一步释出信贷，使总额达到270亿美\n元。IMF声明称：“代表团已与乌克兰当局针对一项经济改革方案达成工作层级协议，改革方案可获得IMF一笔两年备用贷款协议支援。”IMF与乌克兰的贷\n款协议须获得IMF理事会批准。IMF驻乌克兰官员称，协议将开启针对乌克兰的270亿美元国际援助计划。该官员同时指出，乌克兰在IMF理事会批准贷款\n协议前须提前采取一些行动，包括将浮动汇率制制度化。乌克兰央行行长对此表示，IMF贷款协议所要求的改革可能是“痛苦的”。周四美国国会参众两院以压倒\n性多数的意见通过了一份决议，同意向乌克兰政府提供总额10亿美元的信贷担保援助措施，同时基于俄罗斯强行占领克里米亚的行动，对该国实施经济制裁措施。\n这份决议在参议院以口头表决形势全数通过，在众议院则以399票赞成对19票反对的悬殊比数过关，不过，参众两院表决通过的决议内容在细节上仍有差异，两\n院议员将在就此进行了进一步磋商之后将最终版本的决议交付总统奥巴马签署生效。<br />\n<br />\n技术面分析：<br />\n从日线走势来看BOLL开口向下延伸，且均线系统形成空头排列聚拢向下，加之MACD位于零轴下方运行，综合来看后期银价将继续看空，日内短周期从4小时图来看K线价格依旧处于下降通道中，以及心里指数走低，预计白天价格反弹受阻将有望再创新低。<br />\n<br />\n建议仅供参考，提醒广大投资者时刻注意账户风险率的变动，做好风险控制工作。', '', '', '鸿鑫御隆 ', '', '', '0', '0', '1395993846', '1395994828', '0', '0', '0', '1');
INSERT INTO `live_pages` VALUES ('109', '110', '03月27日鸿鑫御隆晚评', '', '', '消息面分析：<br />\n美国圣路易斯联储布拉德(James \nBullard)周四(3月27日)在香港表示，将通胀目标由2%调高至4%并不是好主意。经济方面，布拉德称，预计美国第一季GDP会走软，但料第二、\n第三及第四季将加速增长。货币方面，布拉德称，美元走强是货币政策的一个副作用。美国圣路易斯联储布拉德(James \nBullard)周四(3月27日)在香港表示，将通胀目标由2%调高至4%并不是好主意。经济方面，布拉德称，预计美国第一季GDP会走软，但料第二、\n第三及第四季将加速增长。货币方面，布拉德称，美元走强是货币政策的一个副作用。美国和欧盟周三(3月26日)同意，针对俄罗斯在乌克兰的所作所为，将通\n力合作准备对其实施更加严厉的经济制裁，包括能源领域；它们还将努力让欧洲减少对俄罗斯天然气的依赖。对于欧盟要求扩大美国对欧洲天然气出口以减少对俄罗\n斯供应的依赖，美国总统奥巴马表示，正在磋商中的跨大西洋贸易协定将使此类交易更容易获批。但他指出，欧洲也应该开发自己的能源资源——暗指页岩气提取和\n使用核能遭遇环境保护阻力，不要只是指望美国。欧盟驻华盛顿大使在工作午宴上向欧盟高层传达奥巴马的话称“你不能只是依赖其他国家的能源，即便要付出一些\n代价，面临下行风险”。<br />\n<br />\n技术面分析：<br />\n今日银价延续弱势走势，呈现出震荡下跌走势，并再度刷新几周新低，整体从日线均线系统来看空头向下排列，且BOLL有继续向下延伸趋势，综合来看白银后期\n将继续看空，日内短周期从4小时图来看K线价格沿着BOLL下轨向下运行，且KDJ死叉向下，预计晚间价格反弹无力将继续下探。<br />\n<br />\n建议仅供参考，提醒广大投资者时刻注意账户风险率的变动，做好风险控制工作。', '', '', '鸿鑫御隆 ', '', '', '0', '0', '1395993891', '1395994836', '0', '0', '0', '1');
INSERT INTO `live_pages` VALUES ('110', '112', '2014年03月28日白银重点关注经济数据', '', '', '15:00 德国 2月进口物价指数月率★★<br />\n15:45 法国 第四季度GDP终值年率★★★<br />\n17:30 英国 第四季度GDP终值年率★★★<br />\n18:00 欧元区 3月经济景气指数★★★★<br />\n20:30 美国 2月个人收入月率★★★★<br />\n20:30 美国 2月核心PCE物价指数年率★★★★<br />\n21:00 德国 3月CPI初值年率★★★★<br />\n21:55 美国 3月密歇根大学消费者信心指数终值★★★<br />\n22:30 美国 3月21日当周ECRI领先指标★★', '', '', '鸿鑫御隆 ', '', '', '0', '0', '1395993936', '0', '0', '0', '0', '1');
INSERT INTO `live_pages` VALUES ('111', '112', '2014年03月27日白银重点关注经济数据', '', '', '15:45 法国 3月消费者综合信心指数★★<br />\n17:00 意大利 3月Istat商业信心指数★★<br />\n20:30 美国 3月22日当周初请失业金人数(万)★★★★<br />\n20:30 美国 第四季度实际GDP终值年化季率★★★★<br />\n22:00 美国 2月成屋签约销售指数月率★★', '', '', '鸿鑫御隆 ', '', '', '0', '0', '1395993963', '0', '0', '0', '0', '1');
INSERT INTO `live_pages` VALUES ('112', '112', '2014年03月26日白银重点关注经济数据', '', '', '15:00 德国 4月Gfk消费者信心指数★★★<br />\n15:00 德国 2月实际零售销售月率(3/26-3/31)★★★<br />\n15:00 英国 3月Nationwide房价指数月率(3/26-4/6)★★★<br />\n19:00 美国 3月21日当周MBA抵押贷款申请活动指数★★<br />\n20:30 美国 2月耐用品订单月率★★★<br />\n21:45 美国 3月Markit服务业PMI初值★★<br />\n22:30 美国 3月22日当周EIA原油库存', '', '', '鸿鑫御隆 ', '', '', '0', '0', '1395993991', '1397099045', '0', '0', '0', '1');
INSERT INTO `live_pages` VALUES ('113', '111', '3月28日白银ETF持仓量持平10164.74吨', '', '', '\n	<p>\n		<strong>3月28日讯</strong>——ETF数据中心显示，截至周五（3月28日），美国iShares Silver Trust（SLV）公司的ETF白银净持仓持平10164.74吨。\n	</p>\n	<p>\n		据统计，iShares Silver Trust（SLV）公司的白银ETF净持仓总量为326803953.40盎司，价值6911520858美元。\n	</p>\n	<div>\n		&nbsp;\n	</div>\n	<div class=\"ef_c\">\n		<ul>\n			<li class=\"tit\">\n				更新时间（北京）\n			</li>\n			<li class=\"tit\">\n				净持仓量（盎司）\n			</li>\n			<li class=\"tit\">\n				净持仓量（吨）\n			</li>\n			<li class=\"tit\">\n				总价值（美元）\n			</li>\n			<li class=\"tit last\">\n				增减（吨）\n			</li>\n			<li>\n				2014-3-28\n			</li>\n			<li>\n				326803953.40\n			</li>\n			<li>\n				10164.74\n			</li>\n			<li>\n				6911520858\n			</li>\n			<li class=\"last\">\n				0.00\n			</li>\n		</ul>\n	</div>\n</div>', '', '', '鸿鑫御隆 ', '', '', '0', '0', '1395994029', '1395994634', '0', '0', '0', '1');
INSERT INTO `live_pages` VALUES ('117', '117', '联系我们', '', '', '<p class=\"jyh\">\n	<strong>浙江鸿鑫御隆商品经营有限公司</strong>\n</p>\n<p>\n	<strong>客服热线：</strong>400-823-8000（周一至周五9:00-23:00）\n</p>\n<p class=\"addr\">\n	<strong>总部公司地址：</strong>浙江杭州市西湖区文三路121号\n</p>\n<p class=\"fenbu\">\n	<strong>分部运营中心：</strong>江西南昌红谷滩新区汉港凯旋中心第8层\n</p>\n<p class=\"email\">\n	<strong>E-mail：<a href=\"mailto:kefu@hongxinpme.com\">kefu@hongxinpme.com</a></strong>\n</p>', '', '', '', '', '', '0', '0', '1395996459', '0', '0', '0', '1', '1');
INSERT INTO `live_pages` VALUES ('118', '117', '诚聘英才', '', '', '<h3>\n	营销开发专员\n</h3>\n<p>\n	招聘人数： 4 <br />\n<strong>岗位职责：</strong><br />\n1、监听前端销售人员营销电话录音，分析销售员营销意识和销售技巧，撰写分析报告；<br />\n2、帮助前端销售人员撰写销售话术；<br />\n3、收集并整理公司销售部门各项业务数据，挖掘相关营销素材；<br />\n4、负责与公司销售部门进行业务对接，提升公司业务开发率。<br />\n<strong>任职要求：</strong><br />\n1、大专及以上学历；（市场营销相关专业，1年以上销售股票软件、保险等电话销售经验者优先考虑）<br />\n2、具有创新意识，并能积极提出营销开发创新性建议者优先考虑；<br />\n3、性格开朗，有较强的应变能力，善于沟通，团队协作能力较强者优先考虑；<br />\n4、熟练运用WORD/EXCEL/PPT等各类文字处理与排版软件。\n</p>\n<h3>\n	高级人力资源经理\n</h3>\n<p>\n	招聘人数：1 <br />\n<strong>岗位职责：</strong> <br />\n1、协助公司领导制定公司人力资源整体战略规划，并推动实施，确保人力资源满足公司业务发展需求；<br />\n2、组织制定及完善人力资源管理体系，具体负责招聘、培训、绩效、薪酬福利、激励与约束及员工发展等体系的全面建设并推动实施；<br />\n3、向公司决策层提供人力资源、组织机构等方面的建议，提供关于人力资源方面的专题报告或建议，控制人力资源成本； <br />\n5、根据公司发展变化情况，提出公司各业务系统组织结构、职位设置的调整建议；<br />\n6、建议高层管理人员、核心人员的聘用、调配、解聘、职位等级和报酬待遇；审核其他员工的聘用、调配、解聘决定和职位等级、报酬待遇的确定及调整；<br />\n7、执行人力资源管理各项实务的操作流程和各类规章制度的实施，配合其他部门工作；<br />\n8、参与制订公司企业文化的推进计划的制度、实施等相关工作，确保推进计划与企业核心价值观的一致性；<br />\n<strong>任职要求：</strong><br />\n1、全日制本科及以上学历，人力资源管理、企业管理、心理学、法学、中文系或相关专业；<br />\n2、年龄要求在28-40周岁；<br />\n3、6年以上大型集团企业人力资源管理工作经验，其中3年以上大中型集团企业人力资源管理高级岗位（人资经理及以上职位）工作经验； <br />\n4、对现代企业人力资源管理模式及人力资源管理各个模块均有着系统、深入的理解和较为丰富的实践经验； <br />\n5、熟悉国家、地区及企业关于合同管理、薪金制度、用人机制、保险福利待遇和培训方针<br />\n6、具有创新性的人力资源管理思维，有强烈的责任心、事业心，具备良好的职业操守，忠实维护公司利益，严守公司商业秘密； <br />\n7、有良好的决策能力、沟通协调能力、团队合作能力、培养辅导能力等，善于组织顺畅的沟通渠道，营造融洽的工作氛围；<br />\n8、具有战略、策略化思维，有能力建立、整合不同的工作团队；<br />\n9、具有人力资源国家级二级及以上资质。<br />\n&nbsp;\n</p>\n<h3>\n	高级营销策划经理\n</h3>\n<p>\n	招聘人数：1 <br />\n<strong>岗位职责：</strong> <br />\n1、负责企业产品营销推广的制定及执行；充分掌握客户需求点，建立有价值的营销策划理念。 <br />\n2、负责独立完成营销推广，市场策划案及组织完成各类媒体，市场活动； <br />\n3、开拓多媒体资源（包括但不限于电视，网络，广播），负责与各平面媒体进行广告合作的谈判与执行； <br />\n4、负责各产品平面广告投放的执行管理，广告投放效果分析及改进； <br />\n5、加强品牌形象宣传、管理、制定媒体宣传终端形象规范系统； <br />\n6、密切关注市场动态，对行业及媒体情况进行研究、分析。 <br />\n<strong>任职要求：</strong><br />\n1、本科以上学历，4年以上大型公司从事市场营销策划、推广工作经验，有丰富的线上、线下媒介资源，具备良好的人际关系；金融行业优先。<br />\n2、具有优秀的项目管理、沟通协调和领导能力，承压能力强，优秀的谈判能力；<br />\n3、文笔流畅，有良好的文字驾驭能力，语言表达清晰，有较强策划能力。\n</p>\n<h3>\n	助理分析师\n</h3>\n<p>\n	招聘人数：1 <br />\n<strong>岗位职责：</strong> <br />\n1、负责日常相关PPT的制作、数据统计； <br />\n2、负责客户素材整理、产品的跟踪，成功案例； <br />\n3、工作流程梳理、报告会主持等； <br />\n<strong>任职要求：</strong><br />\n1、本科及以上学历，金融类专业；<br />\n2、2年及以上相关工作经验，具备一定的证券、贵金属分析基础；<br />\n3、善于文案书写，具备一定的营销基础；<br />\n4、细心敏锐，善于发现与学习，善于与人沟通，富有责任感。\n</p>', '', '', '', '', '', '0', '0', '1395996495', '1400145205', '0', '0', '2', '1');
INSERT INTO `live_pages` VALUES ('127', '147', '青海铭爵', '', '', '<table class=\"tbvvv\" border=\"1\" cellpadding=\"10\" cellspacing=\"0\" width=\"708\">\n	<tbody>\n		<tr>\n			<td class=\"style1\" bgcolor=\"#fdf5eb\" height=\"22\" width=\"25%\">\n				产品规格\n			</td>\n			<td align=\"left\">\n				5公斤、25公斤、50公斤、100公斤\n			</td>\n		</tr>\n		<tr>\n			<td class=\"style1\" bgcolor=\"#fdf5eb\" height=\"22\">\n				杠杆\n			</td>\n			<td align=\"left\">\n				50倍\n			</td>\n		</tr>\n		<tr>\n			<td class=\"style1\" bgcolor=\"#fdf5eb\" height=\"22\">\n				保证金\n			</td>\n			<td align=\"left\">\n				市价2%\n                                (如做多1手5公斤然后平仓，买入价6500元/公斤，应付保证金6500元*5*2%=650元)\n			</td>\n		</tr>\n		<tr>\n			<td class=\"style1\" bgcolor=\"#fdf5eb\" height=\"22\">\n				手续费\n			</td>\n			<td align=\"left\">\n				开仓时收取手续费4元/公斤,平仓不收手续费<br />\n			</td>\n		</tr>\n		<tr>\n			<td class=\"style1\" bgcolor=\"#fdf5eb\" height=\"22\">\n				单笔最大交易限额\n			</td>\n			<td align=\"left\">\n				10手\n			</td>\n		</tr>\n		<tr>\n			<td class=\"style1\" bgcolor=\"#fdf5eb\" height=\"22\">\n				最大持仓量\n			</td>\n			<td align=\"left\">\n				60手\n			</td>\n		</tr>\n		<tr>\n			<td class=\"style1\" bgcolor=\"#fdf5eb\" height=\"22\">\n				点差\n			</td>\n			<td align=\"left\">\n				开仓时收取点差4元/公斤,平仓时不收点差\n			</td>\n		</tr>\n		<tr>\n			<td class=\"style1\" bgcolor=\"#fdf5eb\" height=\"22\">\n				滑点\n			</td>\n			<td align=\"left\">\n				无滑点\n			</td>\n		</tr>\n		<tr>\n			<td class=\"style1\" bgcolor=\"#fdf5eb\" height=\"22\">\n				隔夜费\n			</td>\n			<td align=\"left\">\n				0.5元/公斤，每天结算时间收取\n			</td>\n		</tr>\n		<tr>\n			<td class=\"style1\" bgcolor=\"#fdf5eb\" height=\"22\">\n				出入金\n			</td>\n			<td align=\"left\">\n				入金：交易日24小时入金(凌晨4点-6点为结算时间，尽量避开)，入金不收费<br />\n出金：交易日早9：00到晚上17：00，出金不收费\n			</td>\n		</tr>\n		<tr>\n			<td class=\"style1\" bgcolor=\"#fdf5eb\" height=\"22\">\n				交易时间\n			</td>\n			<td align=\"left\">\n				周一早8：00至周六早4：00（结算时间、国际市场休息除外）&nbsp;。夏令时、冬令时调整会提前通知。\n			</td>\n		</tr>\n		<tr>\n			<td class=\"style1\" bgcolor=\"#fdf5eb\" height=\"22\">\n				结算时间\n			</td>\n			<td align=\"left\">\n				早4：00-6：00\n			</td>\n		</tr>\n		<tr>\n			<td class=\"style1\" bgcolor=\"#fdf5eb\" height=\"22\">\n				存管银行\n			</td>\n			<td align=\"left\">\n				工商银行<br />\n资金由第三方存管，秒进秒出\n			</td>\n		</tr>\n		<tr>\n			<td class=\"style1\" bgcolor=\"#fdf5eb\" height=\"22\">\n				优势\n			</td>\n			<td align=\"left\">\n				1、盘面稳定，国际同步，不卡盘，不滑点<br />\n2、手续费低，保证金低、规格多样，选择多,8个点保本<br />\n3、资金安全，出入金秒进秒出，无开户门槛限制<br />\n4、支持安卓、苹果手机交易<br />\n5、通过青海省金融办备案，材料已随青海省关于38号文的整顿结果一起上报国务院，已完全具备金融市场合法合规的交易运营资质，并对我们的运营进行监管\n			</td>\n		</tr>\n	</tbody>\n</table>', '', null, '', '', '', '0', '0', '1400466094', '1400466344', '0', '0', '0', '1');
INSERT INTO `live_pages` VALUES ('123', '100', '关于我们', '', '关于我们', '关于我们', '', null, '', '', '', '0', '0', '1400142190', '0', '0', '0', '0', '1');
INSERT INTO `live_pages` VALUES ('128', '159', '预约一下', '', '', '<script type=\"text/javascript\">\n$(document).ready(function(){\n$(\"#refresh\").click(function(){\n		$(\"#imgyzm\").attr(\'src\', \'../../../index.php/code/create_vcode\' + \'/\' + Math.random());\n});\n});\nfunction userform_sub()\n{\n	postdata(\"userform\", \"../../../index.php/service/reserver\", \'show\');\n}\n</script>\n<p>\n	<span style=\"color:#666666;\">&nbsp;预约VIP，尊享专属一站式服务，还有高级分析师、专业客服上门为您全程答疑解惑！诚信、专业、安全、细致，独到的投资眼光、一流的贴心服务，尽在丰融投资！请您填写预约开户表格，我们将在第一时间与您联系！</span> \n</p>\n<form id=\"userform\">\n	<table class=\"ke-zeroborder\" style=\"border-collapse:collapse;color:#666666;\" align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"12\" width=\"730\">\n		<tbody>\n			<tr>\n				<td align=\"right\" valign=\"middle\">\n					您 &nbsp;的&nbsp; 姓&nbsp; 名：\n				</td>\n				<td class=\"red\">\n					&nbsp;<input name=\"name\" type=\"text\" /><span style=\"color:red;\">&nbsp;*&nbsp;</span> \n				</td>\n			</tr>\n			<tr>\n				<td align=\"right\" valign=\"middle\">\n					联&nbsp; 络 &nbsp;电 &nbsp;话：\n				</td>\n				<td class=\"red\">\n					&nbsp;<input name=\"phone\" type=\"text\" /><span style=\"color:red;\">&nbsp;*&nbsp;</span> \n				</td>\n			</tr>\n			<tr>\n				<td align=\"right\" valign=\"middle\">\n					身&nbsp; 份 &nbsp;证 &nbsp;号：\n				</td>\n				<td class=\"red\">\n					&nbsp;<input name=\"cardnumber\" type=\"text\" /><span style=\"color:red;\">&nbsp;*&nbsp;</span> \n				</td>\n			</tr>\n			<tr>\n				<td align=\"right\" valign=\"middle\">\n					邮&nbsp; 箱 &nbsp;地&nbsp; 址：\n				</td>\n				<td class=\"red\">\n					&nbsp;<input name=\"email\" type=\"text\" /><span style=\"color:red;\">&nbsp;*&nbsp;</span> \n				</td>\n			</tr>\n			<tr>\n				<td align=\"right\" valign=\"middle\">\n					联&nbsp; 络 &nbsp;地&nbsp; 址：\n				</td>\n				<td class=\"red\">\n					&nbsp;<input name=\"address\" type=\"text\" /> \n				</td>\n			</tr>\n			<tr>\n				<td align=\"right\">\n					客 &nbsp;户 &nbsp;留&nbsp; 言：\n				</td>\n				<td class=\"red\">\n					&nbsp;<input name=\"message\" type=\"text\" /> \n				</td>\n			</tr>\n			<tr>\n				<td align=\"right\" valign=\"middle\">\n					预估注册金额：\n				</td>\n				<td class=\"red\">\n					&nbsp;<input name=\"regmoney\" type=\"text\" /> \n				</td>\n			</tr>\n			<tr>\n				<td align=\"right\" valign=\"middle\">\n					上门服务时间：\n				</td>\n				<td class=\"red\">\n					&nbsp;<input name=\"servertime\" type=\"text\" /> \n				</td>\n			</tr>\n			<tr>\n				<td align=\"right\">\n					输 入 验 证 码：\n				</td>\n				<td class=\"red\">\n					&nbsp;<input name=\"yzm\" maxlength=\"4\" type=\"text\" /><a id=\"refresh\" href=\"###\"><img src=\"../../../index.php/code/create_vcode\" id=\"imgyzm\" align=\"点击刷新验证码\" height=\"20\" width=\"88\" /> </a> <span style=\"color:red;\">&nbsp;*&nbsp;</span> \n				</td>\n			</tr>\n			<tr>\n				<td align=\"right\">\n					&nbsp;\n				</td>\n				<td valign=\"middle\">\n					<input value=\"确认预约\" onclick=\"userform_sub()\" type=\"button\" /> \n				</td>\n			</tr>\n		</tbody>\n	</table>\n</form>\n<p>\n	<span style=\"color:#666666;\"></span> \n</p>', '', null, '', '', '', '0', '0', '1400573127', '1400582774', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `live_role`
-- ----------------------------
DROP TABLE IF EXISTS `live_role`;
CREATE TABLE `live_role` (
  `role_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `role_name` varchar(60) NOT NULL DEFAULT '',
  `action_list` text NOT NULL,
  `role_describe` text,
  PRIMARY KEY (`role_id`),
  KEY `user_name` (`role_name`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_role
-- ----------------------------
INSERT INTO `live_role` VALUES ('11', '直播室管理员', 'live_room,chat_content,user', '');
INSERT INTO `live_role` VALUES ('12', '刘经理', '', '');

-- ----------------------------
-- Table structure for `live_service_reserver`
-- ----------------------------
DROP TABLE IF EXISTS `live_service_reserver`;
CREATE TABLE `live_service_reserver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `cardnumber` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `regmoney` int(11) DEFAULT NULL,
  `servertime` varchar(30) DEFAULT NULL COMMENT '在线预约',
  `message` text,
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_service_reserver
-- ----------------------------
INSERT INTO `live_service_reserver` VALUES ('3', 'dgt1981', '15057489802', '123456789123456', 'test_1@yuyaoit.cn', '联  络  地  址', '100', '上午8点', '客  户  留  言', '1400589653');

-- ----------------------------
-- Table structure for `live_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `live_system_config`;
CREATE TABLE `live_system_config` (
  `confid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `confkey` varchar(30) NOT NULL,
  `confval` mediumtext,
  `confnote` varchar(100) DEFAULT NULL,
  `memo` varchar(200) DEFAULT NULL,
  `fieldtype` varchar(255) DEFAULT 'text' COMMENT '字段类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序,按数字大小排序',
  `mtime` int(11) NOT NULL,
  `ctime` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `cfgcate` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`confid`),
  UNIQUE KEY `base_id` (`confid`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_system_config
-- ----------------------------
INSERT INTO `live_system_config` VALUES ('6', 'isaudit', '1', '互动是否需要审核', null, 'radio', null, '1434505682', '1368670376', '1', '2');
INSERT INTO `live_system_config` VALUES ('35', 'word_filter', 'fuck\n电话\n贱人\n妈的\n傻逼', '设置敏感词过滤<br/>(每行一个规则)', null, 'textarea', null, '1434505682', null, '1', '2');
INSERT INTO `live_system_config` VALUES ('36', 'checkmobile', '0', '是否开启手机短信验证', '如开启需要有短信接口支持', 'radio', null, '1399943436', null, '2', '1');
INSERT INTO `live_system_config` VALUES ('37', 'tpl', 'themes/v2/', '前台模版路径设置', '', 'text', '-1', '1400044299', null, '2', '2');
INSERT INTO `live_system_config` VALUES ('38', 'tpl_admin', 'themes/admin/', '后台模版路径设置', '', 'text', '-2', '1400044299', null, '2', '2');
INSERT INTO `live_system_config` VALUES ('39', 'comm', 'themes/comm/', '公共调用资源路径设置', '', 'text', '-3', '1400044299', null, '2', '2');
INSERT INTO `live_system_config` VALUES ('40', 'site_title', '诺云财经直播室V2.6版本', '网站名称', '', 'text', null, '1437976691', null, '1', '1');
INSERT INTO `live_system_config` VALUES ('41', 'site_keywords', '诺云直播室,喊单系统,外汇喊单,黄金喊单,白银喊单', '网站关键字', '', 'text', null, '1437976691', null, '1', '1');
INSERT INTO `live_system_config` VALUES ('42', 'site_desc', '诺云财经直播室', '网站描述', '', 'textarea', null, '1437976691', null, '1', '1');
INSERT INTO `live_system_config` VALUES ('43', 'site_copyright', '诺云财经直播室版权所有', '版权及备案信息', '', 'textarea', null, '1437976691', null, '1', '1');
INSERT INTO `live_system_config` VALUES ('44', 'vercode_adminlogin', '0', '后台登录是否开启验证码', '', 'checkbox', null, '1375406072', null, '2', '2');
INSERT INTO `live_system_config` VALUES ('45', 'imgthumb', 'upload/pages/20150727/5105601c14040399b5f4fa3b223ca369.png', '网站logo', '', 'img', null, '1437976691', null, '1', '1');
INSERT INTO `live_system_config` VALUES ('46', 'companyname', '这里是公司名称', '公司名称', '', 'text', null, '1373960682', null, '2', '1');
INSERT INTO `live_system_config` VALUES ('51', 'article_thumb_width', '200', '资讯缩略图宽', '', 'text', null, '1400744078', null, '2', '2');
INSERT INTO `live_system_config` VALUES ('52', 'article_thumb_height', '200', '资讯缩略图长', '', 'text', null, '1400744078', null, '2', '2');
INSERT INTO `live_system_config` VALUES ('53', 'make_thumb', '1', '上传图片是否生成缩略图', null, 'radio', null, '1400744078', null, '2', '2');
INSERT INTO `live_system_config` VALUES ('54', 'visitor_access', '1', '允许游客进入直播室', null, 'radio', null, '1400044299', null, '2', '1');
INSERT INTO `live_system_config` VALUES ('55', 'allow_qqlogin', '1', '允许腾讯微博快捷登录', null, 'radio', null, '1395811773', null, '2', '1');
INSERT INTO `live_system_config` VALUES ('56', 'allow_swlogin', '1', '允许新浪微博快捷登录', null, 'radio', null, '1395811773', null, '2', '1');
INSERT INTO `live_system_config` VALUES ('57', 'yy_channel', '39861788', '输入YY频道ID', null, 'text', null, '1437976691', null, '1', '1');
INSERT INTO `live_system_config` VALUES ('58', 'yy_subchannel', '39861788', '输入YY子频道ID', null, 'text', null, '1437976691', null, '1', '1');
INSERT INTO `live_system_config` VALUES ('59', 'video_src', 'http://player.youku.com/player.php/sid/XNjkyNDcxMjAw/v.swf', '输入视频链接（flash地址）', null, 'text', null, '1401864410', null, '2', '1');
INSERT INTO `live_system_config` VALUES ('60', 'visitor_active', '1', '允许游客聊天互动', null, 'radio', null, '1434505682', null, '1', '2');
INSERT INTO `live_system_config` VALUES ('61', 'smtp_server', 'smtp.126.com', '系统消息SMTP服务器', '', 'text', null, '1399943430', null, '2', '3');
INSERT INTO `live_system_config` VALUES ('62', 'smtp_username', 'eyoung_info@126.com', '系统消息SMTP帐号', '', 'text', null, '1399943430', null, '2', '3');
INSERT INTO `live_system_config` VALUES ('63', 'smtp_passwd', 'meiyoumima', '系统消息SMTP密码', '', 'text', null, '1399943430', null, '2', '3');
INSERT INTO `live_system_config` VALUES ('64', 'smtp_port', '25', '系统消息SMTP端口号', null, 'text', null, '1399943430', null, '1', '3');
INSERT INTO `live_system_config` VALUES ('65', 'status_offline_time', '20', '设置用户离线时间（秒）', null, 'text', null, '1434505682', null, '1', '2');
INSERT INTO `live_system_config` VALUES ('66', 'status_saystop_time', '600', '设置用户禁言时间（秒）', null, 'text', null, '1434505682', null, '1', '2');
INSERT INTO `live_system_config` VALUES ('67', 'status_roomout_time', '3600', '设置用户踢出生效时间（秒）', null, 'text', null, '1434505682', null, '1', '2');
INSERT INTO `live_system_config` VALUES ('68', 'open_vote', '1', '是否开启投票功能', null, 'radio', null, '1405927272', null, '2', '2');
INSERT INTO `live_system_config` VALUES ('69', 'visitor_question', '1', '是否允许游客提问', null, 'radio', null, '1405927272', null, '2', '2');
INSERT INTO `live_system_config` VALUES ('71', 'site_reg_vcode', '1', '开启注册验证码', null, 'radio', null, '1405927272', null, '2', '2');
INSERT INTO `live_system_config` VALUES ('72', 'site_count_code', '', '网站统计代码', null, 'textarea', '100', '1434505682', null, '1', '2');
INSERT INTO `live_system_config` VALUES ('73', 'site_complaint_qq', '76314154', '投诉建议QQ', null, 'text', null, '1437976691', null, '1', '1');
INSERT INTO `live_system_config` VALUES ('74', 'site_customer_qq', '76314154', '在线客服QQ', null, 'text', null, '1437976691', null, '1', '1');
INSERT INTO `live_system_config` VALUES ('75', 'site_customer_weixin', 'themes/images/public/qq/wx.jpg', '官方微信二维码地址', null, 'text', null, '1401864410', null, '2', '1');
INSERT INTO `live_system_config` VALUES ('76', 'site_customer_phone', '400-888-888', '在线客服电话', null, 'text', null, '1401864410', null, '2', '1');
INSERT INTO `live_system_config` VALUES ('77', 'visitor_viewlive', '1', '游客是否可见直播内容', null, 'radio', null, '1405927272', null, '2', '2');
INSERT INTO `live_system_config` VALUES ('78', 'visitor_viewqa', '1', '游客是否可见播主问答', null, 'radio', null, '1405927272', null, '2', '2');
INSERT INTO `live_system_config` VALUES ('79', 'visitor_vote', '1', '允许游客投票', null, 'radio', null, '1434505682', null, '1', '2');
INSERT INTO `live_system_config` VALUES ('80', 'site_help', 'http://www.yuyaoit.cn/news/detail/172', '在线帮忙手册', null, 'text', null, '0', null, '2', '2');
INSERT INTO `live_system_config` VALUES ('81', 'open_camera_model', '0', '开启第三方直播调用模式', '开启后YY模式将被关闭', 'radio', null, '1437976691', null, '1', '1');
INSERT INTO `live_system_config` VALUES ('82', 'thirdparty_url_live', 'http://219.239.223.158:81/camera.html', '第三方直播地址调用', '开启第三方直播调用后有效', 'text', null, '1437976691', null, '1', '1');
INSERT INTO `live_system_config` VALUES ('83', 'thirdparty_url_player', 'http://219.239.223.158:81/liveplayer.html', '第三方视频观看地址调用', '开启第三方直播调用后有效', 'text', null, '1437976691', null, '1', '1');
INSERT INTO `live_system_config` VALUES ('84', 'open_roomkey', '0', '是否开启房间密码认证', null, 'radio', null, '1434505682', null, '1', '2');

-- ----------------------------
-- Table structure for `live_userinfo_base`
-- ----------------------------
DROP TABLE IF EXISTS `live_userinfo_base`;
CREATE TABLE `live_userinfo_base` (
  `userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `passwd` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `imgthumb` varchar(100) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthday` varchar(10) DEFAULT NULL,
  `age` varchar(10) DEFAULT NULL,
  `stockage` tinyint(4) DEFAULT NULL,
  `homepage` varchar(50) DEFAULT NULL,
  `gender` varchar(1) DEFAULT '0',
  `usertype` smallint(6) DEFAULT NULL,
  `kind` varchar(1000) DEFAULT NULL COMMENT 'VIP权限记录缓存',
  `userinfo` tinytext,
  `regtime` int(11) DEFAULT NULL,
  `regip` int(11) DEFAULT NULL,
  `level` tinyint(4) DEFAULT '0' COMMENT '会员等级：0:普通用户，1：为VIP',
  `ismaster` tinyint(4) DEFAULT NULL COMMENT '是否为播主',
  `status` smallint(6) DEFAULT '1',
  `ctime` int(11) DEFAULT NULL,
  `mtime` int(11) DEFAULT NULL,
  `approomvip` int(11) DEFAULT '0' COMMENT '为要申请VIP的直播室ID',
  `appstatus` tinyint(4) DEFAULT '0' COMMENT '0为未申请，1为申请',
  `recomm_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_userinfo_base
-- ----------------------------
INSERT INTO `live_userinfo_base` VALUES ('94', '李放放', 'c5059fc090d73ae343983849f671a4d7', '沐浴春风', null, '422554023@qq.con', '422554023', '13803457479', null, null, null, null, '0', null, null, null, null, '-1212558229', '0', null, '1', '1433216172', null, '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('89', '1234567', 'e10adc3949ba59abbe56e057f20f883e', '笑看人生', null, '1129448428@qq.com', '1129448428', '13671031523', null, null, null, null, '1', null, 'a:1:{i:0;s:2:\"26\";}', null, null, '-1212558229', '7', '0', '1', '1433213919', '1433214045', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('93', 'dongzheng', 'e10adc3949ba59abbe56e057f20f883e', '风轻云淡', null, '1126526349@qq.com', '1126526349', '13632609159', null, null, null, null, '1', null, null, null, null, '-1212558229', '1', null, '1', '1433215811', '1433216792', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('116', '13671031523', 'e10adc3949ba59abbe56e057f20f883e', '戈壁', null, '1031325450@qq.com', '1031325450', '13671031523', null, null, null, null, '0', null, null, null, null, '-1212668563', '5', null, '1', '1433754955', '1433754973', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('91', '12345', 'e10adc3949ba59abbe56e057f20f883e', '老张', null, '2232932372@qq.com', '2232932372', '13994839710', null, null, null, null, '0', null, null, null, null, '-1212558229', '3', null, '1', '1433214389', '1433820964', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('92', '750197119', 'e10adc3949ba59abbe56e057f20f883e', '刘经理', null, '750197119@qq.com', '750197119', '13671031523', null, null, null, null, '1', null, 'a:1:{i:0;s:2:\"26\";}', null, null, '-1212558229', '0', '26', '1', '1433214849', '1433754788', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('98', 'zhangyong', 'e10adc3949ba59abbe56e057f20f883e', '蓝色电极', null, '9587973@qq.com', '9587973', '13361581619', null, null, null, null, '0', null, null, null, null, '-1212558229', '1', null, '1', '1433216655', '1433216775', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('118', '2892756771', 'e10adc3949ba59abbe56e057f20f883e', '泰世通 — 贾经理', null, '2892756771@qq.com', '2892756771', '13671031523', null, null, null, null, '0', null, 'a:1:{i:0;s:2:\"26\";}', null, null, '-573750485', '1', '26', '1', '1433813246', '1433822240', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('97', '李放放2', 'c5059fc090d73ae343983849f671a4d7', '后会无期', null, '3191314766@qq.com', '3191314766', '13803457479', null, null, null, null, '0', null, null, null, null, '-1212558229', '0', null, '1', '1433216483', null, '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('99', 'wangwei', 'e10adc3949ba59abbe56e057f20f883e', '一方寸土', null, '1445055878@qq.com', '1445055878', '15513804892', null, null, null, null, '0', null, null, null, null, '-1212558229', '2', null, '1', '1433216914', '1433297386', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('100', 'weiyun', 'e10adc3949ba59abbe56e057f20f883e', '微云', null, '2738731919@qq.com', '2738731919', '15513804892', null, null, null, null, '0', null, null, null, null, '-1212558229', '0', null, '1', '1433217142', '1433297439', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('101', '18005625966', 'e10adc3949ba59abbe56e057f20f883e', '游泳儿', null, '494370750@qq.com', '494370750', '18005625966', null, null, null, null, '0', null, null, null, null, '-1212558229', '3', null, '1', '1433217370', '1433217396', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('102', '13911644336', 'e10adc3949ba59abbe56e057f20f883e', '老三', null, '383673678@qq.com', '383673678', '13911644336', null, null, null, null, '0', null, null, null, null, '-1212558229', '6', null, '1', '1433217501', '1433217514', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('103', '13506480668', 'e10adc3949ba59abbe56e057f20f883e', '东子', null, '1466295538@qq.com', '1466295538', '13506480668', null, null, null, null, '0', null, null, null, null, '-1212558229', '5', null, '1', '1433217613', '1433217628', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('104', '18635612238', 'e10adc3949ba59abbe56e057f20f883e', 'Perdre tou', null, '746034282@qq.com', '746034282', '18635612238', null, null, null, null, '0', null, null, null, null, '-1212558229', '3', null, '1', '1433217794', '1433217810', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('105', '13292715555', 'e10adc3949ba59abbe56e057f20f883e', '黑色时代', null, '1004047905@qq.com', '1004047905', '13292715555', null, null, null, null, '0', null, null, null, null, '-1212558229', '3', null, '1', '1433217926', '1433217941', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('106', 'liuruncheng', 'e10adc3949ba59abbe56e057f20f883e', '淡蓝色的烟', null, '2498496617@qq.com', '2498496617', '13427501428', null, null, null, null, '0', null, null, null, null, '-1212558229', '0', null, '1', '1433229818', null, '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('107', 'cuijiliang', 'e10adc3949ba59abbe56e057f20f883e', '崔纪良', null, '470065563@qq.com', '470065563', '18035631088', null, null, null, null, '1', null, null, null, null, '-1212558229', '2', null, '1', '1433235475', '1433239903', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('108', 'anjie', 'e10adc3949ba59abbe56e057f20f883e', '金喜', null, '461948507@qq.com', '461948507', '15003431928', null, null, null, null, '0', null, null, null, null, '-1212558229', '3', null, '1', '1433235619', '1433239925', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('109', 'wenjidong', 'e10adc3949ba59abbe56e057f20f883e', '金丰', null, '526453688@qq.com', '526453688', '13803431069', null, null, null, null, '0', null, null, null, null, '-1212558229', '1', null, '1', '1433235842', '1433239937', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('110', 'zhangweifang', 'e10adc3949ba59abbe56e057f20f883e', '7012', null, '466967394@qq.com', '466967394', '15234601633', null, null, null, null, '0', null, null, null, null, '-1212558229', '1', null, '1', '1433239296', '1433239958', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('111', 'gaoxinping', 'e10adc3949ba59abbe56e057f20f883e', '大贵', null, '1527514350@qq.com', '1527514350', '18503515215', null, null, null, null, '0', null, null, null, null, '-1212558229', '6', null, '1', '1433239518', '1433239970', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('112', 'zhangwei', 'e10adc3949ba59abbe56e057f20f883e', '蔷薇', null, '354130765@qq.com', '354130765', '13613483842', null, null, null, null, '0', null, null, null, null, '-1212558229', '1', null, '1', '1433239647', '1433239978', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('113', '1129973911', 'c2856731b92b20c050459031941e4a22', '小财迷', null, '1129973911@qq.com', '1129973911', '18651236543', null, null, null, null, '0', null, null, null, null, '-573738786', '0', null, '1', '1433298756', null, '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('114', 'xufujun', 'e10adc3949ba59abbe56e057f20f883e', '舵主', null, '2623925297@qq.com', '2623925297', '15234175306', null, null, null, null, '0', null, 'a:1:{i:0;s:2:\"26\";}', null, null, '-573738786', '0', '26', '1', '1433302354', '1433819818', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('115', '13292128950', 'e10adc3949ba59abbe56e057f20f883e', '绝对值', null, '1149141680@qq.com', '11491416080', '13292128950', null, null, null, null, '0', null, null, null, null, '-1212668563', '0', null, '1', '1433751097', null, '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('117', '1469591921', 'e10adc3949ba59abbe56e057f20f883e', '泰世通 — 李经理', null, '1469591921@qq.com', '1469591921', '13671031523', null, null, null, null, '0', null, 'a:1:{i:0;s:2:\"26\";}', null, null, '-573750485', '1', '26', '1', '1433812873', '1433822249', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('119', '353909204', 'e10adc3949ba59abbe56e057f20f883e', '泰世通 — 谢经理', null, '353909204@qq.com', '353909204', '13671031523', null, null, null, null, '0', null, 'a:1:{i:0;s:2:\"26\";}', null, null, '-573750485', '1', '26', '1', '1433813354', '1433822229', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('120', '574136472', 'e10adc3949ba59abbe56e057f20f883e', '泰世通 — 王经理', null, '574136472@qq.com', '574136472', '13671031523', null, null, null, null, '0', null, 'a:1:{i:0;s:2:\"26\";}', null, null, '-573750485', '1', '26', '1', '1433813474', '1433822222', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('121', '932424766', 'e10adc3949ba59abbe56e057f20f883e', '泰世通 — 邓经理', null, '932424766@qq.com', '932424766', '13671031523', null, null, null, null, '0', null, 'a:1:{i:0;s:2:\"26\";}', null, null, '-573750485', '1', '26', '1', '1433813574', '1433822213', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('122', '489511945', 'e10adc3949ba59abbe56e057f20f883e', '泰世通 — 范经理', null, '489511945@qq.com', '489511945', '13671031523', null, null, null, null, '0', null, 'a:1:{i:0;s:2:\"26\";}', null, null, '-573750485', '1', '26', '1', '1433813673', '1433822203', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('123', '2576383942', 'e10adc3949ba59abbe56e057f20f883e', '看我笑', null, '2576383942@qq.com', '2576383942', '13671031523', null, null, null, null, '0', null, null, null, null, '-573750485', '0', null, '1', '1433815356', null, '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('124', '147427107', 'e10adc3949ba59abbe56e057f20f883e', '炒白银换金屋', null, '147427107@qq.com', '147427107', '13671031523', null, null, null, null, '0', null, null, null, null, '-573750485', '0', null, '1', '1433815512', null, '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('125', '2818430997', 'e10adc3949ba59abbe56e057f20f883e', '小辣椒', null, '2818430997@qq.com', '2818430997', '13671031523', null, null, null, null, '0', null, null, null, null, '-573750485', '0', null, '1', '1433815650', null, '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('126', '1901172848', 'e10adc3949ba59abbe56e057f20f883e', '美美的', null, '1901172848@qq.com', '1901172848', '13671031523', null, null, null, null, '0', null, null, null, null, '-573750485', '0', null, '1', '1433816058', null, '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('127', 'liuzihan', 'aa302fce5539ed4efa01495a04a12bd0', 'liuzihan', null, '1222@qq.com', '12112', '13800138000', null, null, null, null, '0', null, 'a:1:{i:0;s:2:\"26\";}', null, null, '1857105205', '0', '26', '1', '1433856386', '1437977866', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('129', '18098926941', 'e10adc3949ba59abbe56e057f20f883e', '浪天涯', null, '546849097@qq.com', '546849097', '18098926941', null, null, null, null, '0', null, null, null, null, '-1418445880', '0', null, '1', '1434011711', '1434011753', '0', '0', null);
INSERT INTO `live_userinfo_base` VALUES ('130', 'w123456', '3d24b838770ee90773804e8599e549ff', 'w123', null, '854873557@qq.com', '854873557', '13485378400', null, null, null, null, '0', null, null, null, null, '1021282421', '0', null, '1', '1434445466', null, '0', '0', null);

-- ----------------------------
-- Table structure for `live_userinfo_kind`
-- ----------------------------
DROP TABLE IF EXISTS `live_userinfo_kind`;
CREATE TABLE `live_userinfo_kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `roomid` int(11) DEFAULT NULL,
  `ctime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_userinfo_kind
-- ----------------------------
INSERT INTO `live_userinfo_kind` VALUES ('43', '26', '12', null);
INSERT INTO `live_userinfo_kind` VALUES ('26', '30', '10', null);
INSERT INTO `live_userinfo_kind` VALUES ('32', '36', '16', null);
INSERT INTO `live_userinfo_kind` VALUES ('37', '32', '10', null);
INSERT INTO `live_userinfo_kind` VALUES ('38', '32', '12', null);
INSERT INTO `live_userinfo_kind` VALUES ('39', '29', '19', null);
INSERT INTO `live_userinfo_kind` VALUES ('40', '29', '21', null);
INSERT INTO `live_userinfo_kind` VALUES ('41', '52', '21', null);
INSERT INTO `live_userinfo_kind` VALUES ('47', '37', '25', null);
INSERT INTO `live_userinfo_kind` VALUES ('46', '37', '14', null);
INSERT INTO `live_userinfo_kind` VALUES ('48', '63', '26', null);
INSERT INTO `live_userinfo_kind` VALUES ('50', '86', '26', null);
INSERT INTO `live_userinfo_kind` VALUES ('54', '89', '26', null);
INSERT INTO `live_userinfo_kind` VALUES ('56', '92', '26', null);
INSERT INTO `live_userinfo_kind` VALUES ('57', '114', '26', null);
INSERT INTO `live_userinfo_kind` VALUES ('59', '122', '26', null);
INSERT INTO `live_userinfo_kind` VALUES ('60', '121', '26', null);
INSERT INTO `live_userinfo_kind` VALUES ('61', '120', '26', null);
INSERT INTO `live_userinfo_kind` VALUES ('62', '119', '26', null);
INSERT INTO `live_userinfo_kind` VALUES ('63', '118', '26', null);
INSERT INTO `live_userinfo_kind` VALUES ('64', '117', '26', null);
INSERT INTO `live_userinfo_kind` VALUES ('66', '127', '26', null);

-- ----------------------------
-- Table structure for `live_user_online`
-- ----------------------------
DROP TABLE IF EXISTS `live_user_online`;
CREATE TABLE `live_user_online` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(30) DEFAULT NULL,
  `roomid` int(11) DEFAULT NULL,
  `role` tinyint(4) DEFAULT NULL COMMENT '用户角色标识:-1为游客',
  `level` tinyint(4) DEFAULT '-1',
  `ltime` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid` (`userid`),
  KEY `masterid` (`roomid`),
  KEY `level` (`level`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_user_online
-- ----------------------------
INSERT INTO `live_user_online` VALUES ('9720354', '游客9720354', '26', '-1', '-1', '1439306280');

-- ----------------------------
-- Table structure for `live_user_sso`
-- ----------------------------
DROP TABLE IF EXISTS `live_user_sso`;
CREATE TABLE `live_user_sso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `sso_type` int(11) DEFAULT NULL COMMENT '1:qq 2:sina',
  `openid` varchar(80) DEFAULT '0' COMMENT '1:禁言',
  `token` varchar(500) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `ctime` int(11) DEFAULT NULL,
  `mtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_user_sso
-- ----------------------------
INSERT INTO `live_user_sso` VALUES ('60', '62', '2', '2821051911', 'a:4:{s:12:\"access_token\";s:32:\"2.00RTquED0Tj5bE7dcd1cbc0d06VHEB\";s:9:\"remind_in\";s:6:\"127588\";s:10:\"expires_in\";i:127588;s:3:\"uid\";s:10:\"2821051911\";}', '1', '1395819211', null);

-- ----------------------------
-- Table structure for `live_user_status`
-- ----------------------------
DROP TABLE IF EXISTS `live_user_status`;
CREATE TABLE `live_user_status` (
  `userid` int(11) NOT NULL DEFAULT '0',
  `roomid` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '0' COMMENT '0:禁言,1:踢出',
  `vtime` int(11) DEFAULT NULL,
  `atime` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_user_status
-- ----------------------------

-- ----------------------------
-- Table structure for `live_vote`
-- ----------------------------
DROP TABLE IF EXISTS `live_vote`;
CREATE TABLE `live_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` tinyint(3) unsigned NOT NULL,
  `votetype` tinyint(4) DEFAULT NULL COMMENT '投票种类2：看多，1：震荡，0：看空',
  `userid` int(11) DEFAULT NULL,
  `ip` int(11) DEFAULT NULL,
  `votedate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of live_vote
-- ----------------------------
INSERT INTO `live_vote` VALUES ('22', '0', '0', '63', '2130706433', '2014-05-16');
INSERT INTO `live_vote` VALUES ('25', '0', '1', '530405', '2130706433', '2014-06-27');
INSERT INTO `live_vote` VALUES ('26', '0', '0', '55513653', '2130706433', '2014-06-27');
INSERT INTO `live_vote` VALUES ('27', '0', '1', '38604194', '2130706433', '2014-06-27');
INSERT INTO `live_vote` VALUES ('28', '0', '0', '80409840', '2130706433', '2014-06-28');
INSERT INTO `live_vote` VALUES ('29', '0', '0', '63', '2130706433', '2014-06-28');
INSERT INTO `live_vote` VALUES ('30', '0', '0', '63', '2130706433', '2014-06-30');
INSERT INTO `live_vote` VALUES ('31', '0', '2', '12529237', '2130706433', '2014-07-02');
INSERT INTO `live_vote` VALUES ('32', '0', '1', '88854543', '2130706433', '2014-07-15');
INSERT INTO `live_vote` VALUES ('33', '0', '1', '44716434', '2130706433', '2014-07-15');
INSERT INTO `live_vote` VALUES ('34', '0', '1', '53012206', '2130706433', '2014-07-15');
INSERT INTO `live_vote` VALUES ('38', '0', '0', '17952079', '2130706433', '2014-07-16');
INSERT INTO `live_vote` VALUES ('39', '0', '0', null, '2130706433', '2014-07-16');
INSERT INTO `live_vote` VALUES ('40', '0', '1', '61117734', '2130706433', '2014-07-16');
INSERT INTO `live_vote` VALUES ('41', '0', '0', '33717627', '2130706433', '2014-07-17');
INSERT INTO `live_vote` VALUES ('42', '0', '1', '27223548', '2130706433', '2014-07-19');
INSERT INTO `live_vote` VALUES ('43', '0', '0', '23524', '2130706433', '2014-07-19');
INSERT INTO `live_vote` VALUES ('44', '0', '0', '95724327', '2130706433', '2014-07-19');
INSERT INTO `live_vote` VALUES ('45', '0', '0', '63', '2130706433', '2014-07-21');
INSERT INTO `live_vote` VALUES ('49', '0', '1', '74', '2130706433', '2014-07-21');
INSERT INTO `live_vote` VALUES ('50', '0', '2', '67629313', '2130706433', '2014-07-24');
INSERT INTO `live_vote` VALUES ('51', '0', '2', '41825392', '2130706433', '2014-07-25');
INSERT INTO `live_vote` VALUES ('52', '0', '0', '63', '2130706433', '2014-07-25');
INSERT INTO `live_vote` VALUES ('53', '0', '2', '84527032', '2130706433', '2014-07-28');
INSERT INTO `live_vote` VALUES ('54', '0', '1', '63', '2130706433', '2014-07-31');
INSERT INTO `live_vote` VALUES ('55', '0', '0', '23899596', '2130706433', '2014-07-31');
INSERT INTO `live_vote` VALUES ('56', '0', '0', '69310504', '2095321408', '2015-03-25');
INSERT INTO `live_vote` VALUES ('57', '0', '2', '40631288', '-635603670', '2015-03-31');
INSERT INTO `live_vote` VALUES ('58', '0', '0', '71715435', '-632468941', '2015-03-31');
INSERT INTO `live_vote` VALUES ('59', '0', '2', '16927575', '1879418910', '2015-03-31');
INSERT INTO `live_vote` VALUES ('60', '0', '2', '9376188', '993219292', '2015-04-01');
INSERT INTO `live_vote` VALUES ('61', '0', '1', '84', '1699831958', '2015-04-02');
INSERT INTO `live_vote` VALUES ('62', '0', '2', '80175587', '1848934784', '2015-04-02');
INSERT INTO `live_vote` VALUES ('63', '0', '0', '58607142', '2095330097', '2015-04-02');
INSERT INTO `live_vote` VALUES ('64', '0', '1', '18375062', '1035709992', '2015-04-02');
INSERT INTO `live_vote` VALUES ('65', '0', '2', '32556711', '1936163681', '2015-04-04');
INSERT INTO `live_vote` VALUES ('66', '0', '2', '8439505', '1857874987', '2015-04-07');
INSERT INTO `live_vote` VALUES ('67', '0', '2', '32212597', '-745609310', '2015-04-09');
INSERT INTO `live_vote` VALUES ('68', '0', '0', '93046525', '-543980704', '2015-04-09');
INSERT INTO `live_vote` VALUES ('69', '0', '2', '48315163', '-544071561', '2015-04-10');
INSERT INTO `live_vote` VALUES ('70', '0', '2', '85914407', '2067007742', '2015-04-10');
INSERT INTO `live_vote` VALUES ('71', '0', '0', '65526864', '1996412804', '2015-04-10');
INSERT INTO `live_vote` VALUES ('72', '0', '2', '89627767', '974399390', '2015-04-11');
INSERT INTO `live_vote` VALUES ('73', '0', '2', '68826301', '-1949611883', '2015-04-11');
INSERT INTO `live_vote` VALUES ('74', '0', '2', '813315', '29837115', '2015-04-11');
INSERT INTO `live_vote` VALUES ('75', '0', '2', '89145852', '-1266106065', '2015-04-13');
INSERT INTO `live_vote` VALUES ('76', '0', '0', '1228528', '2088832926', '2015-04-13');
INSERT INTO `live_vote` VALUES ('77', '0', '2', '93654292', '-632941894', '2015-04-14');
INSERT INTO `live_vote` VALUES ('78', '0', '2', '94917394', '2103369984', '2015-04-16');
INSERT INTO `live_vote` VALUES ('79', '0', '2', '34341659', '1918649274', '2015-04-16');
INSERT INTO `live_vote` VALUES ('80', '0', '2', '92124165', '2095321213', '2015-04-17');
INSERT INTO `live_vote` VALUES ('81', '0', '0', '50227688', '-632468941', '2015-04-17');
INSERT INTO `live_vote` VALUES ('82', '0', '2', '98843953', '2147483647', '2015-05-12');
INSERT INTO `live_vote` VALUES ('83', '0', '1', '85', '2147483647', '2015-05-12');
INSERT INTO `live_vote` VALUES ('84', '0', '0', '85', '2147483647', '2015-05-12');
INSERT INTO `live_vote` VALUES ('85', '0', '0', '85', '2147483647', '2015-05-12');
INSERT INTO `live_vote` VALUES ('86', '0', '2', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('87', '0', '2', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('88', '0', '2', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('89', '0', '2', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('90', '0', '2', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('91', '0', '2', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('92', '0', '1', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('93', '0', '1', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('94', '0', '1', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('95', '4', '2', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('96', '3', '2', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('97', '3', '1', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('98', '4', '0', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('99', '5', '2', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('100', '4', '1', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('101', '3', '2', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('102', '3', '2', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('103', '3', '2', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('104', '3', '2', '16227815', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('105', '3', '0', '16227815', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('106', '3', '2', '16227815', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('107', '3', '2', '16227815', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('108', '3', '1', '16227815', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('109', '4', '2', '16227815', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('110', '5', '0', '16227815', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('111', '5', '2', '16227815', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('112', '4', '1', '84730528', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('113', '3', '2', '16227815', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('114', '3', '2', '77987191', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('115', '3', '1', '77987191', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('116', '3', '0', '77987191', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('117', '3', '1', '77987191', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('118', '3', '2', '16227815', '2147483647', '2015-05-15');
INSERT INTO `live_vote` VALUES ('119', '3', '2', '17158667', '2147483647', '2015-05-17');
INSERT INTO `live_vote` VALUES ('120', '4', '2', '48636970', '2147483647', '2015-05-17');
INSERT INTO `live_vote` VALUES ('121', '4', '1', '48636970', '2147483647', '2015-05-17');
INSERT INTO `live_vote` VALUES ('122', '5', '2', '48636970', '2147483647', '2015-05-17');
INSERT INTO `live_vote` VALUES ('123', '4', '1', '70107960', '2147483647', '2015-05-17');
INSERT INTO `live_vote` VALUES ('124', '5', '0', '70107960', '2147483647', '2015-05-17');
INSERT INTO `live_vote` VALUES ('125', '4', '1', '70107960', '2147483647', '2015-05-17');
INSERT INTO `live_vote` VALUES ('126', '4', '1', '70107960', '2147483647', '2015-05-17');
INSERT INTO `live_vote` VALUES ('127', '4', '1', '70107960', '2147483647', '2015-05-17');
INSERT INTO `live_vote` VALUES ('128', '3', '2', '56087240', '2147483647', '2015-05-18');
INSERT INTO `live_vote` VALUES ('129', '3', '0', '49068947', '1857283162', '2015-05-24');
INSERT INTO `live_vote` VALUES ('130', '3', '2', '93812099', '-573750477', '2015-05-26');
INSERT INTO `live_vote` VALUES ('131', '3', '1', '72029933', '-1418387661', '2015-05-27');
INSERT INTO `live_vote` VALUES ('132', '3', '2', '69834186', '-1212556442', '2015-05-29');
INSERT INTO `live_vote` VALUES ('133', '4', '1', '69834186', '-1212556442', '2015-05-29');
INSERT INTO `live_vote` VALUES ('134', '5', '0', '69834186', '-1212556442', '2015-05-29');
INSERT INTO `live_vote` VALUES ('135', '3', '2', '3923900', '1985081961', '2015-06-01');
INSERT INTO `live_vote` VALUES ('136', '3', '2', '68593177', '1996560343', '2015-06-02');
INSERT INTO `live_vote` VALUES ('137', '3', '2', '80528300', '-573738786', '2015-06-03');
INSERT INTO `live_vote` VALUES ('138', '4', '0', '111', '-573738786', '2015-06-03');
INSERT INTO `live_vote` VALUES ('139', '5', '2', '111', '-573738786', '2015-06-03');
INSERT INTO `live_vote` VALUES ('140', '3', '2', '124', '-573750485', '2015-06-09');
INSERT INTO `live_vote` VALUES ('141', '3', '2', '38420720', '659237792', '2015-06-10');
INSERT INTO `live_vote` VALUES ('142', '5', '0', '38420720', '659237792', '2015-06-10');
INSERT INTO `live_vote` VALUES ('143', '4', '2', '38420720', '659237792', '2015-06-10');
INSERT INTO `live_vote` VALUES ('144', '3', '2', '126', '-1418388081', '2015-06-10');
INSERT INTO `live_vote` VALUES ('145', '3', '0', '118', '-1418388081', '2015-06-10');
INSERT INTO `live_vote` VALUES ('146', '3', '1', '126', '-1418445880', '2015-06-11');
INSERT INTO `live_vote` VALUES ('147', '3', '2', '113', '-1418445880', '2015-06-11');
INSERT INTO `live_vote` VALUES ('148', '3', '0', '118', '-1418445880', '2015-06-11');
INSERT INTO `live_vote` VALUES ('149', '3', '1', '45318303', '1985081662', '2015-06-12');
INSERT INTO `live_vote` VALUES ('150', '5', '0', '126', '1985081662', '2015-06-12');
INSERT INTO `live_vote` VALUES ('151', '3', '2', '113', '1985081662', '2015-06-12');
INSERT INTO `live_vote` VALUES ('152', '3', '1', '59731424', '-1418273214', '2015-06-15');
INSERT INTO `live_vote` VALUES ('153', '3', '1', '55735870', '2130706433', '2015-06-17');
INSERT INTO `live_vote` VALUES ('154', '4', '1', '38610187', '2130706433', '2015-07-27');
