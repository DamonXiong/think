<?php

namespace app\admin\controller\system;



use think\facade\Url;

use app\admin\library\FormBuilder;

use think\facade\Request;

use service\UtilService as Util;

use service\JsonService as Json;

use service\UploadService as Upload;

use app\admin\controller\AuthController;

use app\admin\model\system\SystemConfig as ConfigModel;


/**
 *  配置列表控制器
 * Class SystemConfig
 * @package app\admin\controller\system
 */
class SystemConfig extends AuthController
{
    /**

     * 获取文件名

     * */
    public function getImageName(){

        $request = Request::instance();

        $post = $request->post();

        $src = $post['src'];

        $data['name'] = basename($src);

        exit(json_encode($data));

    }
    /**

     * 基础配置

     * */
   public function index(){

       $type = input('type')!=0?input('type'):0;
       $tab_id = input('tab_id');

       if(!$tab_id) $tab_id = 1;

       $this->assign('tab_id',$tab_id);

       $list = ConfigModel::getAll($tab_id);

       $config_tab = ConfigModel::getConfigTabAll($type);

       foreach ($config_tab as $kk=>$vv){

           $arr = ConfigModel::getAll($vv['value'])->toArray();

           if(empty($arr)){

               unset($config_tab[$kk]);

           }

       }

       $this->assign('config_tab',$config_tab);

       $this->assign('list',$list);

       return $this->fetch();

   }
   /**
    * 保存数据    true
    * */
   public function save_basics(){


       $request = Request::instance();

       if($request->isPost()){

           $post = $request->post();

           $tab_id = $post['tab_id'];

           unset($post['tab_id']);

           foreach ($post as $k=>$v){
               if(is_array($v)){
                   $res = ConfigModel::where('menu_name',$k)->column('type,upload_type');
                   foreach ($res as $kk=>$vv){
                       if($kk == 'upload'){
                           if($vv == 1 || $vv == 3){
                               $post[$k] = $v[0];
                           }
                       }
                   }
               }
           }
           foreach ($post as $k=>$v){
               ConfigModel::edit(['value' => json_encode($v)],$k,'menu_name');
           }

           return $this->successfulNotice('修改成功');

       }
   }
   /**

    * 添加字段

    * */
   public function create(Request $request){

       $data = Util::getMore(['type',],$request);//接收参数

       switch ($data['type']){

           case 0://文本框

               ConfigModel::createInputRule();

               break;

           case 1://多行文本框

               ConfigModel::createTextAreaRule();

               break;

           case 2://单选框

               ConfigModel::createRadioRule();

               break;

           case 3://文件上传

               ConfigModel::createUploadRule();

               break;

           case 4://多选框

               ConfigModel::createCheckboxRule();

               break;

       }

       $rules =  FormBuilder::builder()->getContent();

       $this->assign(['title'=>'编辑菜单','rules'=>$rules,'save'=>Url::build('save')]);

       return $this->fetch();

   }
   /**

    * 保存字段

    * */
   public function save(Request $request){

       $data = Util::postMore([

           'menu_name',

           'type',

           'config_tab_id',

           'parameter',

           'upload_type',

           'required',

           'width',

           'high',

           'value',

           'info',

           'desc',

           'sort',

           'status',],$request);

       if(!$data['info']) return Json::fail('请输入配置名称');

       if(!$data['menu_name']) return Json::fail('请输入字段名称');

       if($data['menu_name']){

           $oneConfig = ConfigModel::getOneConfig('menu_name',$data['menu_name']);

           if(!empty($oneConfig)) return Json::fail('请重新输入字段名称,之前的已经使用过了');

       }

       if(!$data['desc']) return Json::fail('请输入配置简介');

       if($data['sort'] < 0){

           $data['sort'] = 0;

       }

       if($data['type'] == 'text'){

           if(!ConfigModel::valiDateTextRole($data)) return Json::fail(ConfigModel::getErrorInfo());

       }

       if($data['type'] == 'textarea'){

           if(!ConfigModel::valiDateTextareaRole($data)) return Json::fail(ConfigModel::getErrorInfo());

       }

       if($data['type'] == 'radio' || $data['type'] == 'checkbox'){

           if(!$data['parameter']) return Json::fail('请输入配置参数');

           if(!ConfigModel::valiDateRadioAndCheckbox($data)) return Json::fail(ConfigModel::getErrorInfo());

       }

       $data['value'] = json_encode($data['value']);

       ConfigModel::set($data);

       return Json::successful('添加菜单成功!');

   }
   /**

    * 模板表单提交

    * */
   public function view_upload(){

       if($_POST['type'] == 3){

           $res = Upload::file($_POST['file'],'config/file');

       }else{

           $res = Upload::Image($_POST['file'],'config/image');

       }

       if(!$res->status) return Json::fail($res->error);

       return Json::successful('上传成功!',['url'=>$res->filePath]);

   }
    /**
     * 基础配置  单个
     * @return mixed|void
     */
    public function index_alone(){

        $tab_id = input('tab_id');

        if(!$tab_id) return $this->failed('参数错误，请重新打开');

        $this->assign('tab_id',$tab_id);

        $list = ConfigModel::getAll($tab_id);

        $config_tab = ConfigModel::getConfigTabAll();

        foreach ($config_tab as $kk=>$vv){

            $arr = ConfigModel::getAll($vv['value'])->toArray();

            if(empty($arr)){

                unset($config_tab[$kk]);

            }

        }

        $this->assign('config_tab',$config_tab);

        $this->assign('list',$list);

        return $this->fetch();

    }
    /**
     * 保存数据  单个
     * @return mixed
     */
    public function save_basics_alone(){


        $request = Request::instance();

        if($request->isPost()){

            $post = $request->post();

            $tab_id = $post['tab_id'];

            unset($post['tab_id']);

            foreach ($post as $k=>$v){

                ConfigModel::edit(['value' => json_encode($v)],$k,'menu_name');

            }

            return $this->successfulNotice('修改成功');

        }
    }
}

