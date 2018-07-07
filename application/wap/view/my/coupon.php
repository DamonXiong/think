{extend name="public/container"}
{block name="title"}我的优惠劵{/block}
{block name="content"}
<div class="discount-list" >
    <section>
        <header class="flex coupon-menu" style="z-index: 999;">
            <a class="item on" data-type="" href="javascript:void(0);">全部</a>
            <a class="item" data-type="new" href="javascript:void(0);">未使用</a>
            <a class="item" data-type="use" href="javascript:void(0);">已使用</a>
            <a class="item" data-type="overdug" href="javascript:void(0);">已过期</a>
        </header>
        <div class="list-box" style="margin-bottom: .3rem;">
            {empty name="couponList"}
            <div class="empty">
                <img src="/public/wap/crmeb/images/empty_coupon.png">
                <p>暂无有效优惠券</p>
            </div>
            {else/}
            <ul>
                {volist name="couponList" id="vo"}
                <li class="coupon-item
                {eq name='vo._type' value='0'}overdug{/eq}
                {neq name='vo._type' value='0'}new{/neq}">
                    <div class="txt-info">
                        <div class="con-cell">
                            <p>满{$vo.use_min_price}元可用现金券</p>
                            <span>{$vo._add_time}至{$vo._end_time}使用</span>
                        </div>
                    </div>
                    <div class="price">
                        <span>￥</span>{$vo.coupon_price}
                        <p><a href="javascript:void(0);">{$vo._msg}</a></p>
                    </div>
                    {eq name='vo._type' value='2'}<span class="text-icon"></span>{/eq}
                </li>
                {/volist}
            </ul>
            {/empty}
        </div>
    </section>
</div>
<script>
    (function(){
        $('.coupon-menu .item').on('click',function(){
            var that = $(this),type = that.data('type');
            $('.list-box .coupon-item').hide();
            if(type){
                $('.list-box .coupon-item.'+type).show();
            }else{
                $('.list-box .coupon-item').show();
            }
            that.addClass('on').siblings().removeClass('on');
        });
    })();
</script>
{/block}