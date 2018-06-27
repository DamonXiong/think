<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------

// 应用公共文件
/**
 * 获取用户名称
 * @param $uid
 * @return mixed
 */
function getUserNickname($uid){
    return \app\admin\model\user\User::where('uid',$uid)->value('nickname');
}

/**
 * 获取产品名称
 * @param $id
 * @return mixed
 */
function getProductName($id){
    return \app\admin\model\store\StoreProduct::where('id',$id)->value('store_name');
}

/**
 * 获取拼团名称
 * @param $id
 * @return mixed
 */
function getCombinationTitle($id){
    return \app\admin\model\store\StoreCombination::where('id',$id)->value('title');
}

/**
 * 获取订单编号
 * @param $id
 */
function getOrderId($id){
    return \app\admin\model\store\StoreOrder::where('id',$id)->value('order_id');
}


/**
 * 根据用户uid获取订单数
 * @param $uid
 * @return int|string
 */
function getOrderCount($uid){
    return \app\admin\model\store\StoreOrder::where('uid',$uid)->where('paid',1)->where('refund_status',0)->where('status',2)->count();
}
