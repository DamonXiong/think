<?php

namespace app\admin\controller\system;

use app\admin\controller\AuthController;
use app\admin\library\FormBuilder;
use app\admin\model\system\SystemAdmin;
use app\admin\model\system\SystemNotice as NoticeModel;
use service\JsonService;
use service\UtilService;
use think\facade\Request;
use think\facade\Url;


/**
 * 管理员消息通知 控制器
 * Class SystemNotice
 * @package app\admin\controller\system
 */
class SystemNotice extends AuthController

{

    public function rules()
    {
        FormBuilder::text('title','通知标题');
        FormBuilder::text('type','通知类型');
        FormBuilder::text('icon','图标');
        FormBuilder::text('template','通知模板');
        FormBuilder::textarea('table_title','通知数据')->placeholder('数据1-key1,数据2-key2');
        FormBuilder::select('push_admin','通知管理员',function(){
            $list = SystemAdmin::getOrdAdmin('real_name,id')?:[];
            $options = [];
            foreach ($list as $admin){
                $options[] = ['label'=>$admin['real_name'],'value'=>$admin['id']];
            }
            return $options;
        })->multiple();
        FormBuilder::radio('status','状态',[['label'=>'开启','value'=>1],['label'=>'关闭','value'=>0]],1);
        return FormBuilder::builder();
    }


     public function index(){

         $this->assign(NoticeModel::page(function($notice){
             $notice->push_admin_name = !empty($notice->push_admin) ? implode(',',SystemAdmin::where('id','IN',$notice->push_admin)->column('real_name')) : '';
         }));

        return $this->fetch();
     }

     public function create()
     {
        $this->assign(['title'=>'添加通知模板','rules'=>$this->rules()->getContent(),'action'=>Url::build('save')]);
        return $this->fetch();
     }

     public function save(Request $request)
     {
         $data = UtilService::postMore([
             'title', 'type', 'icon', 'template','table_title',
             ['push_admin', []], ['status', 0]
         ], $request);
         $data['push_admin'] = array_unique(array_filter($data['push_admin']));
         if (!$data['template']) return $this->failed('请填写通知模板');
         if (!$data['title']) return $this->failed('请输入模板标题');
         if (!$data['type']) return $this->failed('请输入模板类型');
         if (NoticeModel::set($data))
             return $this->successful('添加通知成功');
         else
             return $this->failed('添加失败!');
     }

     public function edit($id)
     {
         $data = NoticeModel::get($id);
         if(!$data) return JsonService::fail('数据不存在!');
         $data->tableTitle = implode(',',array_map(function($value){
             return $value['title'].'-'.$value['key'];
         },$data->table_title));
         $data->tableTitleStr = implode(',',array_map(function($value){
             return $value['title'].'-'.$value['key'];
         },$data->table_title));
         FormBuilder::text('title','通知标题',$data->title);
         FormBuilder::text('type','通知类型',$data->type);
         FormBuilder::text('icon','图标',$data->icon);
         FormBuilder::text('template','通知模板',$data->template);
         FormBuilder::textarea('table_title','通知数据',$data->tableTitleStr)->placeholder('数据1-key1,数据2-key2');
         FormBuilder::select('push_admin','通知管理员',function(){
             $list = SystemAdmin::getOrdAdmin('real_name,id')?:[];
             $options = [];
             foreach ($list as $admin){
                 $options[] = ['label'=>$admin['real_name'],'value'=>$admin['id']];
             }
             return $options;
         },array_map(function($v){return (int)$v;},$data->push_admin))->multiple();
         FormBuilder::radio('status','状态',[['label'=>'开启','value'=>1],['label'=>'关闭','value'=>0]],$data->status);
         $rules = FormBuilder::builder();
         $this->assign(['title'=>'编辑通知模板','rules'=>$rules->getContent(),'action'=>Url::build('update',array('id'=>$id))]);
         return $this->fetch();
     }
    public function update(Request $request, $id)
    {
        $data = UtilService::postMore([
            'title','type','icon','template','table_title',
            ['push_admin',[]],['status',0]
        ],$request);
        $data['push_admin'] = array_unique(array_filter($data['push_admin']));
        if(!$data['template']) return $this->failed('请填写通知模板');
        if(!$data['title']) return $this->failed('请输入模板标题');
        if(!$data['type']) return $this->failed('请输入模板类型');
        NoticeModel::edit($data,$id);
        return $this->successful('修改成功!');
    }

    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\facade\Response
     */
    public function delete($id)
    {
        $res = NoticeModel::del($id);
        if(!$res)
            return $this->failed(('删除失败,请稍候再试!'));
        else
            return $this->successful('删除成功!');
    }

     public function message($type = 'all')
     {
        return $this->fetch();
     }

}

