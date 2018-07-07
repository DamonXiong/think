# Host: localhost  (Version: 5.5.53)
# Date: 2018-07-06 15:23:50
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "eb_store_product_reply"
#

DROP TABLE IF EXISTS `eb_store_product_reply`;
CREATE TABLE `eb_store_product_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `oid` int(11) NOT NULL COMMENT '订单ID',
  `unique` char(32) NOT NULL COMMENT '唯一id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `reply_type` varchar(32) NOT NULL DEFAULT 'product' COMMENT '某种商品类型(普通商品、秒杀商品）',
  `product_score` tinyint(1) NOT NULL COMMENT '商品分数',
  `service_score` tinyint(1) NOT NULL COMMENT '服务分数',
  `comment` varchar(512) NOT NULL COMMENT '评论内容',
  `pics` text NOT NULL COMMENT '评论图片',
  `add_time` int(11) NOT NULL COMMENT '评论时间',
  `merchant_reply_content` varchar(300) NOT NULL COMMENT '管理员回复内容',
  `merchant_reply_time` int(11) NOT NULL COMMENT '管理员回复时间',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未删除1已删除',
  `is_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未回复1已回复',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_id_2` (`oid`,`unique`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `parent_id` (`reply_type`) USING BTREE,
  KEY `product_score` (`product_score`) USING BTREE,
  KEY `service_score` (`service_score`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='评论表';

#
# Data for table "eb_store_product_reply"
#

/*!40000 ALTER TABLE `eb_store_product_reply` DISABLE KEYS */;
INSERT INTO `eb_store_product_reply` VALUES (172,1,445,'502019da1b4030b6e25c850b281eb933',633,'product',1,1,'受打击处理速度进垃圾堆','[]',1524111874,'沙发上的1',1526545832,0,2),(173,1,445,'575414f0c3549fc71f6577d1b7073aa9',647,'product',1,1,'水电费如果','[]',1524124220,'测试回复消息',1527039991,0,2),(174,1,446,'502019da1b4030b6e25c850b281eb933',633,'product',1,1,'受打击处理速度进垃圾堆','[]',1524111874,'',0,1,0),(175,1,447,'502019da1b4030b6e25c850b281eb933',633,'product',1,1,'受打击处理速度进垃圾堆','[]',1524111874,'',0,0,0),(176,1,460,'0f9417c85b3f43c016f6b028bcc2a26e',649,'product',3,4,'我曹','[]',1524809698,'',0,0,0),(178,101,472,'f6d8324d3c24415612e3cd28e730f26e',16,'product',2,3,'wqwqwq','[\"https:\\/\\/qipei.9gt.net\\/public\\/uploads\\/store\\/comment\\/5afea0ecac2ef.jpg,https:\\/\\/qipei.9gt.net\\/public\\/uploads\\/store\\/comment\\/5afea0ecc6924.jpg,https:\\/\\/qipei.9gt.net\\/public\\/uploads\\/store\\/comment\\/5afea0ecdfbb9.jpg,https:\\/\\/qipei.9gt.net\\/public\\/uploads\\/store\\/comment\\/5afea0ed04601.png,https:\\/\\/qipei.9gt.net\\/public\\/uploads\\/store\\/comment\\/5afea0ed1ed2a.png,https:\\/\\/qipei.9gt.net\\/public\\/uploads\\/store\\/comment\\/5afea0ed37b2b.png,https:\\/\\/qipei.9gt.net\\/public\\/uploads\\/store\\/comment\\/5afea0ed50b93.png,https:\\/\\/qipei.9gt.net\\/public\\/uploads\\/store\\/comment\\/5afea0ed689a1.png\"]',1526636786,'',0,0,0),(179,101,474,'4c0005a12f31e403c6f56853bc4ff8a3',18,'product',2,4,'qwqw','[\"https:\\/\\/qipei.9gt.net\\/public\\/uploads\\/store\\/comment\\/5afea9afec13e.jpg\"]',1526639026,'',0,0,0),(180,101,455,'617b15f6d372abc138ece752cec46561',649,'product',2,3,'asasd','[\"\"]',1526640023,'',0,0,0),(181,101,486,'efbfa88b9d922923c2a7ce0cf9397513',547,'product',4,3,'qawqwqw','[\"https:\\/\\/qipei.9gt.net\\/public\\/uploads\\/store\\/comment\\/5affc28cb6b16.jpg\"]',1526710931,'',0,0,0),(182,101,485,'f1019d97165d57b45497e3ceacb57c37',632,'product',3,2,'qwqwqw','[\"https:\\/\\/qipei.9gt.net\\/public\\/uploads\\/store\\/comment\\/5affc2de80daa.jpg\"]',1526711015,'',0,0,0);
/*!40000 ALTER TABLE `eb_store_product_reply` ENABLE KEYS */;
