<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:72:"F:\Mine\crmeb/application/admin\view\store\store_product_reply\index.php";i:1527663960;s:57:"F:\Mine\crmeb/application/admin\view\public\container.php";i:1527663960;s:58:"F:\Mine\crmeb/application/admin\view\public\frame_head.php";i:1527663960;s:53:"F:\Mine\crmeb/application/admin\view\public\style.php";i:1527663960;s:58:"F:\Mine\crmeb/application/admin\view\public\inner_page.php";i:1527663960;s:60:"F:\Mine\crmeb/application/admin\view\public\frame_footer.php";i:1527663960;}*/ ?>
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
    
<script src="{__PLUG_PATH}sweetalert2/sweetalert2.all.min.js"></script>

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
            <div class="ibox-content">
                <div class="row">
                    <div class="m-b m-l">
                        <form action="" class="form-inline">
                            <select name="is_reply" aria-controls="editable" class="form-control input-sm">
                                <option value="">评论状态</option>
                                <option value="0" <?php if($where['is_reply'] == '0'): ?>selected="selected"<?php endif; ?>>未回复</option>
<!--                                <option value="1" <?php if($where['is_reply'] == '1'): ?>selected="selected"<?php endif; ?>>客户已评价且管理员未回复</option>-->
                                <option value="2" <?php if($where['is_reply'] == '2'): ?>selected="selected"<?php endif; ?>>已回复</option>
                            </select>
                            <div class="input-group">
                                <input type="text" name="comment" value="<?php echo $where['comment']; ?>" placeholder="请输入评论内容" class="input-sm form-control" size="38"> <span class="input-group-btn">
                                    <button type="submit" class="btn btn-sm btn-primary"> 搜索</button> </span>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="ibox">
                    <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <div class="col-sm-12">
                        <div class="social-feed-box">
                            <div class="pull-right social-action dropdown">
                                <button data-toggle="dropdown" class="dropdown-toggle btn-white" aria-expanded="false">
                                    <i class="fa fa-angle-down"></i>
                                </button>
                                <ul class="dropdown-menu m-t-xs">
                                    <?php if($vo['is_reply'] == 2): ?>
                                    <li><a href="#" class="reply_update"  data-url="<?php echo Url('set_reply'); ?>"  data-content="<?php echo $vo['merchant_reply_content']; ?>" data-id="<?php echo $vo['id']; ?>">编辑</a></li>
                                    <?php else: ?>
                                    <li><a href="#" class="reply"  data-url="<?php echo Url('set_reply'); ?>" data-id="<?php echo $vo['id']; ?>">回复</a></li>
                                    <?php endif; ?>
                                    <li><a href="#" class="delete" data-url="<?php echo Url('delete',array('id'=>$vo['id'])); ?>">删除</a></li>
                                </ul>
                            </div>
                            <div class="social-avatar">
                                <a href="" class="pull-left">
                                    <img alt="image" src="<?php echo $vo['headimgurl']; ?>">
                                </a>
                                <div class="media-body">
                                    <a href="#">
                                        <?php echo $vo['nickname']; ?>
                                    </a>
                                    <small class="text-muted"><?php echo date('Y-m-d H:i:s',$vo['add_time']); ?> 来自产品: <?php echo $vo['store_name']; ?></small>
                                </div>
                            </div>
                            <div class="social-body">
                                <p><?php echo $vo['comment']; $image = json_decode($vo['pics'],true);if($image): if(is_array($image) || $image instanceof \think\Collection || $image instanceof \think\Paginator): $i = 0; $__LIST__ = $image;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                    <img src="<?php echo $v; ?>" alt="<?php echo $vo['store_name']; ?>" class="open_image" data-image="<?php echo $v; ?>" style="width: 50px;height: 50px;cursor: pointer;">
                                    <?php endforeach; endif; else: echo "" ;endif; else: ?>
                                    [无图]
                                    <?php endif; ?>
                                </p>
                            </div>
                            <?php if($vo['merchant_reply_content']): ?>
                            <div class="social-footer">
                                <div class="social-comment">
                                    <div class="media-body">回复时间：<small class="text-muted"><?php echo date('Y-m-d H:i:s',$vo['merchant_reply_time']); ?></small></div>
                                    <div class="media-body">
                                        <p><?php echo $vo['merchant_reply_content']; ?></p>
                                    </div>
                                </div>
                            </div>
                            <?php endif; ?>
                        </div>
                    </div>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
               <!-- <div class="table-responsive">
                    <table class="table table-striped  table-bordered">
                        <thead>
                        <tr>
                            <th class="text-center">编号</th>
                            <th class="text-center">产品名称</th>
                            <th class="text-center">评论人</th>
                            <th class="text-center">评论内容</th>
                            <th class="text-center">评论图片</th>
                            <th class="text-center">评论时间</th>
                            <th class="text-center">回复内容</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody class="">
                        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <tr>
                            <td class="text-center">
                                <?php echo $vo['id']; ?>
                            </td>
                            <td class="text-center">
                                <?php echo $vo['store_name']; ?>
                            </td>
                            <td class="text-center">
                                <?php echo $vo['nickname']; ?>
                            </td>
                            <td class="text-center">
                                <?php echo $vo['comment']; ?>
                            </td>
                            <td class="text-center">
                                <?php /*$image = json_decode($vo['pics'],true);*/if($image): if(is_array($image) || $image instanceof \think\Collection || $image instanceof \think\Paginator): $i = 0; $__LIST__ = $image;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                <img src="<?php echo $v; ?>" alt="<?php echo $vo['store_name']; ?>" class="open_image" data-image="<?php echo $v; ?>" style="width: 50px;height: 50px;cursor: pointer;">
                                <?php endforeach; endif; else: echo "" ;endif; else: ?>
                                无图
                                <?php endif; ?>
                            </td>
                            <td class="text-center">
                                <?php echo date('Y-m-d H:i:s',$vo['add_time']); ?>
                            </td>
                            <td class="text-center">
                                <?php if($vo['merchant_reply_content']): ?>
                                <?php echo $vo['merchant_reply_content']; ?>
                                <br/>
                                <?php echo date('Y-m-d H:i:s',$vo['merchant_reply_time']); elseif($vo['comment']): ?>
                                <button class="reply btn btn-primary btn-xs" data-url="<?php echo Url('set_reply'); ?>" data-id="<?php echo $vo['id']; ?>" type="button"><i class="fa fa-eyedropper"></i> 回复
                                </button>
                                <?php else: ?>
                                未评论
                                <?php endif; ?>
                            </td>
                            <td class="text-center">
                                <?php if($vo['is_reply'] == 2): ?>
                                <button class="reply_update btn btn-info btn-xs" data-url="<?php echo Url('edit_reply'); ?>" data-content="<?php echo $vo['merchant_reply_content']; ?>" data-id="<?php echo $vo['id']; ?>" type="button"><i class="fa fa-paste"></i> 修改
                                </button>
                                <?php endif; ?>
                                <button class="btn btn-warning btn-xs" data-url="<?php echo Url('delete',array('id'=>$vo['id'])); ?>" type="button"><i class="fa fa-warning"></i> 删除
                                </button>
                            </td>
                        </tr>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                        </tbody>
                    </table>
                </div>-->
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
    $('.delete').on('click',function(){
        window.t = $(this);
        var _this = $(this),url =_this.data('url');
        $eb.$swal('delete',function(){
            $eb.axios.get(url).then(function(res){
                console.log(res);
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
    $(".open_image").on('click',function (e) {
        var image = $(this).data('image');
        $eb.openImage(image);
    })
    $('.reply').on('click',function(){
        window.t = $(this);
        var _this = $(this),url =_this.data('url'),rid =_this.data('id');
        $eb.$alert('textarea',{'title':'请输入回复内容','value':''},function(result){
            $eb.axios.post(url,{content:result,id:rid}).then(function(res){
                if(res.status == 200 && res.data.code == 200) {
                    $eb.swal(res.data.msg);
                }else
                    $eb.swal(res.data.msg);
            });
        })
    });
    $('.reply_update').on('click',function (e) {
        window.t = $(this);
        var _this = $(this),url =_this.data('url'),rid =_this.data('id'),content =_this.data('content');
        $eb.$alert('textarea',{'title':'请输入回复内容','value':content},function(result){
            $eb.axios.post(url,{content:result,id:rid}).then(function(res){
                if(res.status == 200 && res.data.code == 200) {
                    $eb.swal(res.data.msg);
                }else{
                    $eb.swal(res.data.msg);
                }
            });
        })
    });
</script>


</div>
</body>
</html>
