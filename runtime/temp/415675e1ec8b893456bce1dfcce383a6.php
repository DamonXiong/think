<?php if (!defined('THINK_PATH')) exit(); /*a:6:{s:70:"F:\Mine\crmeb/application/admin\view\store\store_combination\index.php";i:1527663960;s:57:"F:\Mine\crmeb/application/admin\view\public\container.php";i:1527663960;s:58:"F:\Mine\crmeb/application/admin\view\public\frame_head.php";i:1527663960;s:53:"F:\Mine\crmeb/application/admin\view\public\style.php";i:1527663960;s:58:"F:\Mine\crmeb/application/admin\view\public\inner_page.php";i:1527663960;s:60:"F:\Mine\crmeb/application/admin\view\public\frame_footer.php";i:1527663960;}*/ ?>
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
                <button type="button" class="btn btn-w-m btn-primary" onclick="$eb.createModalFrame(this.innerText,'<?php echo Url('create'); ?>')">添加拼团</button>
            </div>
            <div class="ibox-content">
                <div class="row">
                    <div class="m-b m-l">
                        <form action="" class="form-inline">
                            <select name="is_show" aria-controls="editable" class="form-control input-sm">
                                <option value="">产品状态</option>
                                <option value="1" <?php if($where['is_show'] == '1'): ?>selected="selected"<?php endif; ?>>上架</option>
                                <option value="0" <?php if($where['is_show'] == '0'): ?>selected="selected"<?php endif; ?>>下架</option>
                            </select>
                            <select name="is_host" aria-controls="editable" class="form-control input-sm">
                                <option value="">推荐状态</option>
                                <option value="1" <?php if($where['is_host'] == '1'): ?>selected="selected"<?php endif; ?>>是</option>
                                <option value="0" <?php if($where['is_host'] == '0'): ?>selected="selected"<?php endif; ?>>否</option>
                            </select>
                            <div class="input-group">
                                <input type="text" name="store_name" value="<?php echo $where['store_name']; ?>" placeholder="请输入产品名称,编号" class="input-sm form-control" size="38"> <span class="input-group-btn">
                                    <button type="submit" class="btn btn-sm btn-primary"> <i class="fa fa-search" ></i> 搜索</button> </span>
                            </div>
                        </form>
                    </div>

                </div>
                <div class="table-responsive" style="overflow:visible">
                    <table class="table table-striped  table-bordered">
                        <thead>
                        <tr>
                            <th class="text-center">编号</th>
                            <th class="text-center">拼团名称</th>
                            <th class="text-center">产品名称</th>
                            <th class="text-center">拼团图片</th>
                            <th class="text-center">开始时间</th>
                            <th class="text-center">结束时间</th>
                            <th class="text-center">拼团人数</th>
                            <th class="text-center">价格</th>
                            <th class="text-center">产品状态</th>
                            <th class="text-center">推荐状态</th>
                            <th class="text-center">库存</th>
                            <th class="text-center">排序</th>
                            <th class="text-center">内容</th>
                            <th class="text-center" width="10%">操作</th>
                        </tr>
                        </thead>
                        <tbody class="">
                        <?php if(is_array($list) || $list instanceof \think\Collection || $list instanceof \think\Paginator): $i = 0; $__LIST__ = $list;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <tr>
                            <td class="text-center">
                                <?php echo $vo['id']; ?>
                            </td>
                            <td class="text-center">
                                <?php echo $vo['title']; ?>
                            </td>
                            <td class="text-center">
                                <?php echo $vo['store_name']; ?>/<?php echo $vo['product_id']; ?>
                            </td>
                            <td class="text-center">
                                <img src="<?php echo $vo['image']; ?>" alt="<?php echo $vo['store_name']; ?>" class="open_image" data-image="<?php echo $vo['image']; ?>" style="width: 50px;height: 50px;cursor: pointer;">
                            </td>
                            <td class="text-center">
                                <?php echo date("Y-m-d H:i:s",$vo['start_time']); ?>
                            </td>
                            <td class="text-center">
                                <?php echo date("Y-m-d H:i:s",$vo['stop_time']); ?>
                            </td>
                            <td class="text-center">
                                <?php echo $vo['people']; ?>
                            </td>
                            <td class="text-center">
                                <?php echo $vo['price']; ?>
                            </td>
                            <td class="text-center">
                                <i class="fa <?php if($vo['is_show'] == '1'): ?>fa-check text-navy<?php else: ?>fa-close text-danger<?php endif; ?>"></i>
                            </td>
                            <td class="text-center">
                                <i class="fa <?php if($vo['is_host'] == '1'): ?>fa-check text-navy<?php else: ?>fa-close text-danger<?php endif; ?>"></i>
                            </td>
                            <td class="text-center">
                                <?php echo $vo['stock']; ?>
                            </td>
                            <td class="text-center">
                                <?php echo $vo['sort']; ?>
                            </td>
                            <td class="text-center">
                                <button type="button" class="btn btn-xs btn-primary" onclick="$eb.createModalFrame(this.innerText,'<?php echo Url('edit_content',array('id'=>$vo['id'])); ?>')"><i class="fa fa-pencil"></i> 编辑内容</button>
                            </td>
                            <td class="text-center">
                                <div class="input-group-btn js-group-btn">
                                    <div class="btn-group">
                                        <button data-toggle="dropdown" class="btn btn-warning btn-xs dropdown-toggle"
                                                aria-expanded="false">操作
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu">
                                            <li>
                                                <a href="javascript:void(0);" onclick="$eb.createModalFrame('编辑','<?php echo Url('edit',array('id'=>$vo['id'])); ?>')">
                                                    <i class="fa fa-paste"></i> 编辑
                                                </a>
                                            </li>
                                            <li>
                                                <a href="javascript:void(0);" id="delstor" data-url="<?php echo Url('delete',array('id'=>$vo['id'])); ?>">
                                                    <i class="fa fa-warning"></i> 删除
                                                </a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
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
    $('.js-group-btn').on('click',function(){
        $('.js-group-btn').css({zIndex:1});
        $(this).css({zIndex:2});
    });
    $('#delstor').on('click',function(){
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
</script>


</div>
</body>
</html>
