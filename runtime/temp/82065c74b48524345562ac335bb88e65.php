<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:63:"F:\Mine\crmeb/application/admin\view\user\user_notice\index.php";i:1527663960;s:57:"F:\Mine\crmeb/application/admin\view\public\container.php";i:1527663960;s:58:"F:\Mine\crmeb/application/admin\view\public\frame_head.php";i:1527663960;s:53:"F:\Mine\crmeb/application/admin\view\public\style.php";i:1527663960;s:58:"F:\Mine\crmeb/application/admin\view\public\inner_page.php";i:1527663960;s:60:"F:\Mine\crmeb/application/admin\view\public\frame_footer.php";i:1527663960;}*/ ?>
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

<div class="row">
    <div class="col-sm-12">
        <div class="ibox">
            <div class="ibox-title">
                <button type="button" class="btn btn-w-m btn-primary" onclick="$eb.createModalFrame(this.innerText,'<?php echo Url('create'); ?>')">添加通知</button>
            </div>
            <div class="ibox-content">
                <div class="table-responsive">
                    <table class="table table-striped  table-bordered">
                        <thead>
                        <tr>
                            <th class="text-center">编号</th>
                            <th class="text-center">发送人</th>
                            <th class="text-center">通知标题</th>
                            <th class="text-center" width="700">通知内容</th>
                            <th class="text-center">消息类型</th>
                            <th class="text-center">是否发送</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody class="">
                        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <tr>
                            <td class="text-center"><?php echo $vo['id']; ?></td>
                            <td class="text-center"><?php echo $vo['user']; ?></td>
                            <td class="text-center"><?php echo $vo['title']; ?></td>
                            <td class="text-center"><?php echo $vo['content']; ?></td>
                            <td class="text-center">
                                <?php if($vo['type'] == 1): ?>
                                    系统消息
                                <?php elseif($vo['type'] == 2): ?>
                                    用户通知
                                <?php endif; ?>
                            </td>
                            <td class="text-center">
                                <?php if($vo['is_send'] == 1): ?>
                                    状态：<span style="color:green;">已发送</span><br />
                                    时间：<?php echo date('Y-m-d H:i:s',$vo['send_time']); else: ?>
                                    状态：<span style="color:red;">未发送</span> <a class="btn-send" data-url="<?php echo Url('send',array('id'=>$vo['id'])); ?>">立即发送</a>
                                <?php endif; ?>
                            </td>
                            <td class="text-center">
                                <button class="btn btn-info btn-xs" type="button"  onclick="window.location.href='<?php echo Url('user',array('id'=>$vo['id'])); ?>'"><i class="fa fa-user"></i> 用户信息</button>
                                <?php if($vo['is_send'] == 0): ?>
                                    <button class="btn btn-info btn-xs" type="button"  onclick="$eb.createModalFrame('编辑','<?php echo Url('edit',array('id'=>$vo['id'])); ?>')"><i class="fa fa-paste"></i> 编辑</button>
                                <?php endif; ?>
                                <button class="btn btn-warning btn-xs" data-url="<?php echo Url('delete',array('id'=>$vo['id'])); ?>" type="button"><i class="fa fa-warning"></i> 删除</button>
                            </td>
                        </tr>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                        </tbody>
                    </table>
                </div>
                <link href="{__FRAME_PATH}css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
<div class="row">
    <div class="col-sm-6">
        <div class="dataTables_info" id="DataTables_Table_0_info" role="alert" aria-live="polite" aria-relevant="all">共 <?php echo $total; ?> 项</div>
    </div>
    <div class="col-sm-6">
        <div class="dataTables_paginate paging_simple_numbers" id="editable_paginate">
            <?php echo $page; ?>
        </div>
    </div>
</div>
            </div>
        </div>
    </div>
</div>



<script>
    $('.btn-warning').on('click',function(){
        window.t = $(this);
        var _this = $(this),url =_this.data('url');
        $eb.$swal('delete',function(){
            $eb.axios.get(url).then(function(res){
                if(res.status == 200 && res.data.code == 200) {
                    $eb.$swal('success',res.data.msg);
                    _this.parents('tr').remove();
                }else
                    return Promise.reject(res.data.msg || '删除失败')
            }).catch(function(err){
                $eb.$swal('error',err);
            });
        })
    });
    $('.btn-send').on('click',function(){
        var _this = $(this),url =_this.data('url');
        $eb.$swal('delete',function(){
            $eb.axios.get(url).then(function(res){
                if(res.status == 200 && res.data.code == 200) {
                    $eb.$swal('success',res.data.msg);
                    window.location.reload();
                }else
                    return Promise.reject(res.data.msg || '发送失败')
            }).catch(function(err){
                $eb.$swal('error',err);
            });
        },{
            title:"您确定要发送这条信息吗",
            text:"发送后将无法修改通知信息，请谨慎操作！",
            confirm:"是的，我要发送！",
            cancel:"让我再考虑一下"
        })
    });
    $('.head_image').on('click',function (e) {
        var image = $(this).data('image');
        $eb.openImage(image);
    })
</script>


</div>
</body>
</html>
