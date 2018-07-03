<?php

namespace app\admin\controller\wechat;

use app\admin\controller\AuthController;
use app\admin\library\FormBuilder;
use service\UtilService as Util;
use service\JsonService as Json;
use think\facade\Request;
use think\facade\Url;

/**
 * 图文信息
 * Class WechatNewsCategory
 * @package app\admin\controller\wechat
 *
 */
class WechatNewsCategory extends AuthController
{
    public function select($callback = '_selectNews$eb'){
        $where = Util::getMore([
            ['cate_name','']
        ],$this->request);
        $this->assign('where',$where);
        $this->assign('callback',$callback);
        $this->assign(\app\admin\model\wechat\WechatNewsCategory::getAll($where));
        return $this->fetch();
    }
    public function index()
    {
        $where = Util::getMore([
            ['cate_name','']
        ],$this->request);
        $this->assign('where',$where);
        $this->assign(\app\admin\model\wechat\WechatNewsCategory::getAll($where));
        return $this->fetch();
    }
    public function create(){
        FormBuilder::text('cate_name','图文名称')->autofocus();
        FormBuilder::select('new_id','图文列表',function(){
            $list = \app\admin\model\wechat\WechatNews::getNews();
            $options = [];
            foreach ($list as $id=>$roleName){
                $options[] = ['label'=>$roleName,'value'=>$id];
            }
            return $options;
        })->multiple()->filterable();
        $rules =  FormBuilder::builder()->getContent();
        $this->assign(['title'=>'编辑菜单','rules'=>$rules,'save'=>Url::build('save')]);
        return $this->fetch();
    }
    public function save(Request $request){
        $data = Util::postMore([
            'cate_name',
            ['new_id',[]],
            ['sort',0],
            ['add_time',time()],
            ['status',1],],$request);
        if(!$data['cate_name']) return Json::fail('请输入图文名称');
        if(empty($data['new_id'])) return Json::fail('请选择图文列表');
        $data['new_id'] = array_unique($data['new_id']);
        if(count($data['new_id']) > 8){
            $data['new_id'] = array_slice($data['new_id'], 0, 8);
        };
        $data['new_id'] = implode(',',$data['new_id']);
        \app\admin\model\wechat\WechatNewsCategory::set($data);
        return Json::successful('添加菜单成功!');
    }
    public function edit($id){
        $this->assign(['title'=>'编辑菜单','read'=>Url::build('read',array('id'=>$id)),'update'=>Url::build('update',array('id'=>$id))]);
        return $this->fetch();
    }
    public function read($id)
    {
        $menu = \app\admin\model\wechat\WechatNewsCategory::get($id);
//        dump($menu);
        if(!$menu) return Json::fail('数据不存在!');
        $arr_new_id = array_unique(explode(',',$menu->new_id));
        foreach ($arr_new_id as $k=>$v){
            $arr_new_id[$k] = intval($v);
        }
//        dump($arr_new_id);
        FormBuilder::text('cate_name','分类名称',$menu['cate_name']);
        FormBuilder::select('new_id','图文列表',function(){
            $list = \app\admin\model\wechat\WechatNews::getNews();
            $options = [];
            foreach ($list as $id=>$roleName){
                $options[] = ['label'=>$roleName,'value'=>$id];
            }
            return $options;
        },$arr_new_id)->multiple();
        return FormBuilder::builder();
    }
    public function update(Request $request, $id)
    {
        $data = Util::postMore([
            'cate_name',
            ['new_id',[]],
            ['sort',0],
            ['status',1],],$request);
        if(!$data['cate_name']) return Json::fail('请输入图文名称');
        if(empty($data['new_id'])) return Json::fail('请选择图文列表');
        if(count($data['new_id']) > 8){
            $data['new_id'] = array_slice($data['new_id'], 0, 8);
        };
        $data['new_id'] = implode(',',$data['new_id']);;
        if(!\app\admin\model\wechat\WechatNewsCategory::get($id)) return Json::fail('编辑的记录不存在!');
        \app\admin\model\wechat\WechatNewsCategory::edit($data,$id);
        return Json::successful('修改成功!');
    }
    public function delete($id){
        if(!\app\admin\model\wechat\WechatNewsCategory::del($id))
            return Json::fail(\app\admin\model\wechat\WechatNewsCategory::getErrorInfo('删除失败,请稍候再试!'));
        else
            return Json::successful('删除成功!');
    }

}