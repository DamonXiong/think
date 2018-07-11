<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:74:"F:\Mine\crmeb/application/admin\view\system\system_upgradeclient\index.php";i:1527663960;s:57:"F:\Mine\crmeb/application/admin\view\public\container.php";i:1527663960;s:58:"F:\Mine\crmeb/application/admin\view\public\frame_head.php";i:1527663960;s:53:"F:\Mine\crmeb/application/admin\view\public\style.php";i:1527663960;s:60:"F:\Mine\crmeb/application/admin\view\public\frame_footer.php";i:1527663960;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="{__FRAME_PATH}css/bootstrap.min.css?v=3.4.0" rel="stylesheet">
    <link href="{__FRAME_PATH}css/font-awesome.min.css?v=4.3.0" rel="stylesheet">
    <link href="{__FRAME_PATH}css/animate.min.css" rel="stylesheet">
    <link href="{__FRAME_PATH}css/style.min.css?v=3.0.0" rel="stylesheet">
    <script src="{__FRAME_PATH}js/jquery.min.js"></script>
    <script src="{__FRAME_PATH}js/bootstrap.min.js"></script>
    <script>
        $eb = parent._mpApi;
        if(!$eb) top.location.reload();
    </script>


    <title></title>
    
    <!--<script type="text/javascript" src="/static/plug/basket.js"></script>-->
<script type="text/javascript" src="{__ADMIN_PATH}/plug/requirejs/require.js"></script>
<?php /*  <script type="text/javascript" src="/static/plug/requirejs/require-basket-load.js"></script>  */ ?>
<script>
    requirejs.config({
        map: {
            '*': {
                'css': '/public/static/plug/requirejs/require-css.js'
            }
        },
        shim:{
            'iview':{
                deps:['css!iviewcss']
            },
            'layer':{
                deps:['css!layercss']
            }
        },
        baseUrl:'//'+location.hostname+'/public',
        paths: {
            'static':'static',
            'system':'system',
            'vue':'static/plug/vue/dist/vue.min',
            'axios':'static/plug/axios.min',
            'iview':'static/plug/iview/dist/iview.min',
            'iviewcss':'static/plug/iview/dist/styles/iview',
            'lodash':'static/plug/lodash',
            'layer':'static/plug/layer/layer',
            'layercss':'static/plug/layer/theme/default/layer',
            'jquery':'static/plug/jquery-1.10.2.min',
            'moment':'static/plug/moment',
            'mpBuilder':'system/util/mpBuilder',
            'sweetalert':'static/plug/sweetalert2/sweetalert2.all.min'

        },
        basket: {
            excludes:['system/util/mpFormBuilder','system/js/index','system/util/mpVueComponent','system/util/mpVuePackage']
        }
    });
</script>
<script type="text/javascript" src="{__ADMIN_PATH}util/mpFrame.js"></script>
    
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">

<style>
    .code{
        color: #97824B;
        font-size: 3em;
        border: 2px solid #ccc;
        padding: 10px;
        width: 50%;
        margin: 0 auto;
        font-weight: 700;
        font-family: 'Raleway', sans-serif;
        visibility: visible;
        animation-duration: 1000ms;
        animation-delay: 500ms;
        text-align: center;
        -webkit-box-shadow:0 0 10px #000;
        -moz-box-shadow:0 0 10px #000;
        box-shadow:0 0 10px #000;
        cursor: pointer;
        border-radius: 2%;
    }
    .colore{
        background-color: #CCCCCC;
    }
    .code:hover{
        background-color:rgba(0,0,0,0.1);
    }
</style>
<div class="row">
    <div class="col-sm-12" id="upgrade">
        <div class="wrapper wrapper-content animated fadeInUp">
            <div class="ibox">
                <div class="ibox-content">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="m-b-md">
                                <h2>在线升级 <span style="font-size: 5px;color: red">当前版本为：{{version}}</span></h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <?php if(isset($auth['code']) && $auth['code']==200 && isset($auth['data'])){if($auth['data']==1){?>
                                <div class="col-sm-12">
                                    <h4 class="code" @click="auto_upgrad()" v-text="content">正在加载中</h4>
                                </div>
                            <?php }else{?>
                            <div class="col-sm-12">
                                <h4 class="code colore">您没有权限升级</h4>
                            </div>
                            <?php }}else{?>
                                <div class="col-sm-12">
                                    <h4 class="code colore"><?php echo isset($auth['msg'])?$auth['msg']:'服务器异常';?></h4>
                                </div>
                            <?php }?>
                    </div>
                    <div class="row m-t-sm">
                        <div class="col-sm-12">
                            <div class="panel blank-panel">
                                <div class="panel-heading">
                                    <div class="panel-options">
                                        <ul class="nav nav-tabs">
                                            <li><a href="javascript:;">更新详情</a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="panel-body">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="tab-1">
                                            <div class="feed-activity-list">
                                                <div class="feed-element">
                                                    <div class="media-body">
                                                       <div class="col-sm-2">版本号</div>
                                                        <div class="col-sm-2">更新时间</div>
                                                        <div class="col-sm-4">更新内容</div>
                                                        <div class="col-sm-4">更新文件ZIP</div>
                                                    </div>
                                                    <div  v-for="item in list" v-cloak="">
                                                        <hr>
                                                        <div class="media-body">
                                                            <div class="col-sm-2">{{item.version}}</div>
                                                            <div class="col-sm-2">{{item.add_time}}</div>
                                                            <div class="col-sm-4">{{item.content}}</div>
                                                            <div class="col-sm-4">{{item.zip_name}}</div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="media-body" style="margin-top: 20px">
                                                    <div class="col-sm-12 text-center" style="font-size: 15px;cursor:pointer;color: #FOF8FF">
                                                        <div>
                                                            <span v-show="load==true" @click="getlist()">点击加载</span>
                                                            <div class="sk-spinner sk-spinner-circle" v-show="loading==true">
                                                                <div class="sk-circle1 sk-circle"></div><div class="sk-circle2 sk-circle"></div><div class="sk-circle3 sk-circle"></div><div class="sk-circle4 sk-circle"></div><div class="sk-circle5 sk-circle"></div><div class="sk-circle6 sk-circle"></div><div class="sk-circle7 sk-circle"></div><div class="sk-circle8 sk-circle"></div><div class="sk-circle9 sk-circle"></div><div class="sk-circle10 sk-circle"></div><div class="sk-circle11 sk-circle"></div><div class="sk-circle12 sk-circle"></div>
                                                            </div>
                                                            <span v-show="load==false && loading==false">没有更多了</span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    require(['vue','axios','layer'],function(Vue,axios,layer){
        var version_code=<?php echo (int)$version_code;?>,
            version="<?php echo $version;?>";
        new Vue({
            el:"#upgrade",
            data:{
                list:[],
                page:1,
                limit:20,
                version:version,
                version_code:version_code,
                loading:false,
                load:false,
                content:'正在加载中',
                count:0
            },
            watch:{
                count:function (n) {
                    console.log(n);
                    if(n<=0){
                        this.content='已是最新版本';
                    }else{
                        this.content='还有'+this.count+'个版本未升级 点击升级';
                    }
                }
            },
            methods:{
                getList:function () {
                    var that=this;
                    that.loading=true;
                    axios.post("<?php echo Url('get_list'); ?>",{page:this.page,limit:this.limit}).then(function (rem) {
                        var len=rem.data.data.list.length;
                        if(rem.data.code==200){
                            that.list=rem.data.data.list;
                        }
                        that.page=rem.data.data.page;
                        that.loading=false;
                        if(len<that.limit){
                            that.load=false;
                        }else{
                            that.load=true;
                        }
                    });
                },
                auto_upgrad:function () {
                    var that=this;
                    if(this.count<=0) return;
                    axios.post("<?php echo Url('auto_upgrad'); ?>",{id:this.version_code}).then(function (rem) {
                        if(rem.data.code=200){
                            that.version_code=rem.data.data.code;
                            that.version=rem.data.data.version;
                            that.count=0;
                        }
                    })
                },
                get_new_version_conte:function (){
                    var that=this;
                    axios.post("<?php echo Url('get_new_version_conte'); ?>",{id:this.version_code}).then(function (rem) {
                        if(rem.data.code=200){
                            that.count=rem.data.data.count;
                            if(that.count==0) that.content='已是最新版本';
                        }
                    })
                }
            },
            mounted:function () {
                this.getList()
                this.get_new_version_conte()
            }
        })
    })
</script>




</div>
</body>
</html>
