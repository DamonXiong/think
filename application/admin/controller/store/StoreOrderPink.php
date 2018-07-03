think\facade\Request



namespace app\admin\controller\store;



use app\admin\controller\AuthController;

use app\admin\library\FormBuilder;

use app\admin\model\store\StoreOrderStatus;

use app\wap\model\store\StorePink;
use app\wap\model\user\User;

use app\wap\model\user\UserBill;

use basic\ModelBasic;

use behavior\wap\StoreProductBehavior;

use behavior\wechat\PaymentBehavior;

use EasyWeChat\Core\Exception;

use service\HookService;

use service\UtilService as Util;

use service\JsonService as Json;

use think\facade\Request;

use think\facade\Url;

use app\admin\model\store\StoreOrder as StoreOrderModel;



/**

 * 订单管理控制器

 * Class StoreOrder

 * @package app\admin\controller\store

 */

class StoreOrderPink extends AuthController

{



    /**

     * @return mixed

     */

    public function index()

    {

        $where = Util::getMore([

            ['status',''],
            ['data',''],

        ],$this->request);
        $this->assign('where',$where);
        $this->assign(StorePink::systemPage($where));
        return $this->fetch();

    }

    public function order_pink($id){
        if(!$id) return $this->failed('数据不存在');
        $StorePink = StorePink::getPinkUserOne($id);
        if(!$StorePink) return $this->failed('数据不存在!');
        $list = StorePink::getPinkMember($id);
        $list[] = $StorePink;
        $this->assign('list',$list);
        return $this->fetch();
    }



    /**

     * 修改支付金额等

     * @param $id

     * @return mixed|\think\facade\Response\Json|void

     */

    public function edit($id)

    {

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        $this->assign([

            'title'=>'修改订单','rules'=>$this->read($id)->getContent(),

            'action'=>Url::build('update',array('id'=>$id))

        ]);

        return $this->fetch('public/common_form');

    }

    public function read($id)

    {

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        FormBuilder::text('order_id','订单编号',$product->getData('order_id'))->readonly();

        FormBuilder::number('total_price','商品总价',$product->getData('total_price'))->min(0);

        FormBuilder::number('total_postage','原始邮费',$product->getData('total_postage'))->min(0);

        FormBuilder::number('pay_price','实际支付金额',$product->getData('pay_price'))->min(0);

        FormBuilder::number('pay_postage','实际支付邮费',$product->getData('pay_postage'))->min(0);

        FormBuilder::number('gain_integral','赠送积分',$product->getData('gain_integral'))->min(0);

        return FormBuilder::builder();

    }

    public function update(Request $request, $id)

    {

        $data = Util::postMore([

            'order_id',

            'total_price',

            'total_postage',

            'pay_price',

            'pay_postage',

            'gain_integral',

        ],$request);

        if($data['total_price'] <= 0) return Json::fail('请输入商品总价');

        if($data['pay_price'] <= 0) return Json::fail('请输入实际支付金额');

        $data['order_id'] = StoreOrderModel::changeOrderId($data['order_id']);

        StoreOrderModel::edit($data,$id);

        HookService::afterListen('store_product_order_edit',$data,$id,false,StoreProductBehavior::class);

        StoreOrderStatus::setStatus($id,'order_edit','修改商品总价为：'.$data['total_price'].' 实际支付金额'.$data['pay_price']);

        return Json::successful('修改成功!');

    }



    /**

     * 送货

     * @param $id

     *  send

     */

    public function delivery($id){

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        if($product['paid'] == 1 && $product['status'] == 0) {

            $this->assign([

                'title' => '送货信息', 'rules' => $this->readDelivery($id)->getContent(),

                'action' => Url::build('updateDelivery', array('id' => $id))

            ]);

            return $this->fetch('public/common_form');

        }

        else return Json::fail('数据不存在!');

    }

    public function readDelivery($id){

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        FormBuilder::text('delivery_name','送货人姓名');

        FormBuilder::text('delivery_id','送货人电话')->number();

        return FormBuilder::builder();

    }

    public function updateDelivery(Request $request, $id){

        $data = Util::postMore([

            'delivery_name',

            'delivery_id',

        ],$request);

        $data['delivery_type'] = 'send';

        if(!$data['delivery_name']) return Json::fail('请输入送货人姓名');

        if(!(int)$data['delivery_id']) return Json::fail('请输入送货人电话号码');

        else if(!preg_match("/^1[3456789]{1}\d{9}$/",$data['delivery_id']))  return Json::fail('请输入正确的送货人电话号码');

        $data['status'] = 1;

        StoreOrderModel::edit($data,$id);

        HookService::afterListen('store_product_order_delivery',$data,$id,false,StoreProductBehavior::class);

        StoreOrderStatus::setStatus($id,'delivery','已配送 发货人：'.$data['delivery_name'].' 发货人电话：'.$data['delivery_id']);

        return Json::successful('修改成功!');

    }



    /**

     * 发货

     * @param $id

     *  express

     */

    public function deliver_goods($id){

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        if($product['paid'] == 1 && $product['status'] == 0){

            $this->assign([

                'title'=>'发货信息','rules'=>$this->readDeliveryGoods($id)->getContent(),

                'action'=>Url::build('updateDeliveryGoods',array('id'=>$id))

            ]);

            return $this->fetch('public/common_form');

        }

        else return Json::fail('数据不存在!');

    }

    public function readDeliveryGoods($id){

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        FormBuilder::select('delivery_name','快递公司',function(){

            $list = db('express')->where('is_show',1)->column('id,name');

            $menus = [];

            foreach ($list as $k=>$v){

                $menus[] = ['value'=>$v,'label'=>$v];

            }

            return $menus;

        })->filterable();

        FormBuilder::text('delivery_id','快递单号');

        return FormBuilder::builder();

    }

    public function updateDeliveryGoods(Request $request, $id){

        $data = Util::postMore([

            'delivery_name',

            'delivery_id',

        ],$request);

        $data['delivery_type'] = 'express';

        if(!$data['delivery_name']) return Json::fail('请选择快递公司');

        if(!$data['delivery_id']) return Json::fail('请输入快递单号');

        $data['status'] = 1;

        StoreOrderModel::edit($data,$id);

        HookService::afterListen('store_product_order_delivery_goods',$data,$id,false,StoreProductBehavior::class);

        StoreOrderStatus::setStatus($id,'delivery_goods','已发货 快递公司：'.$data['delivery_name'].' 快递单号：'.$data['delivery_id']);

        return Json::successful('修改成功!');

    }



    /**

     * 修改状态为已收货

     * @param $id

     * @return \think\facade\Response\Json|void

     */

    public function take_delivery($id){

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        if($product['status'] == 2) return Json::fail('不能重复收货!');

        if($product['paid'] == 1 && $product['status'] == 1) $data['status'] = 2;

        else if($product['pay_type'] == 'offline') $data['status'] = 2;

        else return Json::fail('请先发货或者送货!');

        if(!StoreOrderModel::edit($data,$id))

            return Json::fail(StoreOrderModel::getErrorInfo('收货失败,请稍候再试!'));

        else{

            try{

                HookService::listen('store_product_order_take_delivery',$data,$id,false,StoreProductBehavior::class);

            }catch (Exception $e){

                return Json::fail($e->getMessage());

            }

            StoreOrderStatus::setStatus($id,'take_delivery','已收货');

            return Json::successful('收货成功!');

        }



    }



    /**

     * 修改退款状态

     * @param $id

     * @return \think\facade\Response\Json|void

     */

    public function refund_y($id){

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        if($product['paid'] == 1){

            $this->assign([

                'title'=>'退款','rules'=>$this->readRefundY($id)->getContent(),

                'action'=>Url::build('updateRefundY',array('id'=>$id))

            ]);

            return $this->fetch('public/common_form');

        }

        else return Json::fail('数据不存在!');

    }

    public function readRefundY($id){

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        FormBuilder::text('order_id','退款单号',$product->getData('order_id'))->readonly();

        FormBuilder::number('refund_price','退款金额',$product->getData('pay_price'))->min(0);

        FormBuilder::radio('type','状态',[['label'=>'直接退款','value'=>1],['label'=>'退款后,返回原状态','value'=>2]],1);

        return FormBuilder::builder();

    }

    public function updateRefundY(Request $request, $id){

        $data = Util::postMore([

            'refund_price',

            ['type',1],

        ],$request);

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        if($product['pay_price'] == $product['refund_price']) return Json::fail('已退完支付金额!不能再退款了');

        if(!$data['refund_price']) return Json::fail('请输入退款金额');

        $refund_price = $data['refund_price'];

        $data['refund_price'] = bcadd($data['refund_price'],$product['refund_price'],2);

        $bj = bccomp((float)$product['pay_price'],(float)$data['refund_price'],2);

        if($bj < 0) return Json::fail('退款金额大于支付金额，请修改退款金额');

        if($data['type'] == 1){

            $data['refund_status'] = 2;

        }else if($data['type'] == 2){

            $data['refund_status'] = 0;

        }

        $type =  $data['type'];

        unset($data['type']);

        $refund_data['pay_price'] = $product['pay_price'];

        $refund_data['refund_price'] = $refund_price;

        if($product['pay_type'] == 'weixin'){

            try{

                HookService::listen('wechat_pay_order_refund',$product['order_id'],$refund_data,true,PaymentBehavior::class);

            }catch(\Exception $e){

                return Json::fail($e->getMessage());

            }

        }else if($product['pay_type'] == 'yue'){

            ModelBasic::beginTrans();

            $res1 = User::bcInc($product['uid'],'now_money',$refund_price,'uid');

            $res2 = $res2 = UserBill::income('商品退款',$product['uid'],'now_money','pay_product_refund',$refund_price,$product['id'],$product['pay_price'],'订单退款到余额'.floatval($refund_price).'元');

            try{

                HookService::listen('store_order_yue_refund',$product,$refund_data,false,StoreProductBehavior::class);

            }catch (\Exception $e){

                ModelBasic::rollbackTrans();

                return Json::fail($e->getMessage());

            }

            $res = $res1 && $res2;

            ModelBasic::checkTrans($res);

            if(!$res) return Json::fail('余额退款失败!');

        }

        StoreOrderModel::edit($data,$id);

        $data['type'] = $type;

        HookService::afterListen('store_product_order_refund_y',$data,$id,false,StoreProductBehavior::class);

        StoreOrderStatus::setStatus($id,'refund_price','退款给用户'.$refund_price.'元');

        return Json::successful('修改成功!');

    }



    /**

     * 修改配送信息

     * @param $id

     * @return mixed|\think\facade\Response\Json|void

     */

    public function distribution($id){

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        $this->assign([

            'title'=>'配送信息','rules'=>$this->readDistribution($id)->getContent(),

            'action'=>Url::build('updateDistribution',array('id'=>$id))

        ]);

        return $this->fetch('public/common_form');

    }

    public function readDistribution($id){

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        if($product['delivery_type'] == 'send'){

            FormBuilder::text('delivery_name','送货人姓名',$product->getData('delivery_name'));

            FormBuilder::text('delivery_id','送货人电话',$product->getData('delivery_id'))->number();

        }else if($product['delivery_type'] == 'express'){

            FormBuilder::select('delivery_name','快递公司',function(){

                $list = db('express')->where('is_show',1)->column('id,name');

                $menus = [];

                foreach ($list as $k=>$v){

                    $menus[] = ['value'=>$v,'label'=>$v];

                }

                return $menus;

            },$product->getData('delivery_name'))->filterable();

            FormBuilder::text('delivery_id','快递单号',$product->getData('delivery_id'));

        }

        return FormBuilder::builder();

    }

    public function updateDistribution(Request $request, $id){

        $data = Util::postMore([

            'delivery_name',

            'delivery_id',

        ],$request);

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        if($product['delivery_type'] == 'send'){

            if(!$data['delivery_name']) return Json::fail('请输入送货人姓名');

            if(!(int)$data['delivery_id']) return Json::fail('请输入送货人电话号码');

            else if(!preg_match("/^1[3456789]{1}\d{9}$/",$data['delivery_id']))  return Json::fail('请输入正确的送货人电话号码');

        }else if($product['delivery_type'] == 'express'){

            if(!$data['delivery_name']) return Json::fail('请选择快递公司');

            if(!$data['delivery_id']) return Json::fail('请输入快递单号');

        }

        StoreOrderModel::edit($data,$id);

        HookService::afterListen('store_product_order_distribution',$data,$id,false,StoreProductBehavior::class);

        StoreOrderStatus::setStatus($id,'distribution','修改发货信息为'.$data['delivery_name'].'号'.$data['delivery_id']);

        return Json::successful('修改成功!');

    }



    /**

     * 修改退款状态

     * @param $id

     * @return mixed|\think\facade\Response\Json|void

     */

    public function refund_n($id){

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        $this->assign([

            'title'=>'退款','rules'=>$this->readRefundN($id)->getContent(),

            'action'=>Url::build('updateRefundN',array('id'=>$id))

        ]);

        return $this->fetch('public/common_form');

    }

    public function readRefundN($id){

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        FormBuilder::text('order_id','退款单号',$product->getData('order_id'))->readonly();

        FormBuilder::textarea('refund_reason','退款原因');

        return FormBuilder::builder();

    }

    public function updateRefundN(Request $request, $id){

        $data = Util::postMore([

            'refund_reason',

        ],$request);

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        if(!$data['refund_reason']) return Json::fail('请输入退款原因');

        $data['refund_status'] = 0;

        StoreOrderModel::edit($data,$id);

        HookService::afterListen('store_product_order_refund_n',$data['refund_reason'],$id,false,StoreProductBehavior::class);

        StoreOrderStatus::setStatus($id,'refund_n','不退款原因:'.$data['refund_reason']);

        return Json::successful('修改成功!');

    }



    /**

     * 立即支付

     * @param $id

     */

    public function offline($id){

        $res = StoreOrderModel::updateOffline($id);

        if($res){

            try{

                HookService::listen('store_product_order_offline',$id,false,StoreProductBehavior::class);

            }catch (Exception $e){

                return Json::fail($e->getMessage());

            }

            StoreOrderStatus::setStatus($id,'offline','线下付款');

            return Json::successful('修改成功!');

        }else{

            return Json::fail('修改失败!');

        }

    }


    /**
     * 修改积分和金额
     * @param $id
     * @return mixed|\think\facade\Response\Json|void
     */
    public function integral_back($id){
        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        if($product['paid'] == 1){
            $this->assign([

                'title'=>'退积分','rules'=>$this->readIntegralBack($id)->getContent(),

                'action'=>Url::build('updateIntegralBack',array('id'=>$id))

            ]);
        }else{
            return Json::fail('参数错误!');
        }

        return $this->fetch('public/common_form');
    }

    public function readIntegralBack($id){

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        FormBuilder::text('order_id','退积分单号',$product->getData('order_id'))->readonly();

        FormBuilder::number('back_integral','退积分')->min(0);

        return FormBuilder::builder();

    }

    public function updateIntegralBack(Request $request, $id){

        $data = Util::postMore([

            'back_integral',

        ],$request);

        if(!$id) return $this->failed('数据不存在');

        $product = StoreOrderModel::get($id);

        if(!$product) return Json::fail('数据不存在!');

        if($data['back_integral'] <= 0) return Json::fail('请输入积分');

        if($product['use_integral'] == $product['back_integral']) return Json::fail('已退完积分!不能再积分了');

        $back_integral = $data['back_integral'];

        $data['back_integral'] = bcadd($data['back_integral'],$product['back_integral'],2);

        $bj = bccomp((float)$product['use_integral'],(float)$data['back_integral'],2);

        if($bj < 0) return Json::fail('退积分大于支付积分，请修改退积分');

        ModelBasic::beginTrans();

        $res1 = User::bcInc($product['uid'],'integral',$back_integral,'uid');

        $res2 = UserBill::income('商品退积分',$product['uid'],'integral','pay_product_integral_back',$back_integral,$product['id'],$product['pay_price'],'订单退积分'.floatval($back_integral).'积分到用户积分');

        try{

            HookService::listen('store_order_integral_back',$product,$back_integral,false,StoreProductBehavior::class);

        }catch (\Exception $e){

            ModelBasic::rollbackTrans();

            return Json::fail($e->getMessage());

        }

        $res = $res1 && $res2;

        ModelBasic::checkTrans($res);

        if(!$res) return Json::fail('退积分失败!');

        StoreOrderModel::edit($data,$id);

        StoreOrderStatus::setStatus($id,'integral_back','商品退积分：'.$data['back_integral']);

        return Json::successful('退积分成功!');

    }

    public function remark(Request $request){
        $data = Util::postMore(['id','remark'],$request);
        if(!$data['id']) return Json::fail('参数错误!');
        if($data['remark'] == '')  return Json::fail('请输入要备注的内容!');
        $id = $data['id'];
        unset($data['id']);
        StoreOrderModel::edit($data,$id);
        return Json::successful('备注成功!');
    }

    public function order_status($oid){
       if(!$oid) return $this->failed('数据不存在');
       $this->assign(StoreOrderStatus::systemPage($oid));
       return $this->fetch();
    }
}

