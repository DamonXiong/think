<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:70:"F:\Mine\crmeb/application/admin\view\store\store_service\chat_user.php";i:1527663960;s:58:"F:\Mine\crmeb/application/admin\view\public\frame_head.php";i:1527663960;s:60:"F:\Mine\crmeb/application/admin\view\public\inner_footer.php";i:1527663960;}*/ ?>

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


<div class="row">
    <div class="col-sm-12">
        <div class="ibox">
            <div class="ibox-content">
                <div class="table-responsive">
                    <table class="table table-striped  table-bordered">
                        <thead>
                        <tr>
                            <th class="text-center">用户名称</th>
                            <th class="text-center">用户头像</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody class="">
                        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <tr>
                            <td class="text-center"><?php echo $vo['nickname']; ?></td>
                            <td class="text-center"><img src="<?php echo $vo['headimgurl']; ?>" class="head_image" data-image="<?php echo $vo['headimgurl']; ?>" width="35" height="35"></td>
                            <td class="text-center">
                                <button class="btn btn-info btn-xs" type="button" onclick="window.location.href='<?php echo Url('chat_list',array('uid'=>$now_service['uid'],'to_uid'=>$vo['uid'])); ?>'"><i class="fa fa-commenting-o"></i> 查看对话</button>
                            </td>
                        </tr>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="{__FRAME_PATH}js/content.min.js"></script>
<script src="{__FRAME_PATH}js/plugins/chosen/chosen.jquery.js"></script>
<script src="{__FRAME_PATH}js/plugins/jsKnob/jquery.knob.js"></script>
<script src="{__FRAME_PATH}js/plugins/jasny/jasny-bootstrap.min.js"></script>
<script src="{__FRAME_PATH}js/plugins/datapicker/bootstrap-datepicker.js"></script>
<script src="{__FRAME_PATH}js/plugins/prettyfile/bootstrap-prettyfile.js"></script>
<script src="{__FRAME_PATH}js/plugins/nouslider/jquery.nouislider.min.js"></script>
<script src="{__FRAME_PATH}js/plugins/switchery/switchery.js"></script>
<script src="{__FRAME_PATH}js/plugins/ionRangeSlider/ion.rangeSlider.min.js"></script>
<script src="{__FRAME_PATH}js/plugins/iCheck/icheck.min.js"></script>
<script src="{__FRAME_PATH}js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="{__FRAME_PATH}js/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="{__FRAME_PATH}js/plugins/clockpicker/clockpicker.js"></script>
<script src="{__FRAME_PATH}js/plugins/cropper/cropper.min.js"></script>
<script src="{__FRAME_PATH}js/plugins/peity/jquery.peity.min.js"></script>
<script src="{__FRAME_PATH}js/plugins/iCheck/icheck.min.js"></script>
</body>
</html>
