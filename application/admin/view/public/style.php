<!--<script type="text/javascript" src="/static/plug/basket.js"></script>-->
<script type="text/javascript" src="__ADMIN_SYSTEM__/plug/requirejs/require.js"></script>
<?php /*  <script type="text/javascript" src="/static/plug/requirejs/require-basket-load.js"></script>  */ ?>
<script>
    requirejs.config({
        map: {
            '*': {
                'css': '/public/admin/static/plug/requirejs/require-css.js'
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
            'static':'admin/static',
            'system':'admin/system',
            'vue':'admin/static/plug/vue/dist/vue.min',
            'axios':'admin/static/plug/axios.min',
            'iview':'admin/static/plug/iview/dist/iview.min',
            'iviewcss':'admin/static/plug/iview/dist/styles/iview',
            'lodash':'admin/static/plug/lodash',
            'layer':'admin/static/plug/layer/layer',
            'layercss':'admin/static/plug/layer/theme/default/layer',
            'jquery':'admin/static/plug/jquery-1.10.2.min',
            'moment':'admin/static/plug/moment',
            'mpBuilder':'admin/system/util/mpBuilder',
            'sweetalert':'admin/static/plug/sweetalert2/sweetalert2.all.min'

        },
        basket: {
            excludes:['admin/system/util/mpFormBuilder','admin/system/js/index','admin/system/util/mpVueComponent','admin/system/util/mpVuePackage']
        }
    });
</script>
<script type="text/javascript" src="__ADMIN_SYSTEM__/util/mpFrame.js"></script>