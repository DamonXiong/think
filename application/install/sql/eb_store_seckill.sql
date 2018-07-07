# Host: localhost  (Version: 5.5.53)
# Date: 2018-07-06 15:24:48
# Generator: MySQL-Front 5.3  (Build 4.234)

/*!40101 SET NAMES gb2312 */;

#
# Structure for table "eb_store_seckill"
#

DROP TABLE IF EXISTS `eb_store_seckill`;
CREATE TABLE `eb_store_seckill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '��Ʒ��ɱ��Ʒ��id',
  `product_id` int(10) unsigned NOT NULL COMMENT '��Ʒid',
  `image` varchar(255) NOT NULL COMMENT '�Ƽ�ͼ',
  `images` varchar(1000) NOT NULL COMMENT '�ֲ�ͼ',
  `title` varchar(255) NOT NULL COMMENT '�����',
  `info` varchar(255) NOT NULL COMMENT '���',
  `price` decimal(10,2) unsigned NOT NULL COMMENT '�۸�',
  `cost` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '�ɱ�',
  `ot_price` decimal(10,2) unsigned NOT NULL COMMENT 'ԭ��',
  `give_integral` decimal(10,2) unsigned NOT NULL COMMENT '�����ٻ���',
  `sort` int(10) unsigned NOT NULL COMMENT '����',
  `stock` int(10) unsigned NOT NULL COMMENT '���',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '����',
  `unit_name` varchar(16) NOT NULL COMMENT '��λ��',
  `postage` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '�ʷ�',
  `description` text NOT NULL COMMENT '����',
  `start_time` varchar(128) NOT NULL COMMENT '��ʼʱ��',
  `stop_time` varchar(128) NOT NULL COMMENT '����ʱ��',
  `add_time` varchar(128) NOT NULL COMMENT '���ʱ��',
  `status` tinyint(1) unsigned NOT NULL COMMENT '��Ʒ״̬',
  `is_postage` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�Ƿ����',
  `is_hot` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '�����Ƽ�',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'ɾ�� 0δɾ��1��ɾ��',
  `num` int(11) unsigned NOT NULL COMMENT '�����ɱ����',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '��ʾ',
  PRIMARY KEY (`id`),
  KEY `add_time` (`add_time`),
  KEY `is_del` (`is_del`),
  KEY `is_hot` (`is_hot`),
  KEY `is_postage` (`is_postage`),
  KEY `is_show` (`status`),
  KEY `product_id` (`product_id`),
  KEY `sort` (`sort`),
  KEY `start_time` (`start_time`,`stop_time`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='��Ʒ��ɱ��Ʒ��';

#
# Data for table "eb_store_seckill"
#

/*!40000 ALTER TABLE `eb_store_seckill` DISABLE KEYS */;
INSERT INTO `eb_store_seckill` VALUES (11,648,'/public/static/admin/uploadsstore/product/s_5abc58e8ad6db.jpg','[\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb41c285.jpg\",\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb5dc633.jpg\"]','crmeb����ϵͳ','���ͻ���ϵ����+Ӫ������ϵͳ���ܹ�����������ҵ����΢�Ź��ںš�С����ʵ�ֻ�Ա��ϵ�������ݷ�������׼Ӫ���ĵ����������ϵͳ����������ҵ���ۡ������������ȸ���ҵ������',0.00,0.00,69.90,70.00,9,888,0,'��',0.00,'','1523894400','1524240000','1523959581',1,1,1,1,111,1),(12,647,'/public/static/admin/uploadsstore/product/s_5abc69eba3f43.jpg','[\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb41c285.jpg\",\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb5dc633.jpg\"]','crmeb����ϵͳ','���ͻ���ϵ����+Ӫ������ϵͳ���ܹ�����������ҵ����΢�Ź��ںš�С����ʵ�ֻ�Ա��ϵ�������ݷ�������׼Ӫ���ĵ����������ϵͳ����������ҵ���ۡ������������ȸ���ҵ������',18.00,0.00,29.90,30.00,10,888,9,'��',8.00,'<p><span style=\"color: rgb(103, 106, 108); font-family: &quot;open sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; text-align: center; white-space: normal; background-color: rgb(249, 249, 249);\">�ͻ���ϵ����+Ӫ������ϵͳ���ܹ�����������ҵ����΢�Ź��ںš�С����ʵ�ֻ�Ա��ϵ�������ݷ�������׼Ӫ���ĵ����������ϵͳ����������ҵ����</span></p>','1524499200','1524758400','1524014837',1,0,1,1,1,1),(13,646,'/public/static/admin/uploadsstore/product/s_5abc58e8ad6db.jpg','[\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb41c285.jpg\",\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb5dc633.jpg\"]','crmeb����ϵͳ','���ͻ���ϵ����+Ӫ������ϵͳ���ܹ�����������ҵ����΢�Ź��ںš�С����ʵ�ֻ�Ա��ϵ�������ݷ�������׼Ӫ���ĵ����������ϵͳ����������ҵ���ۡ������������ȸ���ҵ������',0.00,0.00,18.80,19.00,10,888,0,'��',0.00,'','1524240000','1524844800','1524014917',1,1,0,1,10,1),(14,645,'/public/static/admin/uploadsstore/product/s_5abc69eba3f43.jpg','[\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb41c285.jpg\",\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb5dc633.jpg\"]','crmeb����ϵͳ1','���ͻ���ϵ����+Ӫ������ϵͳ���ܹ�����������ҵ����΢�Ź��ںš�С����ʵ�ֻ�Ա��ϵ�������ݷ�������׼Ӫ���ĵ����������ϵͳ����������ҵ���ۡ������������ȸ���ҵ������',0.00,0.00,16.90,17.00,10,888,0,'����',0.00,'','1524240000','1524844800','1524045190',1,1,0,1,0,1),(16,648,'/public/static/admin/uploadsstore/product/s_5abc58e8ad6db.jpg','[\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb41c285.jpg\",\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5abc6bb5dc633.jpg\"]','crmeb����ϵͳ','���ͻ���ϵ����+Ӫ������ϵͳ���ܹ�����������ҵ����΢�Ź��ںš�С����ʵ�ֻ�Ա��ϵ�������ݷ�������׼Ӫ���ĵ����������ϵͳ����������ҵ���ۡ������������ȸ���ҵ������',0.00,8.00,69.90,70.00,9,888,0,'��',0.00,'','1524585600','1524844800','1524646664',1,1,1,0,1,1),(17,650,'/public/static/admin/uploadsstore/product/s_5ae048a5cae97.jpg','[\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5ae048a812870.jpg\"]','������','�򷢴�',77.00,0.00,88.00,40.00,0,20,50,'��',8.00,'�����<p></p>','1526227200','1527436800','1524648180',1,0,0,0,1,1),(18,649,'/public/static/admin/uploadsstore/product/s_5add9a80cb2d4.jpg','[\"\\/public\\/static\\/admin\\/uploads\\/store\\/product\\/s_5add9a830900c.jpg\"]','�ֻ�','����',900.00,777.00,1200.00,50.00,0,9,109,'��',8.00,'<p><span style=\"color: rgb(103, 106, 108); font-family: &quot;open sans&quot;, &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13px; text-align: center; white-space: normal; background-color: rgb(249, 249, 249);\">���ͻ���ϵ����+Ӫ������ϵͳ���ܹ�����������ҵ����΢�Ź��ںš�С����ʵ�ֻ�Ա��ϵ�������ݷ�������׼Ӫ���ĵ����������ϵͳ����������ҵ���ۡ������������ȸ���ҵ������</span></p>','1526227200','1527696000','1524650014',1,0,0,0,1,1);
/*!40000 ALTER TABLE `eb_store_seckill` ENABLE KEYS */;
