<?php

namespace app\admin\controller\system;

use EasyWeChat\ShakeAround\Group;
use service\UtilService as Util;

use service\JsonService as Json;

use think\facade\Request;

use think\facade\Url;

use app\admin\model\system\SystemGroup as GroupModel;

use app\admin\model\system\SystemGroupData as GroupDataModel;

use app\admin\controller\AuthController;


/**
 * 组合数据控制器
 * Class SystemGroup
 * @package app\admin\controller\system
 */
class SystemGroup extends AuthController
{

    /**
     * 显示资源列表
     *
     * @return \think\facade\Response
     */
    public function index()
    {
        $this->assign(GroupModel::page());
        return $this->fetch();
    }

    /**
     * 显示创建资源表单页.
     *
     * @return \think\facade\Response
     */
    public function create()
    {
        $this->assign(['title'=>'添加数据组','save'=>Url::build('save')]);
        return $this->fetch();
    }

    /**
     * 保存新建的资源
     *
     * @param  \think\facade\Request  $request
     * @return \think\facade\Response
     */
    public function save(Request $request)
    {
        $params = Util::postMore([
            ['name',''],
            ['config_name',''],
            ['info',''],
            ['typelist',[]],
        ],$this->request);

        //数据组名称判断
        if(!$params['name'])return Json::fail('请输入数据组名称！');
        if(!$params['config_name'])return Json::fail('请输入配置名称！');
        if(GroupModel::be($params['config_name'],'config_name')) return Json::fail('数据关键字已存在！');
        $data["name"] = $params['name'];
        $data["config_name"] = $params['config_name'];
        $data["info"] = $params['info'];
        //字段信息判断
        if(!count($params['typelist']))
            return Json::fail('字段至少存在一个！');
        else{
            $validate = ["name","type","title","description"];
            foreach ($params["typelist"] as $key => $value) {
                foreach ($value as $name => $field) {
                    if(empty($field["value"]) && in_array($name,$validate))
                        return Json::fail("字段".($key + 1)."：".$field["placeholder"]."不能为空！");
                    else
                        $data["fields"][$key][$name] = $field["value"];
                }
            }
        }
        $data["fields"] = json_encode($data["fields"]);
        GroupModel::set($data);
        return Json::successful('添加数据组成功!');
    }
    /**
     * 删除指定资源
     *
     * @param  int  $id
     * @return \think\facade\Response
     */
    public function delete($id)
    {
        if(!GroupModel::del($id))
            return Json::fail(GroupModel::getErrorInfo('删除失败,请稍候再试!'));
        else{
            GroupDataModel::del(["gid"=>$id]);
            return Json::successful('删除成功!');
        }
    }
}
