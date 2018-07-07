{extend name="public/container"}
{block name="title"}{$title}{/block}
{block name="content"}
<style type="text/css">body{background:#f5f5f5;}</style>
<div class="page-list" id="guide">
    <section>
        <div ref="bsDom">
            <div>
                <div class="new-list" v-show="type == 'article'" v-cloak="">
                    <ul>
                        <li class="clearfix" v-for="item in article.list">
                            <a :href="getArticleUrl(item)">
                                <div class="picture fl"><img :src="item.image_input" /></div>
                                <div class="text-info fr flex">
                                    <p class="tit" v-text="item.title"></p>
                                    <p class="content" v-text="item.synopsis"></p>
                                    <div class="time-wrapper">
                                        <span class="time"  v-text="item.add_time"></span>
                                        <span class="count">浏览: {{item.visit}}次</span>
                                    </div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
                <p class="loading-line" v-show="loading == true"><i></i><span>正在加载中</span><i></i></p>
                <p class="loading-line" v-show="loading == false && loaded == false" v-cloak=""><i></i><span>加载更多</span><i></i></p>
                <p class="loading-line" v-show="loading == false && loaded == true" v-cloak=""><i></i><span>没有更多了</span><i></i></p>
            </div>
        </div>
    </section>
</div>
<script>
    require(['vue','axios','better-scroll','helper','store'],function(Vue,axios,BScroll,$h,storeApi){
        $cid = '<?=$cid?>' || '';
            new Vue({
            el:"#guide",
            data:{
                type:'article',
                article:{
                    first:0,
                    limit:8,
                    list:[],
                    loaded:false,
                    top:0
                },
                loading: false,
                scroll:null
            },
            watch:{
                type:function(v,old){
                    this[old].top = this.scroll.startY;
                    this[v].list.length || this.getList();
                    this.$nextTick(function(){
                        this.scroll.scrollTo(0,this[v].top);
                        this.scroll.refresh();
                    });
                }
            },
            computed:{
                loaded:function(){
                    return this[this.type].loaded;
                }
            },
            methods:{
                getArticleUrl:function(article){
                    return article.url ? article.url : $h.U({c:'article',a:'visit',p:{id:article.id}});
                },
                getList:function(){
                    if(this.loading) return ;
                    this.getArticleList();
                },
                getArticleList:function(){
                    var that = this,type = this.type,group = that[type];
                    if(group.loaded) return ;
                    this.loading = true;
                    storeApi.getArticleList({
                        cid:$cid,
                        first:group.first,
                        limit:group.limit
                    },function(res){
                        var list = res.data.data;
                        group.loaded = list.length < group.limit;
                        group.first += list.length;
                        group.list = group.list.concat(list);
                        that.$set(that,type,group);
                        that.loading = false;
                        that.$nextTick(function(){
                            if(list.length) that.bScrollInit();
                            that.scroll.finishPullUp();
                        });
                    },function(){that.loading = false});
                },
                bScrollInit:function () {
                    var that = this;
                    if(this.scroll === null){
                        this.$refs.bsDom.style.height = (document.documentElement.clientHeight)+'px';
                        this.$refs.bsDom.style.overflow = 'hidden';
                        this.scroll = new BScroll(this.$refs.bsDom,{click:true,probeType:1,cancelable:false,deceleration:0.005,snapThreshold:0.01});
                        this.scroll.on('pullingUp',function(){
                            that.loading == false && that.getList();
                        })
                    }else{
                        this.scroll.refresh();
                    }

                }
            },
            mounted:function(){

                this.getList();
            }
        })
    })
</script>

{/block}