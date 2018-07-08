<?php

namespace app\admin\controller\system;



use think\facade\Url;

use app\admin\library\FormBuilder;

use think\Request;

use service\UtilService as Util;

use service\JsonService as Json;

use app\admin\controller\AuthController;

use app\admin\model\system\SystemConfigTab as ConfigTabModel;

use app\admin\model\system\SystemConfig as ConfigModel;

/**
 * 配置分类控制器
 * Class SystemConfigTab
 * @package app\admin\controller\system
 */

class SystemConfigTab extends AuthController

{


    /**
     * @param Request $request
     * @param $id
     * @return \think\facade\Response\Json
     */
    public function update_config(Request $request, $id)

    {

        $data = Util::postMore(['status','info','desc','sort','config_tab_id','required','parameter','upload_type'],$request);

        if(!ConfigModel::get($id)) return Json::fail('编辑的记录不存在!');

        ConfigModel::edit($data,$id);

        return Json::successful('修改成功!');

    }

    /**
     * @param $id
     * @return \think\facade\Response\Json
     */

    public function read_config($id){

        $menu = ConfigModel::get($id)->getData();

        if(!$menu) return Json::fail('数据不存在!');
        FormBuilder::text('menu_name','字段变量',$menu['menu_name'])->disabled();
        FormBuilder::select('config_tab_id','分类',ConfigModel::getConfigTabAll(-1),$menu['config_tab_id']);
        FormBuilder::text('info','配置名称',$menu['info']);
        FormBuilder::text('desc','配置描述',$menu['desc']);
        //单选和多选参数配置
        if(!empty($menu['parameter'])){
            FormBuilder::textarea('parameter','参数配置',$menu['parameter']);
        }
        //上传类型选择
        if(!empty($menu['upload_type'])){
            FormBuilder::radio('upload_type','上传类型',[['value'=>1,'label'=>'单图'],['value'=>2,'label'=>'多图'],['value'=>3,'label'=>'文件']],$menu['upload_type']);
        }

        FormBuilder::text('required','验证规则',$menu['required'])->placeholder('多个请用,隔开例如：required:true,url:true');
        FormBuilder::number('sort','排序',$menu['sort'])->precision(0);

        FormBuilder::radio('status','状态',[['value'=>1,'label'=>'显示'],['value'=>2,'label'=>'隐藏']],$menu['status']);

        return FormBuilder::builder();

    }

    /**
     * 修改是否显示子子段
     * @param $id
     * @return mixed
     */

    public function edit_cinfig($id){

        $this->assign(['title'=>'编辑菜单','read'=>Url::build('read_config',array('id'=>$id)),'update'=>Url::build('update_config',array('id'=>$id))]);

        return $this->fetch();

    }

    /**
     * 删除子字段
     * @return \think\facade\Response\Json
     */

    public function delete_cinfig(){

        $id = input('id');

        if(!ConfigModel::del($id))

            return Json::fail(ConfigModel::getErrorInfo('删除失败,请稍候再试!'));

        else

            return Json::successful('删除成功!');

    }

    /**
     * 子子段
     * @return mixed|\think\facade\Response\Json
     */

    public function sonConfigTab(){

        $tab_id = input('tab_id');

        if(!$tab_id) return Json::fail('参数错误');

        $this->assign('tab_id',$tab_id);

        $list = ConfigModel::getAll($tab_id);

        foreach ($list as $k=>$v){

            $list[$k]['value'] = json_decode($v['value'],true);

            if($v['type'] == 'radio' || $v['type'] == 'checkbox'){

                $list[$k]['value'] = ConfigTabModel::getRadioOrCheckboxValueInfo($v['menu_name'],$v['value']);

            }
            if($v['type'] == 'upload' && !empty($v['value'])){
                if($v['upload_type'] == 1 || $v['upload_type'] == 3) $list[$k]['value'] = explode(',',$v['value']);
            }

        }

        $this->assign('list',$list);

        return $this->fetch();

    }

    /**
     * 基础配置
     * @return mixed
     */

   public function index(){

       $where = Util::getMore([
           ['status',''],
           ['title',''],
       ],$this->request);
       $this->assign('where',$where);
       $this->assign(ConfigTabModel::getSystemConfigTabPage($where));
       return $this->fetch();

   }

    /**
     * 添加字段
     * @return mixed
     */

   public function create(){

       FormBuilder::text('title','分类昵称');

       FormBuilder::text('eng_title','分类字段');

       FormBuilder::text('icon','图标');

       FormBuilder::radio('type','类型',[['value'=>0,'label'=>'系统'],['value'=>1,'label'=>'公众号'],['value'=>2,'label'=>'小程序']],0);

       FormBuilder::radio('status','状态',[['value'=>1,'label'=>'显示'],['value'=>2,'label'=>'隐藏']],1);


       $rules =  FormBuilder::builder()->getContent();

       $this->assign(['title'=>'编辑菜单','rules'=>$rules,'save'=>Url::build('save')]);

       return $this->fetch();

   }

    /**
     * 保存分类名称
     * @param Request $request
     * @return \think\facade\Response\Json
     */

   public function save(Request $request){

       $data = Util::postMore([

           'eng_title',
           'status',
           'title',
           'icon',
           'type'],$request);

       if(!$data['title']) return Json::fail('请输入按钮名称');

       ConfigTabModel::set($data);

       return Json::successful('添加菜单成功!');

   }

    /**
     * 修改分类
     * @param $id
     * @return mixed
     */

   public function edit($id){

           $this->assign(['title'=>'编辑菜单','read'=>Url::build('read',array('id'=>$id)),'update'=>Url::build('update',array('id'=>$id))]);

           return $this->fetch();

   }

    /**
     * @param $id
     * @return \think\facade\Response\Json
     */
    public function read($id)

    {

        $menu = ConfigTabModel::get($id)->getData();

        if(!$menu) return Json::fail('数据不存在!');

        FormBuilder::text('title','分类昵称',$menu['title']);

        FormBuilder::text('eng_title','分类字段',$menu['eng_title']);

        FormBuilder::text('icon','图标',$menu['icon']);

        FormBuilder::radio('type','类型',[['value'=>0,'label'=>'系统'],['value'=>1,'label'=>'公众号'],['value'=>2,'label'=>'小程序']],$menu['type']);

        FormBuilder::radio('status','状态',[['value'=>1,'label'=>'显示'],['value'=>2,'label'=>'隐藏']],$menu['status']);


        return FormBuilder::builder();

    }

    /**
     * @param Request $request
     * @param $id
     * @return \think\facade\Response\Json
     */
    public function update(Request $request, $id)

    {

            $data = Util::postMore(['title','status','eng_title','icon','type'],$request);

        if(!$data['title']) return Json::fail('请输入分类昵称');

        if(!$data['eng_title']) return Json::fail('请输入分类字段');

        if(!ConfigTabModel::get($id)) return Json::fail('编辑的记录不存在!');

        ConfigTabModel::edit($data,$id);

        return Json::successful('修改成功!');

    }

    /**
     * @param $id
     * @return \think\facade\Response\Json
     */
    public function delete($id){

        if(!ConfigTabModel::del($id))

            return Json::fail(ConfigTabModel::getErrorInfo('删除失败,请稍候再试!'));

        else

            return Json::successful('删除成功!');

    }

}

