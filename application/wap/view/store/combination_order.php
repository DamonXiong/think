{extend name="public/container"}
{block name="title"}提交订单{/block}
{block name="content"}
<div id="order-confirm" class="order-confirm">
    <section>
        <div class="user-address" @click="showAddressList">
            <i class="icon add"></i>
            <div class="txt-box" v-if="address !== null" v-cloak>
                <p class="name"><span v-text="address.real_name"></span> <span class="tel" v-text="address.phone"></span></p>
                <p v-text="addressDetail"></p>
            </div>
            <div class="txt-box" v-if="address === null">
                <p class="name"><span>请选择收货地址</span></p>
            </div>
        </div>
        <div class="integ-order-info">
            <div class="titles">商品信息</div>
            <div class="integ-order-pro">
                <?php $goodsNum = 0; ?>
                {volist name="cartInfo" id="vo"}
                <?php $goodsNum += $vo['cart_num']; ?>
                <div class="item clearfix">
                    <div class="img fl"><img src="{$vo.productInfo.image}"></div>
                    <div class="infos fr">
                        <p class="name">{$vo.productInfo.store_name}</p>
                        <p class="shux"><span><?php if(isset($vo['productInfo']['attrInfo'])){ echo $vo['productInfo']['attrInfo']['suk'];} ?></span></p>
                        <p class="count">￥{$vo.truePrice}<span class="fr">X{$vo.cart_num}</span></p>
                    </div>
                </div>
                {/volist}
            </div>
            <ul class="parameter">
                <li class="flex">
                    <div class="txt">
                        配送费
                        <p v-show="priceGroup.storeFreePostage > 0 && postageMsg == priceGroup.storePostage" v-cloak="">满￥{{priceGroup.storeFreePostage}}元免配送费</p>
                    </div>
                    <a href="javascript:void(0);" v-cloak="">{{postageMsg}}</a>
                </li>
                <li class="flex">
                    <div class="txt">
                        优惠券
                    </div>
                        <a class="select-txt" href="javascript:void(0);">
                            <span @click.self="showCoupon" v-if="coupon == null">无优惠券</span>
                            <span style="color: #ff8d10;" v-else v-cloak="" @click="showCoupon">-￥{{coupon.coupon_price}}
                                <span style="color: #666;margin: 0 .1rem;" @click.stop="coupon = null">取消使用</span>
                            </span>
                        </a>
                </li>
                <li>
                    <div class="title"> <span class="no_check_title" v-show="useIntegral != true">积分抵扣</span> <span class="checked_title"  v-show="useIntegral == true" v-cloak="">可用积分: {$userInfo.integral|floatval}</span>
                        <input type="checkbox" id="integral-btn" class="regular-checkbox">
                        <label for="integral-btn" class="check_btn" style="float: right;" @click="useIntegral = !useIntegral"> </label>
                    </div>
                </li>
                <li class="flex">
                    <div class="txt">
                        备注
                    </div>
                    <input type="text" v-model="payMark" placeholder="请填写自己需要注明的信息..."/>
                </li>
            </ul>
            <div class="all-price">共{$goodsNum}件商品  小计: <span v-text="priceGroup.totalPrice">计算中</span>元</div>
        </div>
        <div class="comfirm-wrapper">
            <p class="Recharge-top">支付方式</p>
            <div class="Refund-list">
                <input type="radio" name="pay_type" v-model="payType" value="weixin" class="regular-checkbox">
                <label for="checkbox-1-1" class="skin-lable" @click="payType = 'weixin'"></label>
                <div class="passenger-list no-bbm">
                    <p class="p-name"><i class="bank-icon icon-weixin"></i>微信支付</p>
                </div>
            </div>
            <div class="Refund-list">
                <input type="radio" name="pay_type" v-model="payType" value="yue" class="regular-checkbox">
                <label for="checkbox-1-1" class="skin-lable" @click="payType = 'yue'"></label>
                <div class="passenger-list no-bbm">
                    <p class="p-name"><i class="bank-icon" style="background-image: url({__WAP_PATH}crmeb/images/yue02.png);"></i>余额支付<em>可用余额{$userInfo.now_money|floatval}</em></p>
                </div>
            </div>
            <!--<div class="Refund-list">
                <input type="radio" name="pay_type" v-model="payType" value="offline" class="regular-checkbox">
                <label for="checkbox-1-1" class="skin-lable" @click="payType = 'offline'"></label>
                <div class="passenger-list no-bbm">
                    <p class="p-name"><i class="bank-icon" style="background-image: url({__WAP_PATH}crmeb/images/xianxia02.png);"></i>线下付款</p>
                </div>
            </div>-->
        </div>
        <div style="height: 1rem;"></div>
        <div class="cart-calc02"><div class="select-all">应付:<span>￥<span id="jprice" v-text="totalPrice">计算中</span><span id="integral_price" v-show="deduction > 0" v-cloak=""> - {{deduction}}</span></span></div> <a id="jsubmit" href="javascript:void(0);" @click="submit">订单结算</a></div>
    </section>
</div>
<script>
    (function(){
        var $cartInfo = <?php echo json_encode($cartInfo); ?>;
        var $priceGroup = <?php echo json_encode($priceGroup); ?>;
        var $offlinePostage = <?=$offlinePostage?>;
        var $totalIntegral = <?=$userInfo['integral']?>|| 0;
        var $integralRatio = <?=$integralRatio?> || 0 ;
        var $key = '<?=$orderKey?>';
        var $pinkId = '<?=$pinkId?>';

        requirejs(['vue','store','helper','wap/crmeb/module/store/use-coupon','wap/crmeb/module/store/use-address','layer'],function(Vue,storeApi,$h,useCoupon,useAddress,layer){
            Vue.use(useCoupon);
            Vue.use(useAddress);



            new Vue({
                el:"#order-confirm",
                data:{
                    cartInfo:$cartInfo,
                    priceGroup:$priceGroup,
                    pinkId:$pinkId,
                    coupon:null,
                    useCoupon:null,
                    useIntegral:false,
                    offlinePostage:$offlinePostage,
                    payType:'weixin',
                    payMark:'',
                    address:null,
                    orderId:null
                },
                computed:{
                    addressDetail:function(){
                        if(this.address == null)
                            return '';
                        else
                            return this.address.province +' '+this.address.city+' '+this.address.district +' '+this.address.detail
                    },
                    totalPrice:function(){
                        var totalPrice = this.priceGroup.totalPrice;
                        if(this.coupon!==null) totalPrice = $h.Sub(totalPrice,this.coupon.coupon_price);
                        if(totalPrice<0) totalPrice = 0;
                        return this.payType == 'offline' && this.offlinePostage == 1 ? totalPrice : $h.Add(totalPrice,this.priceGroup.storePostage);
                    },
                    postageMsg:function(){
                        if(this.payType == 'offline' && this.offlinePostage == 1) return '线下付款免邮费';
                        if(0 == this.priceGroup.storePostage) return '包邮';
                        return this.priceGroup.storePostage;
                    },
                    deduction:function(){
                        if(this.useIntegral && $totalIntegral>0 && $integralRatio>0){
                            var total = $h.Mul($totalIntegral,$integralRatio),totalPrice = this.totalPrice;
                            return totalPrice < total ? totalPrice : total;
                        }else{
                            return 0;
                        }
                    }
                },
                methods:{
                    showAddressList:function(){
                        var that = this;
                        this.$useAddress({
                            onSelect:function(id,address){
                                that.address = address;
                            },
                            checked:that.address != null && that.address.id
                        })
                    },
                    wechatPay:function(config){
                        var that = this;
                        mapleWx($jssdk(),function(){
                           this.chooseWXPay(config,function(){
                               that.successOrder();
                           },{
                               fail:that.extendOrder,
                               cancel:that.extendOrder
                           });
                        });
                    },
                    extendOrder:function(){
                        location.replace($h.U({
                            c:'my',
                            a:'order',
                            p:{uni:this.orderId == null ? $key : this.orderId}
                        }));
                    },
                    successOrder:function(){
                        location.replace($h.U({
                            c:'my',
                            a:'order',
                            p:{uni:this.orderId == null ? $key : this.orderId}
                        }));
                    },
                    goPay:function(){
                        var that = this;
                        var combinationId = 0;
                        $.each(that.cartInfo,function (index,item) {
                            combinationId = item.combination_id;
                        })
                        $h.load();
                        storeApi.submitOrder($key,{
                            addressId:this.address.id,
                            couponId:this.coupon == null ? '' : this.coupon.id,
                            mark:this.payMark,
                            payType:this.payType,
                            pinkId:this.pinkId,
                            combinationId:combinationId,
                            useIntegral:this.useIntegral
                        },function(res){
                            that.$set(that,'orderId',res.data.data.result.orderId);
                            $h.loadClear();
                            if(res.data.data.status == 'WECHAT_PAY'){
                                that.wechatPay(res.data.data.result.jsConfig);
                            }else if(res.data.data.status == 'SUCCESS'){
                                $h.pushMsgOnce(res.data.msg,function(){
                                    that.successOrder();
                                });
                            }else{
                                $h.pushMsgOnce(res.data.msg,function(){
                                    that.extendOrder();
                                });
                            }
                        });
                    },
                    submit:function(){
                        if(this.address == null)
                            return $h.returnErrorMsg('请选择收货地址!');
                        if(this.payType == 'yue')
                            layer.confirm('确定使用余额支付?',{icon:3},this.goPay);
                        else if(this.payType == 'offline')
                            layer.confirm('确定使用线下付款方式支付?',{icon:3},this.goPay);
                        else
                            this.goPay();
                    },
                    showCoupon:function(){
                        setTimeout(this.useCoupon.active,0);
                    },
                    selectCoupon:function(coupon){
                        this.$set(this,'coupon',coupon);
                    }
                },
                mounted:function(){
                    var that = this;
                    this.useCoupon = this.$useCoupon(this.priceGroup.totalPrice,{
                        onSelect:this.selectCoupon
                    });
                    storeApi.getUserDefaultAddress(function(res){
                        if(res.data.msg == 'ok') that.$set(that,'address',res.data.data);
                    });
                }
            });
        });
    })();
</script>
{/block}