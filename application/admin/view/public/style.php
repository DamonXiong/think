<!--<script type="text/javascript" src="/static/plug/basket.js"></script>-->
<script type="text/javascript" src="__ADMIN_SYSTEM__/plug/requirejs/require.js"></script>
<?php /*  <script type="text/javascript" src="/static/plug/requirejs/require-basket-load.js"></script>  */ ?>
<script>
    requirejs.config({
        map: {
            '*': {
                'css': '/public/static/admin/static/plug/requirejs/require-css.js'
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
            'static':'static/admin/static',
            'system':'static/admin/system',
            'vue':'static/admin/static/plug/vue/dist/vue.min',
            'axios':'static/admin/static/plug/axios.min',
            'iview':'static/admin/static/plug/iview/dist/iview.min',
            'iviewcss':'static/admin/static/plug/iview/dist/styles/iview',
            'lodash':'static/admin/static/plug/lodash',
            'layer':'static/admin/static/plug/layer/layer',
            'layercss':'static/admin/static/plug/layer/theme/default/layer',
            'jquery':'static/admin/static/plug/jquery-1.10.2.min',
            'moment':'static/admin/static/plug/moment',
            'mpBuilder':'static/admin/system/util/mpBuilder',
            'sweetalert':'static/admin/static/plug/sweetalert2/sweetalert2.all.min'

        },
        basket: {
            excludes:['static/admin/system/util/mpFormBuilder','static/admin/system/js/index','static/admin/system/util/mpVueComponent','static/admin/system/util/mpVuePackage']
        }
    });
</script>
<script type="text/javascript" src="__ADMIN_SYSTEM__/util/mpFrame.js"></script>