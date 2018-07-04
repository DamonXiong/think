<?php

namespace app\admin\controller\user;



use app\admin\controller\AuthController;

use app\admin\library\FormBuilder;

use traits\CurdControllerTrait;

use service\UtilService as Util;

use service\JsonService as Json;

use think\facade\Request;

use think\facade\Url;

use app\admin\model\user\User as UserModel;

use app\wap\model\user\UserBill;

use basic\ModelBasic;

use service\HookService;

use behavior\wap\UserBehavior;

use app\admin\model\store\StoreVisit;

use app\admin\model\wechat\WechatMessage;


/**
 * 用户管理控制器
 * Class User
 * @package app\admin\controller\user
 */
class User extends AuthController

{



    use CurdControllerTrait;



    /**

     * 显示资源列表

     *

     * @return \think\facade\Response

     */


    public function index()

    {

        $where = Util::getMore([
            ['nickname', ''],
            ['status', ''],
            ['is_promoter', ''],
            ['date', ''],
            ['user_type', ''],
            ['export', 0]
        ], $this->request);
        $this->assign(UserModel::systemPage($where));
        $this->assign('where', $where);
        return $this->fetch();

    }

    /**

     * 编辑模板消息

     * @param $id

     * @return mixed|\think\facade\Response\Json|void

     */

    public function edit($uid)

    {

        if (!$uid) return $this->failed('数据不存在');

        $user = UserModel::get($uid);

        if (!$user) return Json::fail('数据不存在!');

        $this->assign([

            'title' => '编辑用户消息', 'rules' => $this->read($uid)->getContent(),

            'action' => Url::build('update', array('id' => $uid))

        ]);

        return $this->fetch('public/common_form');

    }

    public function read($uid)

    {

        if (!$uid) return $this->failed('数据不存在');

        $user = UserModel::get($uid);

        if (!$user) return Json::fail('数据不存在!');

        FormBuilder::text('uid', '用户编号', $user->getData('uid'))->readonly();

        FormBuilder::text('nickname', '用户姓名', $user->getData('nickname'))->readonly();

        FormBuilder::radio('money_status', '修改余额', [['value' => 1, 'label' => '增加'], ['value' => 2, 'label' => '减少']], 1);
        FormBuilder::number('money', '余额')->min(0);
        FormBuilder::radio('integration_status', '修改积分', [['value' => 1, 'label' => '增加'], ['value' => 2, 'label' => '减少']], 1);
        FormBuilder::number('integration', '积分')->min(0);
        FormBuilder::radio('status', '状态', [['value' => 1, 'label' => '开启'], ['value' => 0, 'label' => '锁定']], $user->getData('status'));
        FormBuilder::radio('is_promoter', '推广员', [['value' => 1, 'label' => '开启'], ['value' => 0, 'label' => '关闭']], $user->getData('is_promoter'));

        return FormBuilder::builder();

    }

    public function update(Request $request, $uid)
    {
        $data = Util::postMore([
            ['money_status', 0],
            ['is_promoter', 1],
            ['money', 0],
            ['integration_status', 0],
            ['integration', 0],
            ['status', 0],
        ], $request);
        if (!$uid) return $this->failed('数据不存在');
        $user = UserModel::get($uid);
        if (!$user) return Json::fail('数据不存在!');
        ModelBasic::beginTrans();
        $res1 = false;
        $res2 = false;
        $edit = array();
        if ($data['money_status'] && $data['money']) {//余额增加或者减少
            if ($data['money_status'] == 1) {//增加
                $edit['now_money'] = bcadd($user['now_money'], $data['money'], 2);
                $res1 = UserBill::income('系统增加余额', $user['uid'], 'now_money', 'system_add', $data['money'], $this->adminId, $user['now_money'], '系统增加了' . floatval($data['money']) . '余额');
                try {
                    HookService::listen('admin_add_money', $user, $data['money'], false, UserBehavior::class);
                } catch (\Exception $e) {
                    ModelBasic::rollbackTrans();
                    return Json::fail($e->getMessage());
                }
            } else if ($data['money_status'] == 2) {//减少
                $edit['now_money'] = bcsub($user['now_money'], $data['money'], 2);
                $res1 = UserBill::expend('系统减少余额', $user['uid'], 'now_money', 'system_sub', $data['money'], $this->adminId, $user['now_money'], '系统扣除了' . floatval($data['money']) . '余额');
                try {
                    HookService::listen('admin_sub_money', $user, $data['money'], false, UserBehavior::class);
                } catch (\Exception $e) {
                    ModelBasic::rollbackTrans();
                    return Json::fail($e->getMessage());
                }
            }
        } else {
            $res1 = true;
        }
        if ($data['integration_status'] && $data['integration']) {//积分增加或者减少
            if ($data['integration_status'] == 1) {//增加
                $edit['integral'] = bcadd($user['integral'], $data['integration'], 2);
                $res2 = UserBill::income('系统增加积分', $user['uid'], 'integral', 'system_add', $data['integration'], $this->adminId, $user['integral'], '系统增加了' . floatval($data['integration']) . '积分');
                try {
                    HookService::listen('admin_add_integral', $user, $data['integration'], false, UserBehavior::class);
                } catch (\Exception $e) {
                    ModelBasic::rollbackTrans();
                    return Json::fail($e->getMessage());
                }
            } else if ($data['integration_status'] == 2) {//减少
                $edit['integral'] = bcsub($user['integral'], $data['integration'], 2);
                $res2 = UserBill::expend('系统减少积分', $user['uid'], 'integral', 'system_sub', $data['integration'], $this->adminId, $user['integral'], '系统扣除了' . floatval($data['integration']) . '积分');
                try {
                    HookService::listen('admin_sub_integral', $user, $data['integration'], false, UserBehavior::class);
                } catch (\Exception $e) {
                    ModelBasic::rollbackTrans();
                    return Json::fail($e->getMessage());
                }
            }
        } else {
            $res2 = true;
        }
        $edit['status'] = $data['status'];
        $edit['is_promoter'] = $data['is_promoter'];
        if ($edit) $res3 = UserModel::edit($edit, $uid);
        else $res3 = true;
        if ($res1 && $res2 && $res3) $res = true;
        else $res = false;
        ModelBasic::checkTrans($res);
        if ($res) return Json::successful('修改成功!');
        else return Json::fail('修改失败');

    }

    /**
     * 用户图表
     * @return mixed
     */
    public function user_analysis()
    {
        $where = Util::getMore([
            ['nickname', ''],
            ['status', ''],
            ['is_promoter', ''],
            ['date', ''],
            ['user_type', ''],
            ['export', 0]
        ], $this->request);

        $user_count = UserModel::consume($where, '', true);
        //头部信息
        $header = [
            [
                'name' => '新增用户',
                'class' => 'fa-line-chart',
                'value' => $user_count,
                'color' => 'red'
            ],
            [
                'name' => '用户留存',
                'class' => 'fa-area-chart',
                'value' => $this->gethreaderValue(UserModel::consume($where, '', true), $where) . '%',
                'color' => 'lazur'
            ],
            [
                'name' => '新增用户总消费',
                'class' => 'fa-bar-chart',
                'value' => '￥' . UserModel::consume($where),
                'color' => 'navy'
            ],
            [
                'name' => '用户活跃度',
                'class' => 'fa-pie-chart',
                'value' => $this->gethreaderValue(UserModel::consume($where, '', true)) . '%',
                'color' => 'yellow'
            ],
        ];

        $name = ['新增用户', '用户消费'];
        $dates = $this->get_user_index($where, $name);
        $user_index = ['name' => json_encode($name), 'date' => json_encode($dates['time']), 'series' => json_encode($dates['series'])];
        //用户浏览分析
        $view = StoreVisit::getVisit($where['date'], ['', 'warning', 'info', 'danger']);
        $view_v1 = WechatMessage::getViweList($where['date'], ['', 'warning', 'info', 'danger']);
        $view = array_merge($view, $view_v1);
        $view_v2 = [];
        foreach ($view as $val) {
            $view_v2['color'][] = '#' . rand(100000, 339899);
            $view_v2['name'][] = $val['name'];
            $view_v2['value'][] = $val['value'];
        }
        $view = $view_v2;
        //消费会员排行用户分析
        $user_null = UserModel::getUserSpend($where['date']);
        //消费数据
        $now_number = UserModel::getUserSpend($where['date'], true);
        list($paren_number, $title) = UserModel::getPostNumber($where['date']);
        if ($paren_number == 0) {
            $rightTitle = [
                'number' => $now_number > 0 ? $now_number : 0,
                'icon' => 'fa-level-up',
                'title' => $title
            ];
        } else {
            $number = (float)bcsub($now_number, $paren_number, 4);
            if ($now_number == 0) {
                $icon = 'fa-level-down';
            } else {
                $icon = $now_number > $paren_number ? 'fa-level-up' : 'fa-level-down';
            }
            $rightTitle = ['number' => $number, 'icon' => $icon, 'title' => $title];
        }
        unset($title, $paren_number, $now_number);
        list($paren_user_count, $title) = UserModel::getPostNumber($where['date'], true, 'add_time', '');
        if ($paren_user_count == 0) {
            $count = $user_count == 0 ? 0 : $user_count;
            $icon = $user_count == 0 ? 'fa-level-down' : 'fa-level-up';
        } else {
            $count = (float)bcsub($user_count, $paren_user_count, 4);
            $icon = $user_count < $paren_user_count ? 'fa-level-down' : 'fa-level-up';
        }
        $leftTitle = [
            'count' => $count,
            'icon' => $icon,
            'title' => $title
        ];
        unset($count, $icon, $title);
        $consume = [
            'title' => '消费金额为￥' . UserModel::consume($where),
            'series' => UserModel::consume($where, 'xiaofei'),
            'rightTitle' => $rightTitle,
            'leftTitle' => $leftTitle,
        ];
        $form = UserModel::consume($where, 'form');
        $grouping = UserModel::consume($where, 'grouping');
        $this->assign(compact('header', 'user_index', 'view', 'user_null', 'consume', 'form', 'grouping', 'where'));
        return $this->fetch();
    }

    public function gethreaderValue($chart, $where = [])
    {
        if ($where) {
            switch ($where['date']) {
                case null:
                case 'today':
                case 'week':
                case 'year':
                    if ($where['date'] == null) {
                        $where['date'] = 'month';
                    }
                    $sum_user = UserModel::whereTime('add_time', $where['date'])->count();
                    if ($sum_user == 0) return 0;
                    $counts = bcdiv($chart, $sum_user, 4) * 100;
                    return $counts;
                    break;
                case 'quarter':
                    $quarter = UserModel::getMonth('n');
                    $quarter[0] = strtotime($quarter[0]);
                    $quarter[1] = strtotime($quarter[1]);
                    $sum_user = UserModel::where('add_time', 'between', $quarter)->count();
                    if ($sum_user == 0) return 0;
                    $counts = bcdiv($chart, $sum_user, 4) * 100;
                    return $counts;
                default:
                    //自定义时间
                    $quarter = explode('-', $where['date']);
                    $quarter[0] = strtotime($quarter[0]);
                    $quarter[1] = strtotime($quarter[1]);
                    $sum_user = UserModel::where('add_time', 'between', $quarter)->count();
                    if ($sum_user == 0) return 0;
                    $counts = bcdiv($chart, $sum_user, 4) * 100;
                    return $counts;
                    break;
            }
        } else {
            $num = UserModel::count();
            $chart = $num != 0 ? bcdiv($chart, $num, 5) * 100 : 0;
            return $chart;
        }
    }
    public function get_user_index($where, $name)
    {
        switch ($where['date']) {
            case null:
                $days = date("t", strtotime(date('Y-m', time())));
                $dates = [];
                $series = [];
                $times_list = [];
                foreach ($name as $key => $val) {
                    for ($i = 1; $i <= $days; $i++) {
                        if (!in_array($i . '号', $times_list)) {
                            array_push($times_list, $i . '号');
                        }
                        $time = $this->gettime(date("Y-m", time()) . '-' . $i);
                        if ($key == 0) {
                            $dates['data'][] = UserModel::where('add_time', 'between', $time)->count();
                        } else if ($key == 1) {
                            $dates['data'][] = UserModel::consume(true, $time);
                        }
                    }
                    $dates['name'] = $val;
                    $dates['type'] = 'line';
                    $series[] = $dates;
                    unset($dates);
                }
                return ['time' => $times_list, 'series' => $series];
            case 'today':
                $dates = [];
                $series = [];
                $times_list = [];
                foreach ($name as $key => $val) {
                    for ($i = 0; $i <= 24; $i++) {
                        $strtitle = $i . '点';
                        if (!in_array($strtitle, $times_list)) {
                            array_push($times_list, $strtitle);
                        }
                        $time = $this->gettime(date("Y-m-d ", time()) . $i);
                        if ($key == 0) {
                            $dates['data'][] = UserModel::where('add_time', 'between', $time)->count();
                        } else if ($key == 1) {
                            $dates['data'][] = UserModel::consume(true, $time);
                        }
                    }
                    $dates['name'] = $val;
                    $dates['type'] = 'line';
                    $series[] = $dates;
                    unset($dates);
                }
                return ['time' => $times_list, 'series' => $series];
            case "week":
                $dates = [];
                $series = [];
                $times_list = [];
                foreach ($name as $key => $val) {
                    for ($i = 0; $i <= 6; $i++) {
                        if (!in_array('星期' . ($i + 1), $times_list)) {
                            array_push($times_list, '星期' . ($i + 1));
                        }
                        $time = UserModel::getMonth('h', $i);
                        if ($key == 0) {
                            $dates['data'][] = UserModel::where('add_time', 'between', [strtotime($time[0]), strtotime($time[1])])->count();
                        } else if ($key == 1) {
                            $dates['data'][] = UserModel::consume(true, [strtotime($time[0]), strtotime($time[1])]);
                        }
                    }
                    $dates['name'] = $val;
                    $dates['type'] = 'line';
                    $series[] = $dates;
                    unset($dates);
                }
                return ['time' => $times_list, 'series' => $series];
            case 'year':
                $dates = [];
                $series = [];
                $times_list = [];
                $year = date('Y');
                foreach ($name as $key => $val) {
                    for ($i = 1; $i <= 12; $i++) {
                        if (!in_array($i . '月', $times_list)) {
                            array_push($times_list, $i . '月');
                        }
                        $t = strtotime($year . '-' . $i . '-01');
                        $arr = explode('/', date('Y-m-01', $t) . '/' . date('Y-m-', $t) . date('t', $t));
                        if ($key == 0) {
                            $dates['data'][] = UserModel::where('add_time', 'between', [strtotime($arr[0]), strtotime($arr[1])])->count();
                        } else if ($key == 1) {
                            $dates['data'][] = UserModel::consume(true, [strtotime($arr[0]), strtotime($arr[1])]);
                        }
                    }
                    $dates['name'] = $val;
                    $dates['type'] = 'line';
                    $series[] = $dates;
                    unset($dates);
                }
                return ['time' => $times_list, 'series' => $series];
            case 'quarter':
                $dates = [];
                $series = [];
                $times_list = [];
                foreach ($name as $key => $val) {
                    for ($i = 1; $i <= 4; $i++) {
                        $arr = $this->gettime('quarter', $i);
                        if (!in_array(implode('--', $arr) . '季度', $times_list)) {
                            array_push($times_list, implode('--', $arr) . '季度');
                        }
                        if ($key == 0) {
                            $dates['data'][] = UserModel::where('add_time', 'between', [strtotime($arr[0]), strtotime($arr[1])])->count();
                        } else if ($key == 1) {
                            $dates['data'][] = UserModel::consume(true, [strtotime($arr[0]), strtotime($arr[1])]);
                        }
                    }
                    $dates['name'] = $val;
                    $dates['type'] = 'line';
                    $series[] = $dates;
                    unset($dates);
                }
                return ['time' => $times_list, 'series' => $series];
            default:
                $list = UserModel::consume($where, 'default');
                $dates = [];
                $series = [];
                $times_list = [];
                foreach ($name as $k => $v) {
                    foreach ($list as $val) {
                        $date = $val['add_time'];
                        if (!in_array($date, $times_list)) {
                            array_push($times_list, $date);
                        }
                        if ($k == 0) {
                            $dates['data'][] = $val['num'];
                        } else if ($k == 1) {
                            $dates['data'][] = UserBill::where(['uid' => $val['uid'], 'type' => 'pay_product'])->sum('number');
                        }
                    }
                    $dates['name'] = $v;
                    $dates['type'] = 'line';
                    $series[] = $dates;
                    unset($dates);
                }
                return ['time' => $times_list, 'series' => $series];
        }
    }

    public function gettime($time = '', $season = '')
    {
        if (!empty($time) && empty($season)) {
            $timestamp0 = strtotime($time);
            $timestamp24 = strtotime($time) + 86400;
            return [$timestamp0, $timestamp24];
        } else if (!empty($time) && !empty($season)) {
            $firstday = date('Y-m-01', mktime(0, 0, 0, ($season - 1) * 3 + 1, 1, date('Y')));
            $lastday = date('Y-m-t', mktime(0, 0, 0, $season * 3, 1, date('Y')));
            return [$firstday, $lastday];
        }
    }



}

