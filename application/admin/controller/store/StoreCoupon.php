<?php

namespace app\admin\controller\store;

use app\admin\controller\AuthController;
use app\admin\model\store\StoreCouponIssue;
use app\admin\model\wechat\WechatUser as UserModel;
use app\admin\library\FormBuilder;
use service\JsonService;
use service\UtilService as Util;
use service\JsonService as Json;
use service\UtilService;
use think\Request;
use app\admin\model\store\StoreCoupon as CouponModel;
use think\facade\Url;

/**
 * 优惠券控制器
 * Class StoreCategory
 * @package app\admin\controller\system
 */
class StoreCoupon extends AuthController
{

    /**
     * @return mixed
     */
    public function index()
    {
        $where = Util::getMore([
            ['status',''],
            ['title',''],
        ],$this->request);
        $this->assign('where',$where);
        $this->assign(CouponModel::systemPage($where));
        return $this->fetch();
    }

    /**
     * @return mixed
     */
    public function create()
    {
        $this->assign(['title'=>'添加优惠券','action'=>Url::build('save'),'rules'=>$this->rules()->getContent()]);
        return $this->fetch('public/common_form');
    }

    /**
     * @return \think\response\Json
     */
    public function rules()
    {
        FormBuilder::text('title','优惠券名称');
        FormBuilder::number('coupon_price','优惠券面值',0)->min(0);
        FormBuilder::number('use_min_price','优惠券最低消费')->min(0);
        FormBuilder::number('coupon_time','优惠券有效期限')->min(0);
        FormBuilder::number('sort','排序');
        FormBuilder::radio('status','状态',[['label'=>'开启','value'=>1],['label'=>'关闭','value'=>0]],0);
        return FormBuilder::builder();
    }

    /**
     * @param Request $request
     * @return \think\response\Json
     */
    public function save(Request $request)
    {
        $data = Util::postMore([
            'title',
            'coupon_price',
            'use_min_price',
            'coupon_time',
            'sort',
            ['status',0]
        ],$request);
        if(!$data['title']) return Json::fail('请输入优惠券名称');
        if(!$data['coupon_price']) return Json::fail('请输入优惠券面值');
        if(!$data['coupon_time']) return Json::fail('请输入优惠券有效期限');
        $data['add_time'] = time();
        CouponModel::set($data);
        return Json::successful('添加优惠券成功!');
    }

    /**
     * 显示编辑资源表单页.
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function edit($id)
    {
        //
        $this->assign(['title'=>'编辑优惠券','rules'=>$this->read($id)->getContent(),'action'=>Url::build('update',array('id'=>$id))]);
        return $this->fetch('public/common_form');
    }

    /**
     * 显示指定的资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function read($id)
    {
        $coupon = CouponModel::get($id);
        if(!$coupon) return Json::fail('数据不存在!');
        FormBuilder::text('title','优惠券名称',$coupon->getData('title'));
        FormBuilder::number('coupon_price','优惠券面值',$coupon->getData('coupon_price'))->min(0);
        FormBuilder::number('use_min_price','优惠券最低消费',$coupon->getData('use_min_price'))->min(0);
        FormBuilder::number('coupon_time','优惠券有效期限',$coupon->getData('coupon_time'))->min(0);
        FormBuilder::number('sort','排序',$coupon->getData('sort'));
        FormBuilder::radio('status','状态',[['label'=>'开启','value'=>1],['label'=>'关闭','value'=>0]],$coupon->getData('status'));
        return FormBuilder::builder();
    }

    /**
     * 保存更新的资源
     *
     * @param  \think\Request  $request
     * @param  int  $id
     * @return \think\Response
     */
    public function update(Request $request, $id)
    {
        $data = Util::postMore([
            'title',
            'coupon_price',
            'use_min_price',
            'coupon_time',
            'sort',
            ['status',0]
        ],$request);
        if(!$data['title']) return Json::fail('请输入优惠券名称');
        if(!$data['coupon_price']) return Json::fail('请输入优惠券面值');
        if(!$data['coupon_time']) return Json::fail('请输入优惠券有效期限');
        CouponModel::edit($data,$id);
        return Json::successful('修改成功!');
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\Response
     */
    public function delete($id)
    {
        if(!$id) return Json::fail('数据不存在!');
        $data['is_del'] = 1;
        if(!CouponModel::edit($data,$id))
            return Json::fail(CouponModel::getErrorInfo('删除失败,请稍候再试!'));
        else
            return Json::successful('删除成功!');
    }

    /**
     * 修改优惠券状态
     * @param $id
     * @return \think\response\Json
     */
    public function status($id)
    {
        if(!$id) return Json::fail('数据不存在!');
        if(!CouponModel::editIsDel($id))
            return Json::fail(CouponModel::getErrorInfo('修改失败,请稍候再试!'));
        else
            return Json::successful('修改成功!');
    }

    /**
     * @return mixed
     */
    public function grant_subscribe(){
        $where = Util::getMore([
            ['status',''],
            ['title',''],
            ['is_del',0],
        ],$this->request);
        $this->assign('where',$where);
        $this->assign(CouponModel::systemPageCoupon($where));
        return $this->fetch();
    }

    /**
     * @return mixed
     */
    public function grant_all(){
        $where = Util::getMore([
            ['status',''],
            ['title',''],
            ['is_del',0],
        ],$this->request);
        $this->assign('where',$where);
        $this->assign(CouponModel::systemPageCoupon($where));
        return $this->fetch();
    }

    /**
     * @param $id
     */
    public function grant($id){
        $where = Util::getMore([
            ['status',''],
            ['title',''],
            ['is_del',0],
        ],$this->request);
        $nickname = UserModel::where('uid','IN',$id)->column('uid,nickname');
        $this->assign('where',$where);
        $this->assign('uid',$id);
        $this->assign('nickname',implode(',',$nickname));
        $this->assign(CouponModel::systemPageCoupon($where));
        return $this->fetch();
    }

    public function issue($id)
    {
        if(!CouponModel::be(['id'=>$id,'status'=>1,'is_del'=>0]))
            return $this->failed('发布的优惠劵已失效或不存在!');
        FormBuilder::text('id','优惠劵ID',$id)->disabled();
        FormBuilder::dateTimeRange('range_date','领取时间')->placeholder('不填为永久有效');
        FormBuilder::text('count','发布数量')->placeholder('不填或填0,为不限量');
        FormBuilder::radio('status','是否开启',[
            ['value'=>1,'label'=>'开启'],
            ['value'=>0,'label'=>'关闭']
        ],1);
        $this->assign(['title'=>'发布优惠券','rules'=>FormBuilder::builder()->getContent(),'action'=>Url::build('update_issue',array('id'=>$id))]);
        return $this->fetch('public/common_form');
    }

    public function update_issue(Request $request,$id)
    {
        list($_id,$rangeTime,$count,$status) = UtilService::postMore([
            'id',['range_date',['','']],['count',0],['status',0]
        ],$request,true);
        if($_id != $id) return JsonService::fail('操作失败,信息不对称');
        if(!$count) $count = 0;
        if(!CouponModel::be(['id'=>$id,'status'=>1,'is_del'=>0])) return JsonService::fail('发布的优惠劵已失效或不存在!');
        if(count($rangeTime)!=2) return JsonService::fail('请选择正确的时间区间');
        list($startTime,$endTime) = $rangeTime;
        if(!$startTime) $startTime = 0;
        if(!$endTime) $endTime = 0;
        if(!$startTime && $endTime) return JsonService::fail('请选择正确的开始时间');
        if($startTime && !$endTime) return JsonService::fail('请选择正确的结束时间');
        if(StoreCouponIssue::setIssue($id,$count,$startTime,$endTime,$count,$status))
            return JsonService::successful('发布优惠劵成功!');
        else
            return JsonService::fail('发布优惠劵失败!');
    }

    /**
     * 给分组用户发放优惠券
     */
    public function grant_group(){
        $where = Util::getMore([
            ['status',''],
            ['title',''],
            ['is_del',0],
        ],$this->request);
        $group = UserModel::getUserGroup();
        $this->assign('where',$where);
        $this->assign('group',json_encode($group));
        $this->assign(CouponModel::systemPageCoupon($where));
        return $this->fetch();
    }
    /**
     * 给标签用户发放优惠券
     */
    public function grant_tag(){
        $where = Util::getMore([
            ['status',''],
            ['title',''],
            ['is_del',0],
        ],$this->request);
        $tag = UserModel::getUserTag();;//获取所有标签
        $this->assign('where',$where);
        $this->assign('tag',json_encode($tag));
        $this->assign(CouponModel::systemPageCoupon($where));
        return $this->fetch();
    }
}
