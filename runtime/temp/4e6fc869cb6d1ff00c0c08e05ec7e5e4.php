<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:70:"F:\Mine\crmeb/application/admin\view\system\system_admin\admininfo.php";i:1527663960;s:57:"F:\Mine\crmeb/application/admin\view\public\container.php";i:1527663960;s:58:"F:\Mine\crmeb/application/admin\view\public\frame_head.php";i:1527663960;s:53:"F:\Mine\crmeb/application/admin\view\public\style.php";i:1527663960;s:60:"F:\Mine\crmeb/application/admin\view\public\frame_footer.php";i:1527663960;}*/ ?>
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
    
<style>
    label.error{
        color: #a94442;
        margin-bottom: 0;
        display: inline-block;
        font: normal normal normal 14px/1 FontAwesome;
        font-size: inherit;
        text-rendering: auto;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        transform: translate(0, 0);
    }
</style>
<link href="{__FRAME_PATH}css/plugins/iCheck/custom.css" rel="stylesheet">
<script src="{__ADMIN_PATH}plug/validate/jquery.validate.js"></script>
<script src="{__ADMIN_PATH}frame/js/plugins/iCheck/icheck.min.js"></script>
<script src="{__ADMIN_PATH}frame/js/ajaxfileupload.js"></script>

</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">

<div class="row">
    <div class="col-sm-12">
        <div class="ibox">
            <div class="ibox-title">
                <div class="text-left">个人资料</div>
                <div class="ibox-tools">

                </div>
            </div>
            <div class="ibox-content">
                <form method="post" class="form-horizontal" id="signupForm" action="">
                    <input type="hidden" value="<?php echo $adminInfo['id']; ?>" name="id"/>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">账号</label>
                        <div class="col-sm-10">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="account" value="<?php echo $adminInfo['account']; ?>" validate="" disabled/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" class="form-control" name="real_name" value="<?php echo $adminInfo['real_name']; ?>" validate="required:true" id="real_name"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">原始密码</label>
                        <div class="col-sm-10">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="password" class="form-control" name="pwd"  id="pwd"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">新密码</label>
                        <div class="col-sm-10">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="password" class="form-control" name="new_pwd" id="new_pwd"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">确认新密码</label>
                        <div class="col-sm-10">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="password" class="form-control" name="new_pwd_ok" id="new_pwd_ok"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="hr-line-dashed"></div>
                    <div class="form-group" style="text-align: center;">
                        <div class="col-sm-4 col-sm-offset-2">
                            <button class="btn btn-primary add" type="button">提交</button>
                        </div>
                    </div>
                </form>
            </div>

        </div>

    </div>
</div>




<script>
    $eb = parent._mpApi;
    $().ready(function() {
        $("#signupForm").validate();
    })
    $('.add').on('click',function (e) {
         var list = [];
         list.real_name = $('#real_name').val();
         list.pwd = $('#pwd').val();
         list.new_pwd = $('#new_pwd').val();
         list.new_pwd_ok = $('#new_pwd_ok').val();
         if(list.real_name.length < 1) return $eb.message('error','请填写姓名');
            var url = "<?php echo Url('setAdminInfo'); ?>";
            $.ajax({
                url:url,
                data:{real_name:list.real_name,pwd:list.pwd,new_pwd:list.new_pwd,new_pwd_ok:list.new_pwd_ok},
                type:'post',
                dataType:'json',
                success:function (re) {
                    if(re.code == 400)
                        return $eb.message('error',re.msg);
                    else
                        return $eb.message('success',re.msg);
                }
            })
    })
</script>


</div>
</body>
</html>
