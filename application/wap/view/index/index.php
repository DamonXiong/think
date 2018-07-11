{extend name="public/container"}
{block name="head_top"}
<link rel="stylesheet" href="{__PLUG_PATH}swiper/swiper-3.4.1.min.css">
<script type="text/javascript" src="{__PLUG_PATH}swiper/swiper-3.4.1.jquery.min.js"></script>
<script type="text/javascript" src="{__PLUG_PATH}jquery-slide-up.js"></script>
<script type="text/javascript" src="{__WAP_PATH}crmeb/js/jquery.downCount.js"></script>
<script type="text/javascript" src="{__WAP_PATH}crmeb/js/car-model.js"></script>
{/block}
{block name="title"}
<?= \service\SystemConfigService::get('site_name') ?>
{/block}
{block name="content"}
<div class="page-index" id="app-index">
    <section ref="bsDom">
        <div>
            <div class="search-wrapper">
                <form method="post" @submit.prevent="goSearch">
                    <div class="search-box flex"><input type="text" v-model="keyword" placeholder="商品搜索: 请输入商品关键词"> <a
                            class="index-icon home-btn" href="{:url('my/notice')}">
                            {gt name="notice" value="0"} <b class="count-num">{$notice}</b> {/gt} </a></div>
                </form>
            </div>
            <!-- 滑动导航 -->
            <div class="common-slider-nav" ref="xScroll">
                <ul class="swiper-wrapper">
                    <li class="swiper-slide on"><a href="javascript:void(0);">商城优选</a></li>
                    <li class="swiper-slide"><a href="{:url('store/combination')}"><img src="{__WAP_PATH}sx/images/pt-bg.png" alt=""></a></li>
                    {volist name="category" id="vo"}
                    <li class="swiper-slide"><a href="{:Url('store/index',['cid'=>$vo['id']])}">{$vo.cate_name}</a></li>
                    {/volist}
                </ul>
            </div>
            {notempty name="banner"}
            <div class="banner" ref="banners">
                <ul class="swiper-wrapper">
                    {volist name="banner" id="vo"}
                    <li class="swiper-slide"><a href="<?= empty($vo['url']) ? 'javascript:void(0);' : $vo['url']; ?>">
                            <img src="{$vo.pic|unThumb}"/> </a></li>
                    {/volist}
                </ul>
                <div class="swiper-pagination"></div>
            </div>
            {/notempty}
            {notempty name="menus"}
            <div class="nav">
                <ul class="flex"> {volist name="menus" id="vo"}
                    <li><a href="<?= empty($vo['url']) ? 'javascript:void(0);' : $vo['url']; ?>"> <img src="{$vo.icon|unThumb}">
                            <p>{$vo.name}</p></a></li>
                    {/volist}
                </ul>
            </div>
            {/notempty}
            {notempty name="roll_news"}
            <div class="hot-txt-roll border-1px flex">
                <div class="hot-icon"><img src="{__WAP_PATH}crmeb/images/hot-icon.png"></div>
                <div class="txt-list">
                    <ul class="line"> {volist name="roll_news" id="vo"}
                        <li style="overflow: hidden;white-space: nowrap;text-overflow: ellipsis;"><a
                                style="display: block;"
                                href="<?= empty($vo['url']) ? 'javascript:void(0);' : $vo['url']; ?>">{$vo.info}</a>
                        </li>
                        {/volist}
                    </ul>
                </div>
            </div>
            {/notempty}
            <div class="coupon-wrapper" v-cloak="" v-show="couponList.length > 0" style="overflow:hidden;">
                <div ref="xCoupon">
                    <div class="coupon-list flex">                <!-- 已使用 typethree -->
                        <div class="coupon-item  flex" v-for="item in couponList"
                             :class="[(isValidCoupon(item) && !item.is_use) ? 'typeone' : 'typethree']">
                            <div class="count-num flex"><em><i class="small-symbol">￥</i>{{item.coupon_price}}</em>
                                <p>满{{item.use_min_price}}元可用</p></div>
                            <div class="count-btn flex" v-text="isValidCoupon(item) ? (item.is_use !== true ? '点击领取' : '您已领取') : '已经领完' "
                                 @click="isValidCoupon(item) && item.is_use !== true && userGetCoupon(item)"></div>
                        </div>
                    </div>
                </div>
                <a class="more-wrapper" href="{:Url('store/issue_coupon')}" v-show="couponList.length >= 2">查看更多 ></a>
            </div>
          <!-- 秒杀列表 -->
            {notempty name="storeSeckill"}
            <div class="hotspike-list">
                <div class="index-common-title border-1px">限时秒杀 <a href="{:Url('store/seckill_index')}"><i class="icon"></i></a></div>
                <ul>
                    {volist name="storeSeckill" id="vo"}
                    <li class="flex">
                        <div class="picture"><img src="{$vo.image}" alt="">
                            <div class="count-down flex countdown" data-time="{$vo.stop_time|date='Y/m/d H:i:s',###}">
                                <span class="hours">00</span>
                                <em>:</em>
                                <span class="minutes">00</span>
                                <em>:</em>
                                <span class="seconds">00</span>
                            </div>
                        </div>
                        <div class="text-info flex">
                            <div class="title">{$vo.title}</div>
                            <div class="price-wrapper"><span class="price"><i>￥</i>{$vo.price}</span> <span class="old-price">￥{$vo.ot_price}</span>
                            </div>
                            <div class="schedule flex">

                                <span>已抢{$vo.round}%</span>
                                <span class="schedule-bar"  ><i class="schedule-weight" data-width="{$vo.round}%"></i></span></div>
                            <a class="link" href="{:url('store/seckill_detail',['id'=>$vo.id])}">马上抢</a></div>
                    </li>
                    {/volist}
                </ul>
            </div>
            {/notempty}
            <div class="buyspell-list" v-cloak="" v-show="combinationList.length > 0">
                <div class="index-common-title border-1px">
                    <span class="color-red">拼团 . </span>花少钱买好货 <i class="icon" @click="window.location.href='{:url('store/combination')}'"></i>
                </div>
                <div class="product-banner"><img src="{$pinkImage}"></div>
                <div class="bslist-box">
                    <div class="bs-item flex" v-for="item in combinationList">
                        <div class="picture">
                            <img :src="item.image">
                        </div>
                        <div class="bs-item-info flex">
                            <div class="info-title">{{item.title}}</div>
                            <div class="count-wrapper">
                                <span class="price">￥{{item.price}}</span>
                                <span class="old-price">￥{{item.product_price}}</span>
                                <span class="count">已拼{{item.sales}}单</span>
                            </div>
                            <a class="people-num flex">
                                <span class="numbers">{{item.people}}人团</span>
                                <span class="peo-txt" @click="window.location.href='{:url('store/combination_detail',[],false)}/id/'+item.id">去开团</span>
                                <i class="index-icon people-icon"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 商品分类模板 -->
            <div class="template-prolist" v-cloak="" v-for="item in cateGroupList" v-show="cateGroupList.length > 0">
                <div class="index-common-title border-1px">
                    <a :href="'/wap/store/index/cid/'+item.id">
                        {{item.cate_name}} <i class="icon"></i> </a></div>
                <div class="product-banner"><img :src="unThumb(item.pic)" v-show="item.pic != ''"></div>
                <ul class="flex">
                    <li v-for="pro in item.product"><a :href="'/wap/store/detail/id/'+pro.id">
                            <div class="picture"><img :src="pro.image"></div>
                            <div class="product-info"><p class="title" v-text="pro.store_name"></p>
                                <p class="count-wrapper flex"><span class="price"
                                                                    v-html="getPriceStr(pro.price)"></span> <span
                                        class="count">已售{{pro.sales}}{{pro.unit_name || '件'}}</span></p></div>
                        </a></li>
                </ul>
            </div>        <!-- 商品分类模板 -->
            <div class="template-prolist">
                <div class="title-like flex" v-show="page.list.length > 0" v-cloak=""><span class="title-line left"></span> <span class="icon"></span>
                    <span>新品推荐</span> <span class="title-line right"></span></div>
                <ul class="flex">
                    <li v-for="item in page.list" v-cloak=""><a :href="'/wap/store/detail/id/'+item.id">
                            <div class="picture"><img :src="item.image"></div>
                            <div class="product-info"><p class="title" v-text="item.store_name"></p>
                                <p class="count-wrapper flex"><span class="price"
                                                                    v-html="getPriceStr(item.price)"></span> <span
                                        class="count">已售{{item.sales}}{{item.unit_name || '件'}}</span></p></div>
                        </a></li>
                </ul>
            </div>
            <p class="loading-line" v-show="loading == true"><i></i><span>正在加载中</span><i></i></p>
            <p class="loading-line" v-show="loading == false && page.loaded == false" v-cloak="" @click="getList">
                <i></i><span>点击加载</span><i></i></p>
            <p class="loading-line" v-show="loading == false && page.loaded == true" v-cloak="">
                <i></i><span>没有更多了</span><i></i></p></div>
    </section>
    {include file="public/store_menu"}
</div>
<div class="flex" id="bubble-txt" style="display: none;">
    <div class="avatar">
        <img src="" alt="" class="avater-pink">
    </div>
    <span class="nickname"></span>
</div>
<script type="text/javascript">

    (function () {
       var $pinkListUser = <?php echo json_encode($storePink);?>;
       if($pinkListUser.length > 0){
           var $i = 0,dom = $('#bubble-txt'),src = $('.avater-pink'),name = $('.nickname'),pinkShow = function (item) {
                src.attr('src',item['src']);
                name.html(item['nickname']);
                dom.show().addClass('bubble-txt');
                setTimeout(function () {
                    dom.hide().removeClass('bubble-txt');
                },5100);
           },si = setInterval(function () {
               if(document.readyState=="complete"){
                   window.clearInterval(si);
                   pinkShow($pinkListUser[$i++]);
                   setInterval(function () {
                       if($pinkListUser.length <= $i) $i = 0;
                       pinkShow($pinkListUser[$i++]);
                   },6500);
               }
           },500);
       }
        requirejs(['vue', 'store', 'helper', 'better-scroll'], function (Vue, storeApi, $h, BScroll) {
            new Vue({
                el: '#app-index',
                data: {
                    couponList: [],
                    cateGroupList: [],
                    page: {first: 0, limit: 20, list: [], loaded: false},
                    loading: false,
                    scroll: null,
                    keyword: '',
                    gettingCoupon: false,
                    combinationList:[],
                    pinkData:{
                        src:'',
                        nickname:''
                    },
                    isPinkOne:false
                },
                methods: {
                    unThumb:function(src){
                        return src.replace('/s_','/');
                    },
                    formatPrice: function (price) {
                        var format = price.toString().split('.');
                        if (format[1] == undefined) format[1] = '00';
                        if (format[1].length == 1) format[1] += '0';
                        return format;
                    },
                    getPriceStr: function (price) {
                        var format = this.formatPrice(price);
                        return "<i>￥</i>" + format[0] + "<i>." + format[1] + "</i>";
                    },
                    userGetCoupon: function (coupon) {
                        if (this.gettingCoupon) return;
                        this.gettingCoupon = true;
                        var that = this;
                        storeApi.goLogin() && storeApi.userGetCoupon(coupon.id, function () {
                            coupon.is_use = true;
                            $h.pushMsgOnce('领取成功!');
                            setTimeout(function () {
                                that.gettingCoupon = false;
                            }, 300);
                        }, function () {
                            setTimeout(function () {
                                that.gettingCoupon = false;
                            }, 300);
                            return true;
                        });
                    },
                    isValidCoupon: function (coupon) {
                        return !(coupon.total_count > 0 && coupon.remain_count == 0);
                    },
                    goSearch: function () {
                        if (!this.keyword) return;
                        location.href = $h.U({c: 'store', a: 'index', p: {keyword: this.keyword}});
                    },
                    getIssueCouponList: function () {
                        var that = this;
                        storeApi.getIssueCouponList(4, function (res) {
                            that.couponList = res.data.data;
                            that.$nextTick(function () {
                                var child = that.$refs.xCoupon.children[0],liDom = child.children;
                                if(liDom.length > 0 ){
                                    child.style.width = ((liDom[0].offsetWidth+10) * liDom.length)+'px';
                                    new BScroll(that.$refs.xCoupon,{eventPassthrough : 'vertical',scrollX: true, scrollY: false,observeDOM:false,click:true,probeType:1,cancelable:false});
                                }
                            })
                        });
                    },
                    getCateData: function () {
                        var that = this;
                        storeApi.getCategoryProductList(4, function (res) {
                            that.cateGroupList = res.data.data;
//                            that.$nextTick(function () {
//                                that.scroll.refresh();
//                            })
                        })
                    },
                    getCombinationList:function () {
                        var that = this;
                        storeApi.baseGet($h.U({
                            c:"public_api",
                            a:"get_pink_host",
                            p:{limit:2}
                        }),function (res) {
                            that.combinationList = res.data.data;
//                            that.$nextTick(function () {
//                                that.scroll.refresh();
//                            })
                        })
                    },
                    elInit: function () {
                        that = this;
                        setTimeout(function(){
                            var child = that.$refs.xScroll.children[0],liDom = child.getElementsByTagName('li');
                            if(liDom.length > 0 ){
                                child.style.width = (liDom[0].offsetWidth * liDom.length)+'px';
                                new BScroll(that.$refs.xScroll,{eventPassthrough : 'vertical',scrollX: true, scrollY: false,observeDOM:false,click:true,probeType:1,cancelable:false});
//                                that.$nextTick(function(){
//                                    that.scroll.refresh();
//                                });
                            }
                        });
                        setTimeout(function () {
                            if(!that.$refs.banners) return ;
                            var child = that.$refs.banners.children[0],liDom = child.getElementsByTagName('li');
                            if(liDom.length > 0 ){
                                child.style.width = (document.body.offsetWidth * liDom.length)+'px';
                                Array.prototype.slice.call(liDom).forEach(function (item) {
                                   item.style.width = document.body.offsetWidth+'px';
                                });
                                new BScroll(that.$refs.banners,{eventPassthrough : 'vertical',scrollX: true, scrollY: false,observeDOM:false,click:true,probeType:1,cancelable:false,momentum: false,snap: {loop: false, threshold: 0.1, stepX: document.body.offsetWidth}});
//                                that.$nextTick(function(){
//                                    that.scroll.refresh();
//                                });
                            }
                        });
                        $('.schedule-weight').each(function() {
                            var _this = $(this);
                            var width =  _this.attr('data-width');
                            _this.css("width",width);
                        });
                        $('.countdown').each(function () {
                            var _this = $(this);
                            var count = _this.attr('data-time');
                            _this.downCount({date: count, offset: +8});
                        });
                        $(".line").slideUp({"li_h": $('.txt-list').height()});
                    },
                    getList: function () {
                        if (this.loading) return;
                        var that = this, group = that.page;
                        if (group.loaded) return;
                        this.loading = true;
                        storeApi.getBestProductList({first: group.first, limit: group.limit}, function (res) {
                            var list = res.data.data;
                            group.loaded = list.length < group.limit;
                            group.first += list.length;
                            group.list = group.list.concat(list);
                            that.$set(that, 'page', group);
                            that.loading = false;
//                            that.$nextTick(function () {
//                                if (list.length) that.scroll.refresh();
//                                that.scroll.finishPullUp();
//                            });
                        }, function () {
                            that.loading = false
                        });
                    },
                    bScrollInit: function () {
                        var that = this;
//                        this.$refs.bsDom.style.height = (document.documentElement.clientHeight - this.$refs.storeMenu.offsetHeight) + 'px';
//                        this.$refs.bsDom.style.overflow = 'hidden';
//                        this.$refs.bsDom.getElementsByTagName('div')[0].style.position = 'relative';
//                        this.scroll = new BScroll(this.$refs.bsDom, {
//                            bounce:false,
//                            observeDOM: false,
//                            click: true,
//                            probeType: 1,
//                            cancelable: false,
//                            deceleration:0.0018,
//                            snapThreshold: 0.01,
//                            useTransform:false
//                        });
//                        this.scroll.on('scrollStart', function () {
//                            document.activeElement.blur();
//                        });
//                        this.scroll.on('pullingUp', function () {
//                            that.loading == false && that.getList();
//                        })
                    }
                },
                mounted: function () {
                    var that = this;
                    this.elInit();
                    this.bScrollInit();
                    this.getIssueCouponList();
                    this.getCateData();
                    this.getCombinationList();
                    setTimeout(function() {
                        that.getList();
                    },0);
                }
            })
        });
    }());</script>{/block}