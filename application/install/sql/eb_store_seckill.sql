# Host: localhost  (Version: 5.5.53)
# Date: 2018-07-06 15:24:48
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES gb2312 */;

#
# Structure for table "eb_store_seckill"
#

DROP TABLE IF EXISTS `eb_store_seckill`;
CREATE TABLE `eb_store_seckill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品秒杀产品表id',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `image` varchar(255) NOT NULL COMMENT '推荐图',
  `images` varchar(1000) NOT NULL COMMENT '轮播图',
  `title` varchar(255) NOT NULL COMMENT '活动标题',
  `info` varchar(255) NOT NULL COMMENT '简介',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '价格',
  `cost` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '成本',
  `ot_price` decimal(10,2) unsigned NOT NULL COMMENT '原价',
  `give_integral` decimal(10,2) unsigned NOT NULL COMMENT '返多少积分',
  `sort` int(10) unsigned NOT NULL COMMENT '排序',
  `stock` int(10) unsigned NOT NULL COMMENT '库存',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `unit_name` varchar(16) NOT NULL COMMENT '单位名',
  `postage` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `description` text NOT NULL COMMENT '内容',
  `start_time` varchar(128) NOT NULL COMMENT '开始时间',
  `stop_time` varchar(128) NOT NULL COMMENT '结束时间',
  `add_time` varchar(128) NOT NULL COMMENT '添加时间',
  `status` tinyint(1) unsigned NOT NULL COMMENT '产品状态',
  `is_postage` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否包邮',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '热门推荐',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '删除 0未删除1已删除',
  `num` int(11) unsigned NOT NULL COMMENT '最多秒杀几个',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '显示',
  PRIMARY KEY (`id`),
  KEY `add_time` (`add_time`),
  KEY `is_del` (`is_del`),
  KEY `is_hot` (`is_hot`),
  KEY `is_postage` (`is_postage`),
  KEY `is_show` (`status`),
  KEY `product_id` (`product_id`),
  KEY `sort` (`sort`),
  KEY `start_time` (`start_time`,`stop_time`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品秒杀产品表';

#
# Data for table "eb_store_seckill"
#

/*!40000 ALTER TABLE `eb_store_seckill` DISABLE KEYS */;
INSERT INTO `eb_store_seckill` VALUES (11,648,'/public/static/admin/uploadsstore/product/s_5abc58e8ad6db.jpg','[\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb41c285.jpg\",\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb5dc633.jpg\"]','crmeb电商系统','集客户关系管理+营销电商系统，能够真正帮助企业基于微信公众号、小程序，实现会员关系管理、数据分析，精准营销的电子商务管理系统。可满足企业零售、批发、分销等各种业务需求。',0.00,0.00,69.90,70.00,9,888,0,'个',0.00,'','1523894400','1524240000','1523959581',1,1,1,1,111,1),(12,647,'/public/static/admin/uploadsstore/product/s_5abc69eba3f43.jpg','[\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb41c285.jpg\",\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb5dc633.jpg\"]','crmeb电商系统','集客户关系管理+营销电商系统，能够真正帮助企业基于微信公众号、小程序，实现会员关系管理、数据分析，精准营销的电子商务管理系统。可满足企业零售、批发、分销等各种业务需求。',18.00,0.00,29.90,30.00,10,888,9,'个',8.00,'<p><span style=\"color: rgb(103, 106, 108); font-family: &quot;open sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; text-align: center; white-space: normal; background-color: rgb(249, 249, 249);\">客户关系管理+营销电商系统，能够真正帮助企业基于微信公众号、小程序，实现会员关系管理、数据分析，精准营销的电子商务管理系统。可满足企业零售</span></p>','1524499200','1524758400','1524014837',1,0,1,1,1,1),(13,646,'/public/static/admin/uploadsstore/product/s_5abc58e8ad6db.jpg','[\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb41c285.jpg\",\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb5dc633.jpg\"]','crmeb电商系统','集客户关系管理+营销电商系统，能够真正帮助企业基于微信公众号、小程序，实现会员关系管理、数据分析，精准营销的电子商务管理系统。可满足企业零售、批发、分销等各种业务需求。',0.00,0.00,18.80,19.00,10,888,0,'个',0.00,'','1524240000','1524844800','1524014917',1,1,0,1,10,1),(14,645,'/public/static/admin/uploadsstore/product/s_5abc69eba3f43.jpg','[\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb41c285.jpg\",\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb5dc633.jpg\"]','crmeb电商系统1','集客户关系管理+营销电商系统，能够真正帮助企业基于微信公众号、小程序，实现会员关系管理、数据分析，精准营销的电子商务管理系统。可满足企业零售、批发、分销等各种业务需求。',0.00,0.00,16.90,17.00,10,888,0,'测试',0.00,'','1524240000','1524844800','1524045190',1,1,0,1,0,1),(16,648,'/public/static/admin/uploadsstore/product/s_5abc58e8ad6db.jpg','[\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb41c285.jpg\",\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb5dc633.jpg\"]','crmeb电商系统','集客户关系管理+营销电商系统，能够真正帮助企业基于微信公众号、小程序，实现会员关系管理、数据分析，精准营销的电子商务管理系统。可满足企业零售、批发、分销等各种业务需求。',0.00,8.00,69.90,70.00,9,888,0,'个',0.00,'','1524585600','1524844800','1524646664',1,1,1,0,1,1),(17,650,'/public/static/admin/uploadsstore/product/s_5ae048a5cae97.jpg','[\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5ae048a812870.jpg\"]','啊娃娃','打发打发',77.00,0.00,88.00,40.00,0,20,50,'个',8.00,'撒大大<p></p>','1526227200','1527436800','1524648180',1,0,0,0,1,1),(18,649,'/public/static/admin/uploadsstore/product/s_5add9a80cb2d4.jpg','[\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5add9a830900c.jpg\"]','手机','高能',900.00,777.00,1200.00,50.00,0,9,109,'个',8.00,'<p><span style=\"color: rgb(103, 106, 108); font-family: &quot;open sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; text-align: center; white-space: normal; background-color: rgb(249, 249, 249);\">集客户关系管理+营销电商系统，能够真正帮助企业基于微信公众号、小程序，实现会员关系管理、数据分析，精准营销的电子商务管理系统。可满足企业零售、批发、分销等各种业务需求。</span></p>','1526227200','1527696000','1524650014',1,0,0,0,1,1);
/*!40000 ALTER TABLE `eb_store_seckill` ENABLE KEYS */;
