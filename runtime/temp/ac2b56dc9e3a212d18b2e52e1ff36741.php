<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:59:"F:\Mine\crmeb/application/admin\view\public\common_form.php";i:1527663960;s:52:"F:\Mine\crmeb/application/admin\view\public\head.php";i:1527663960;s:53:"F:\Mine\crmeb/application/admin\view\public\style.php";i:1527663960;}*/ ?>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;">
<link rel="stylesheet" href="{__ADMIN_PATH}css/main.css">
<link rel="stylesheet" href="{__STATIC_PATH}css/animate.css">
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
<script>
    $eb = parent._mpApi;
    if(!$eb) top.location.reload();
</script>
    <title><?php echo (isset($title) && ($title !== '')?$title:''); ?></title>
</head>
<body>
<div id="form-add" class="mp-form" v-cloak="">
    <form-builder></form-builder>
</div>
<script>
    var _vm ;
    mpFrame.start(function(Vue){
        require(['axios','system/util/mpFormBuilder'],function(axios,mpFormBuilder){
            Vue.use(mpFormBuilder,$eb,<?php echo $rules; ?>,{
                action:'<?php echo $action; ?>'
            });
            new Vue({
                el:"#form-add",
                mounted:function(){
                }
            });
        });
    });
</script>
</body>
