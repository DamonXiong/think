{extend name="public/container"}
{block name="title"}订单详情{/block}
{block name="content"}
<div id="user-order" class="user-order-con">
    <section>
        <div class="coc-header send clearfix">
            <div class="logistics-state {$order._status._class} fl"></div>
            <div class="logistics-info fr">
                <div class="logistics-info-txt">
                    <p>{$order._status._title}</p>
                    {if condition="$order['pink_id']"}
                        {if condition="isPinkStatus($order['pink_id'])"}
                        <span>{$order._status._msg}</span>
                        {else/}
                        <span>拼团活动已经结束</span>
                        {/if}
                    {else/}
                    <span>{$order._status._msg}</span>
                    {/if}
                </div>
            </div>
        </div>
        <div class="adderss-info">
            <i class="iconfont icon-dizhi1"></i>
            <div class="content">
                <p>{$order.real_name} {$order.user_phone}</p>
                <p class="address-content">{$order.user_address}</p>
            </div>
        </div>
        {egt name="order._status._type" value="2"}
        <div class="item-block delivery-infos">
            <div class="con-tit">配送信息</div>
            <div class="delivery-con">
                <ul>
                    <li>配送方式：{$order._status._deliveryType}</li>
                    {eq name="order.delivery_type" value="express"}
                    <li>快递公司：{$order.delivery_name}</li>
                    <li>快递单号：{$order.delivery_id}</li>
                    {/eq}
                    {eq name="order.delivery_type" value="send"}
                    <li>配送人员：{$order.delivery_name}</li>
                    <li>联系电话：<a class="tel" href="tel:{$order.delivery_id}">{$order.delivery_id}</a> <i class="icon-tel"></i></li>
                    {/eq}
                </ul>
            </div>
        </div>
        {/egt}
        <div class="item-block product-info">
            <div class="con-tit">产品信息</div>
            <div class="delivery-con">
                <ul>
                    {volist name="order.cartInfo" id="cart"}
                    <li>
                        <a class="flex" href="javascript:void(0);">
                            <div class="picture"><img @click.stop="toProductUrl('{$cart.productInfo.id}')" src="{$cart.productInfo.image}" /></div>
                            <div class="info-centent flex">
                                <p class="name">{$cart.productInfo.store_name}</p>
                                <p class="description"><?=isset($cart['productInfo']['attrInfo']) ? $cart['productInfo']['attrInfo']['suk'] : ''?></p>
                                <p class="count"><span>￥{$cart.truePrice}</span> X{$cart.cart_num}</p>
                            </div>
                        </a>
                        {eq name="order._status._type" value="3"}
                        <?php if(!\app\wap\model\store\StoreProductReply::isReply($cart['unique'],'product')): ?>
                            <div class="assess status-on">
                                <a href="javascript:void(0);" @click="goReply('{$cart.unique}')">评价</a>
                            </div>
                        <?php endif; ?>
                        {/eq}
                    </li>
                    {/volist}
                </ul>
            </div>
            <div class="all-price">
                <div class="infos">
                    {gt name="order.total_postage" value="0"}
                    <p>运费 <span class="fr">￥{$order.total_postage}</span></p>
                    {/gt}
                    <p>商品总价 <span class="fr">￥{$order.total_price}</span></p>
                    {gt name="order.coupon_price" value="0"}
                    <p class="deb">优惠 <span class="fr">-￥{$order.coupon_price}</span></p>
                    {/gt}
                    {gt name="order.deduction_price" value="0"}
                    <p class="deb">积分抵扣 <span class="fr">-￥{$order.deduction_price}</span></p>
                    {/gt}
                </div>
                <div class="all-count">实付款 <span class="fr">￥{$order.pay_price}</span></div>
            </div>
        </div>
        <div class="item-block delivery-infos">
            <div class="con-tit">订单信息</div>
            <div class="delivery-con">
                <ul>
                    <li>订单编号：{$order.order_id}</li>
                    <li>下单时间：{$order.add_time|date="Y-m-d H:i",###}</li>
                    <li>支付方式：{$order._status._payType}</li>
                    <li>支付状态：{$order.paid == 1 ? '已支付' : '未支付'}</li>
                    {eq name="order.paid" value="1"}
                    <li>支付时间：{$order.pay_time|date="Y-m-d H:i",###}</li>
                    {/eq}
                </ul>
            </div>
        </div>
        <?php if(($order['_status']['_type'] != -1 && $order['_status']['_type'] != 3 && $order['pay_type'] != 'offline') || ($order['pay_type'] == 'offline' && ($order['status'] == 1 || $order['status'] > 2))): ?>
            <div style="height:1rem"></div>
            <div class="order-con-btn">
                <?php if($order['_status']['_type'] != 2): ?>
                    <span class="more-menu" @click.self="showMenu = !showMenu">
                    更多
                    <ul :class="{active:showMenu == true}">
                        <?php if($order['_status']['_type'] == 0 || $order['_status']['_type'] == 4 || $order['_status']['_type'] == -2){ ?>
                            <li><a href="javascript:void(0);" @click="removeOrder">删除订单</a></li>
                        <?php }else if($order['_status']['_type'] != 2 && $order['_status']['_type'] != 3 && $order['_status']['_type'] != -1){ ?>
                            <li><a href="javascript:void(0);" @click="applyRefundOrder">申请退款</a></li>
                        <?php } ?>
                    </ul>
                    </span>
                <?php endif; ?>
                {if condition="$order['pink_id']"}
                <a href="javascript:void(0);" @click="LinkPink({$order.pink_id})"><span class="delete-order">查看拼团</span></a>
                {/if}
                <?php if($order['_status']['_type'] == 0){ ?>
                    <a class="payment" href="javascript:void(0);" @click="confirm">立即付款</a>
                <?php }else if($order['_status']['_type'] == 2){ ?>
                     {eq name="order.delivery_type" value="express"}
                    <a href="{:url('express',['uni'=>$order['order_id']])}"><span class="delete-order">查询快递</span></a>
                    {/eq}
                    <a class="payment" href="javascript:void(0);" @click="userTake">确认收货</a>
                <?php } ?>
            </div>
        <?php endif; ?>
        {eq name="order._status._type" value="3"}
            <div style="height:1rem"></div>
            <div class="order-con-btn">
                <a class="payment" href="javascript:void(0);" @click="goDetails">再来一单</a>
            </div>
        {/eq}
    </section>
</div>
<script type="text/javascript">
    requirejs(['vue','store','helper','layer'],function(Vue,storeApi,$h,layer){

        new Vue({
            el:"#user-order",
            data:{
                orderId:'<?=$order['order_id']?>',
                payType:'<?=$order['pay_type']?>',
                showMenu:false
            },
            methods:{
                toProductUrl:function(id){
                    location.href = $h.U({c:'store',a:'detail',p:{id:id}});
                },
                goDetails:function () {
                    that = this;
                    storeApi.orderDetails(that.orderId,function(res){
                        if(res.data.code == 200){
                            var cartId = res.data.data;
                            location.href = $h.U({
                                c: 'store',
                                a: 'confirm_order',
                                p: {cartId: cartId}
                            });
                        }else{
                            $h.pushMsg(res.data.msg);
                        }
                    },function(res){
                        $h.pushMsg(res.msg);
                    });
                },
                applyRefundOrder:function(){
                    var that = this;
                    layer.confirm('确定申请退款?',{icon:3},function(index){
                        layer.close(index);
                        require(['wap/crmeb/module/refund-reason'],function($r){
                            Vue.use($r);
                            that.$orderRefundReason(function(msg){
                                $h.load();
                                storeApi.orderApplyRefund(that.orderId,msg,function(res){
                                    $h.loadClear();
                                    $h.pushMsg('申请退款成功!',function(){
                                        location.reload(true);
                                    });
                                },function(){ $h.loadClear(); return true; });
                            });
                        });
                    });
                },
                removeOrder:function(){
                    var that = this;
                    layer.confirm('确定删除该订单?',{icon:3},function(index){
                        layer.close(index);
                        $h.loadFFF();
                        storeApi.removeUserOrder(that.orderId,function(){
                            $h.loadClear();
                            $h.pushMsg('删除成功',function(){
                                location.replace($h.U({
                                    c:'my',
                                    a:'order_list'
                                }));
                            });
                        });
                    })
                },
                confirm:function(){
                    if(this.payType == 'yue')
                        layer.confirm('确定使用余额支付?',{icon:3},this.goPay);
                    else if(this.payType == 'offline')
                        layer.confirm('确定使用线下付款方式支付?',{icon:3},this.goPay);
                    else
                        this.goPay();
                },
                LinkPink:function (pink_id) {
                    location.href = $h.U({
                        c:'my',
                        a:'order_pink',
                        p:{id:pink_id}
                    });
                },
                goPay:function(){
                    $h.loadFFF();
                    storeApi.payOrder(this.orderId,function(res){
                        $h.loadClear();
                        var data = res.data;
                        if(data.data.status == 'WECHAT_PAY'){
                            mapleWx($jssdk(),function(){
                                this.chooseWXPay(data.data.result.jsConfig,function(){
                                    $h.pushMsg('支付成功',function(){
                                        location.reload(true);
                                    })
                                },{
                                    fail:function(){ $h.pushMsg('已取消支付');},
                                    cancel:function(){ $h.pushMsg('已取消支付');}
                                });
                            });
                        }else{
                            $h.pushMsg(data.msg,function(){
                                location.reload(true);
                            });
                        }
                    },function(e){ $h.loadClear(); return true; })
                },
                userTake:function(){
                    var that = this;
                    layer.confirm('确定立即收货?',{icon:3},function(index){
                        layer.close(index);
                        $h.loadFFF();
                        storeApi.userTakeOrder(that.orderId,function(){
                            $h.loadClear();
                            $h.pushMsg('收货成功',function(){
                                location.reload(true);
                            });
                        },function(e){ $h.loadClear(); return true; });
                    })
                },
                goReply:function(unique){
                    location.href = $h.U({
                        c:'my',
                        a:'order_reply',
                        p:{unique:unique}
                    });
                }
            },
            mounted:function () {
                vm = this;
            }
        })
    });
</script>
{/block}