{extend name="public/container"}
{block name="title"}个人中心{/block}
{block name="content"}
<div class="user">
    <section>
        <header>
            <div class="user-wrapper flex">
                <div class="user-info-wrapper flex">
                    <div class="avatar"><img src="{$userInfo.avatar}" /></div>
                    <div class="user-info">
                        <p class="name">{$userInfo.nickname}</p>
                        <p class="time">注册时间：{$userInfo.add_time|date="Y-m-d"}</p>
                    </div>
                </div>
                <div class="user-btn flex">
                    <a class="icon-mail" href="{:Url('notice')}">{if condition="$notice > 0"}<i>{$notice}</i>{/if}</a>
                </div>
            </div>
            <div class="user-price flex">
                <div class="item">
                    <a href="/wap/my/integral.html" style="color: #fff;">
                        <span>{$userInfo.integral|floatval}</span>
                        <p>我的积分</p>
                    </a>
                </div>
                <div class="item">
                    <a href="/wap/my/coupon.html" style="color: #fff;">
                    <span><?=\app\wap\model\store\StoreCouponUser::getUserValidCouponCount($userInfo['uid'])?></span>
                    <p>我的优惠券</p>
                    </a>
                </div>
            </div>
        </header>
        <div class="user-orders">
            <?php $orderListUrl = Url('my/order_list'); ?>
            <div class="title flex">
                <i class="iconfont icon-dingdan"></i>
                <span>全部订单</span>
                <a class="flex" href="{$orderListUrl}">查看全部</a>
            </div>
            <div class="user-orders-list flex">
                <a href="{$orderListUrl}#0">
                    {gt name="orderStatusNum.noBuy" value="0"}
                    <i class="mark_num">{$orderStatusNum.noBuy > 99 ? 99 : $orderStatusNum.noBuy}</i>
                    {/gt}
                    <img src="{__WAP_PATH}crmeb/images/user-orders-list001.png" />
                    <p>待付款</p>
                </a>
                 <a href="{$orderListUrl}#11">
                      {gt name="orderStatusNum.noPink" value="0"}
                      <i class="mark_num">{$orderStatusNum.noPink > 99 ? 99 : $orderStatusNum.noPink}</i>
                      {/gt}
                      <img src="{__WAP_PATH}crmeb/images/user-orders-list005.png" />
                      <p>团购中</p>
                  </a>
                <a href="{$orderListUrl}#1">
                    {gt name="orderStatusNum.noPostage" value="0"}
                    <i class="mark_num">{$orderStatusNum.noPostage > 99 ? 99 : $orderStatusNum.noPostage}</i>
                    {/gt}
                    <img src="{__WAP_PATH}crmeb/images/user-orders-list002.png" />
                    <p>待发货</p>
                </a>
                <a href="{$orderListUrl}#2">
                    {gt name="orderStatusNum.noTake" value="0"}
                    <i class="mark_num">{$orderStatusNum.noTake > 99 ? 99 : $orderStatusNum.noTake}</i>
                    {/gt}
                    <img src="{__WAP_PATH}crmeb/images/user-orders-list003.png" />
                    <p>待收货</p>
                </a>
                <a href="{$orderListUrl}#3">
                    {gt name="orderStatusNum.noReply" value="0"}
                    <i class="mark_num">{$orderStatusNum.noReply > 99 ? 99 : $orderStatusNum.noReply}</i>
                    {/gt}
                    <img src="{__WAP_PATH}crmeb/images/user-orders-list004.png" />
                    <p>待评价</p>
                </a>
            </div>
        </div>
        <div class="user-service-list flex">
            {volist name="menus" id="vo"}
            <div class="item">
                <a class="con-cell" href="{$vo.url}">
                    <img src="{$vo.icon|unThumb}" alt="" />
                    <p>{$vo.name}</p>
                </a>
            </div>
            {/volist}
            {eq name="userInfo.is_promoter" value="1"}
            <?php /*  <div class="item">
                  <a class="con-cell" href="/wap/my/user_pro.html">
                      <img src="/public/uploads/common/5abc57ea40c8c.png" alt="">
                      <p>我的余额</p>
                  </a>
              </div>  */ ?>
            <div class="item">
                <a class="con-cell" href="/wap/my/spread_list.html">
                    <img src="/public/uploads/common/5abc5804670d2.png" alt="">
                    <p>我的推广人</p>
                </a>
            </div>
            <div class="item">
                <a class="con-cell" href="/wap/index/spread.html">
                    <img src="/public/uploads/common/5abc5816d752b.png" alt="">
                    <p>推广二维码</p>
                </a>
            </div>
            {/eq}
        </div>
    </section>
    {include file="public/store_menu"}
</div>
{/block}