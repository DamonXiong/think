{extend name="public/container"}
{block name="title"}{$category ? $category['cate_name'] : '全部产品'}{/block}
{block name="content"}
<body style="background:#f7f7f7; overflow: hidden;">
<div id="product-list" class="product-sort">
    <section>
        <div class="search-wrapper" ref="head" @touchmove.prevent :class="{active:movingDirectionY == 1}">
            <form action="" method="post" @submit.prevent="searchProduct">
                <input type="text" v-model="keyword" placeholder="商品搜索: 请输入商品关键词"/>
            </form>
            <div class="menu"><a href="{:url('store/category')}"></a></div>
        </div>
        <div class="price-select flex" @touchmove.prevent ref="nav">
            <div class="item" :class="{ on:search.priceOrder =='' && search.salesOrder == '' && search.news == false}" @click="changeDefault">默认</div>
            <div class="item" :class="{'selected-up':search.priceOrder == 'asc','selected-down':search.priceOrder == 'desc','on':search.priceOrder!=''}" @click="changePriceOrder">价格<i class="icon"></i></div>
            <div class="item" :class="{'selected-up':search.salesOrder == 'asc','selected-down':search.salesOrder == 'desc','on':search.salesOrder!=''}" @click="changeSalesOrder">销量<i class="icon"></i></div>
            <div class="item" :class="{on:search.news == true}" @click="changeNews">新品</div>
            <div class="layout-vertical" :class="{on:vertical != true}" @click="vertical = !vertical"><span></span></div>
        </div>
        <div class="product-list" ref="bsDom" style="-webkit-overflow-scrolling: touch;">
            <div>
            <ul class="list-layout flex" :class="{vertical:vertical == true}">
                <li class="flex" v-for="item in group.list" v-cloak="">
                    <a class="flex" :href="productUrl(item.id)">
                        <div class="img"><img :src="item.image" /></div>
                        <div class="info-txt">
                            <p class="name" v-text="item.store_name"></p>
                            <span class="count">已售{{item.sales}}</span>
                            <p class="price">￥{{item.price}}</p>
                        </div>
                    </a>
                    <div class="buy-car" @click="shopCard(item)"></div>
                </li>
            </ul>
                <p class="loading-line" v-show="loading == true"><i></i><span>正在加载中</span><i></i></p>
                <p class="loading-line" v-show="loading == false && group.loaded == false" v-cloak="" @click="getList"><i></i><span>点击加载</span><i></i></p>
                <p class="loading-line" v-show="loading == false && group.loaded == true" v-cloak=""><i></i><span>没有更多了</span><i></i></p>
            </div>
        </div>
    </section>
    <div class="model-bg"></div>
    <div class="child-alink-bg" @touchmove.prevent v-show="showCategoryList == true" @click="showCategoryList = false" v-cloak=""></div>
    {include file="public/store_menu"}
</div>
<script>
    requirejs(['vue','store','better-scroll','helper','wap/crmeb/module/store/shop-card'],function(Vue,storeApi,BScroll,$h,shopCard){
        shopCard.install(Vue);
        var cid = "{$cid}";
        new Vue({
            el:"#product-list",
            components:{
                'shop-card':shopCard
            },
            data:{
                keyword:'{$keyword}',
                categoryList:[],
                showCategoryList:false,
                childCategoryList:[],
                search:{
                    cInfo:{},
                    sInfo:{},
                    priceOrder:'',
                    salesOrder:'',
                    news:0,
                    keyword:'{$keyword}'
                },
                group:{
                    first:0,
                    limit:20,
                    list:[],
                    loaded:false
                },
                loading: false,
                scroll:null,
                templateCategory:{},
                vertical:false,
                movingDirectionY:0,
                cid:'{$cid}',
                sid:'{$sid}'
            },
            watch:{
                movingDirectionY:function(n){
                    var that = this;
                    if(n == 1){
                        this.$refs.bsDom.style.height = (
                                document.documentElement.clientHeight -
                                this.$refs.nav.offsetHeight -
                                this.$refs.storeMenu.offsetHeight
                            )+'px';
                    }else{
                        this.$refs.bsDom.style.height = (
                                document.documentElement.clientHeight -
                                this.$refs.head.offsetHeight -
                                this.$refs.nav.offsetHeight -
                                this.$refs.storeMenu.offsetHeight
                            )+'px';
                    }
//                    setTimeout(function(){
//                        that.$nextTick(function(){
//                            that.scroll.refresh();
//                        });
//                    },400);
                },
                vertical:function(){
//                    this.$nextTick(function(){
//                        this.scroll.refresh();
//                    });
                },
                search:{
                    handler:function(v){
                        this.group = {
                            first:0,
                            limit:20,
                            list:[],
                            loaded:false
                        };
                        this.loading = false;
                        this.getList();
                    },
                    deep:true
                }
            },
            computed:{
                cate_name:function(){
                    if(this.search.sInfo.id != undefined && this.search.sInfo.id != 0)
                        return this.search.sInfo.cate_name;
                    else if(this.search.sInfo.id === 0 && this.search.cInfo.id != undefined)
                        return this.search.cInfo.cate_name;
                    else
                        return '默认';
                }
            },
            methods:{
                shopCard:function(product){
                    var that = this;
                    $h.loadFFF();
                    storeApi.getProductAttr(product.id,function(res){
                        var productValue = res.data.data.productValue;
                        $h.loadClear();
                        that.$shopCard({
                            product:product,
                            show:true,
                            onChange:function(values){
                                var checkedAttr = productValue[values.sort().join(',')];
                                if(undefined != checkedAttr){
                                    this.changeProduct({
                                        stock:checkedAttr.stock,
                                        price:checkedAttr.price,
                                        image:checkedAttr.image
                                    });
                                }
                            },
                            onCart:function(values,cartNum){
                                var checkedAttr = productValue[values.sort().join(',')];
                                storeApi.setCart({
                                    cartNum:cartNum,
                                    uniqueId:checkedAttr === undefined ? '' : checkedAttr.unique,
                                    productId:product.id
                                },function () {
                                    $h.pushMsg('加入购物车成功!');
                                });
                                this.close();
                            },
                            onBuy:function(values,cartNum){
                                var checkedAttr = productValue[values.sort().join(',')];
                                storeApi.goBuy({
                                    cartNum:cartNum,
                                    uniqueId:checkedAttr === undefined ? '' : checkedAttr.unique,
                                    productId:product.id
                                },function(cartId){
                                    location.href = $h.U({
                                        c:'store',
                                        a:'confirm_order',
                                        p:{cartId:cartId}
                                    });
                                });
                                this.close();
                            },
                            attrList:res.data.data.productAttr,
                            onClose:function(){
                                setTimeout(this.remove,550);
                            }
                        });
                    },function(){ $h.loadClear(); return true});

                },
                goCart:function(){
                    location.href = $h.U({
                        c:'store',
                        a:'cart'
                    });
                },
                productUrl:function(id){
                    return $h.U({c:'store',a:'detail',p:{id:id}});
                },
                searchProduct:function(){
                    if(this.keywrod == '') return;
                    if(this.keywrod == this.search.keyword) return;
                    this.search.keyword = this.keyword;
                    this.search.cInfo = {};
                    this.search.sInfo = {};
                    this.search.news = 0;
//                    this.scroll.scrollTo(0,0);
                },
                getList:function(){
                    if(this.loading) return;
                    var that = this,type = 'group',group = that.group;
                    if(group.loaded) return ;
                    this.loading = true;
                    storeApi.getProductList({
                        keyword:this.search.keyword || 0,
                        cId:this.cid || 0,
                        sId:this.sid || 0,
                        priceOrder:this.search.priceOrder || 0,
                        salesOrder:this.search.salesOrder || 0,
                        news:this.search.news || 0,
                        first:group.first,
                        limit:group.limit
                    },function(res){
                        var list = res.data.data,groupLength = group.list.length;
//                        that.scroll.stop();
                        group.loaded = list.length < group.limit;
                        group.first += list.length;
                        group.list = group.list.concat(list);
                        that.$set(that,type,group);
                        that.loading = false;
//                        that.$nextTick(function(){
//                            if(list.length || !groupLength) that.scroll.refresh();
//                            if(!groupLength) setTimeout(function(){that.scroll.scrollTo(0,0,300);},0);
//                            that.scroll.finishPullUp();
//                        });
                    },function(){that.loading = false});
                },
                bScrollInit:function () {
                    var that = this;
                    this.$refs.bsDom.style.height = (
                        document.documentElement.clientHeight -
                        this.$refs.head.offsetHeight -
                        this.$refs.nav.offsetHeight -
                        this.$refs.storeMenu.offsetHeight
                        )+'px';
                    this.$refs.bsDom.style.overflow = 'scroll';
//                    this.$refs.bsDom.getElementsByTagName('div')[0].style.position = 'relative';
//                    this.scroll = new BScroll(this.$refs.bsDom,{bounce:false,observeDOM:false,click:true,probeType:1,cancelable:false,snapThreshold:0.01,deceleration:0.0018, useTransform:false});
//                    this.movingDirectionY = this.scroll.movingDirectionY;
//                    this.scroll.on('pullingUp',function(){
//                        that.loading == false && that.getList();
//                    });
//                    this.scroll.on('flick',function(){
//                        that.movingDirectionY = that.scroll.movingDirectionY;
//                    });
                },
                changeDefault:function () {
                    this.search.salesOrder = '';
                    this.search.priceOrder = '';
                    this.search.news = false;
                },
                changeNews:function(){
                    this.search.salesOrder = '';
                    this.search.priceOrder = '';
                    this.search.news = !this.search.news;
                },
                changePriceOrder:function(){
                    if(this.search.priceOrder == '')
                        this.search.priceOrder = 'desc';
                    else if(this.search.priceOrder == 'desc')
                        this.search.priceOrder = 'asc';
                    else if(this.search.priceOrder == 'asc')
                        this.search.priceOrder = '';
                    this.search.salesOrder = '';
                    this.search.news = false;
                },
                changeSalesOrder:function(){
                    if(this.search.salesOrder == '')
                        this.search.salesOrder = 'desc';
                    else if(this.search.salesOrder == 'desc')
                        this.search.salesOrder = 'asc';
                    else if(this.search.salesOrder == 'asc')
                        this.search.salesOrder = '';
                    this.search.priceOrder = '';
                    this.search.news = false;
                },
                selectAll:function(){
                    if(!this.templateCategory.id) return ;
                    this.search.cInfo = {};
                    this.search.sInfo = {};
                    this.templateCategory = {};
                    this.childCategoryList = [];
                    this.showCategoryList = false;
                },
                changeCategory:function (category,index) {
                    this.templateCategory = category;
                    this.childCategoryList = [{'cate_name':'全部商品','id':0}];
                    this.childCategoryList = this.childCategoryList.concat(category.child);
                },
                changeChild:function(child){
                    this.search.sInfo = child;
                    this.search.cInfo = this.templateCategory;
                    this.showCategoryList = false;
                    this.search.keyword = this.keyword = '';
                }

            },
            mounted:function(){
                var that = this;
                this.bScrollInit();
                this.getList();
            }
        });
    });
</script>
{/block}