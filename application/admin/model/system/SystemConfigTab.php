<?php

/**

 *

 * @author: xaboy<365615158@qq.com>

 * @day: 2017/11/02

 */

namespace app\admin\model\system;

use traits\ModelTrait;
use basic\ModelBasic;
use think\Db;

/**
 * 配置分类model
 *
 * Class SystemConfigTab
 * @package app\admin\model\system
 */
class SystemConfigTab extends ModelBasic {

    use ModelTrait;
    /**
     * 获取单选按钮或者多选按钮的显示值
     * */
    public static function getRadioOrCheckboxValueInfo($menu_name,$value){
        $parameter = array();
        $option = array();
        $config_one = \app\admin\model\system\SystemConfig::getOneConfig('menu_name',$menu_name);
//        dump($config_one);
//        exit();
//        if(empty($menu) || !($config_one = self::get(['menu_name'=>$menu]))) return false;
        $parameter = explode("\n",$config_one['parameter']);
        foreach ($parameter as $k=>$v){
            if(isset($v) && !empty($v)){
                $option[$k] = explode('=',$v);
            }
        }
//        $value = json_decode($value,true);
        if(!is_array($value)){
            $value = explode("\n",$value);
        }
//        dump($value);
//        dump($option);
        $value_arr = array();//选项的值
        foreach ($option as $k=>$v){
            foreach ($v as $kk=>$vv){
                if(is_array($value)) {
                    if (in_array($v[0], $value)) {
                        $value_arr[$k] = $v[1];
                    }
                }
                break;
            }
        }
        if(empty($value_arr)){
            return '空';
        }
        return $value_arr;
//        exit();
//        if(is_array($value)){
//            foreach ($value as $k=>$value_v){
//                if(in_array($value_v,$value_arr)){
//                    $i[$k] = 1;
//                }
//            }
//            if(count($value) != $i) return self::setErrorInfo('输入的值不属于选项中的参数');
//        }else{
//            if(in_array($value,$value_arr)){
//                $i++;
//            }
//            if(!$i) return self::setErrorInfo('输入的值不属于选项中的参数');
//        }
//        if($config_one['type'] == 'radio' && is_array($value)) return self::setErrorInfo('单选按钮的值是字符串不是数组');
    }
    /**
     * 插入数据到数据库
     * */
    public static function set($data)
    {
        return self::create($data);
    }
    /**
     * 获取全部
     * */
    public static function getAll($type = 0){
        $where['status'] = 1;
        if($type>-1)$where['type'] = $type;
        return Db::table('eb_system_config_tab')->where($where)->select();
    }

    /**
     * 获取配置分类
     * */
    public static function getSystemConfigTabPage($where = array())

    {
        $model = new self;
        if($where['title'] != '') $model = $model->where('title','LIKE',"%$where[title]%");
        if($where['status'] != '') $model = $model->where('status',$where['status']);
        return self::page($model,$where);

    }

    public static function edit($data,$id,$field='id')

    {

        return self::update($data,[$field=>$id]);

    }

    /**
     * 更新数据
     * @access public
     * @param array      $data  数据数组
     * @param array      $where 更新条件
     * @param array|true $field 允许字段
     * @return $this
     */
    public static function update($data = [], $where = [], $field = null)
    {
        $model = new static();
        if (!empty($field)) {
            $model->allowField($field);
        }
        $result = $model->isUpdate(true)->save($data, $where);
        return $model;
    }
}