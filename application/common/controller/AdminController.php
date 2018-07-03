<?php
/**
 * | AndPHP框架[基于ThinkPHP5开发]
 * +----------------------------------------------------------------------
 * | Copyright (c) 2017-2019 http://www.andphp.com
 * +----------------------------------------------------------------------
 * | AndPHP承诺基础框架永久免费开源，您可用于学习和商用，但必须保留软件版权信息。
 * +----------------------------------------------------------------------
 * | author    :BabySeeME <417170808@qq.com>
 * +----------------------------------------------------------------------
 * | createTime :2018/4/19 001915:29
 * +----------------------------------------------------------------------
 */

namespace app\common\controller;


use think\facade\Cookie;
use org\Auth;
use think\facade\Session;

class AdminController extends AppController
{
    public $userSession;

    protected function initialize()
    {
        $this->userSession=Session::get('adminUser');
        $this->assign('skin_name', Cookie::get('skin_name'));

        $this->addCss('admin/css/global.css');
        $this->addCss('common/layui/css/layui.css');
        $this->addCss('common/font-awesome-4.7.0/css/font-awesome.css');

        $this->addJs('common/js/jquery-1.8.3.min.js');
        $this->addJs('common/layui/layui.js');
        $this->addJs('admin/js/global');

        $this->isLogin();

        parent::initialize(); // TODO: Change the autogenerated stub
    }
    public function fetchA(){
        $controllerName = request()->controller();
        $actionName = request()->action();
        $path=APP_PATH.strtolower($controllerName).DIRECTORY_SEPARATOR.'admin'.DIRECTORY_SEPARATOR.'view'.DIRECTORY_SEPARATOR.$actionName.'.'.config('template.view_suffix');
        return $this->fetch($path);
    }
    public function isLogin(){
        if(Session::has('adminUser') == true){
            $this->checkAuth('adminUser','admin/login/index');
            return true;
        }
        $this->redirect('admin/login/index');
        return false;
    }
    /**
     * 拼接菜单节点列表
     * @param $menu
     * @return array
     * @author     :BabySeeME <417170808@qq.com>
     * @createTime :2018-03-02 19:23
     */
    protected function menuList($menu){
        $menus = array();
        //先找出顶级菜单

        $userInfo= $this->userSession;
        foreach ($menu as $k => $val) {
            $check=(new Auth())->check($val['name'],$userInfo['id']);
            if($val['pid'] == 0  and $check==true) {
                $menus[$k] = $val;
            }
        }

        //通过顶级菜单找到下属的子菜单
        foreach ($menus as $k => $val) {
            foreach ($menu as $key => $value) {
//                if($value['pid'] == $val['id']) {
                if($value['pid'] == $val['id'] ) {
                    $menus[$k]['list'][] = $value;
                }
            }
        }
        return $menus;
    }
}