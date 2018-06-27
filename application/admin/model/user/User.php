<?php/** * * @author: xaboy<365615158@qq.com> * @day: 2017/11/11 */namespace app\admin\model\user;use traits\ModelTrait;use app\wap\model\user\UserBill;use basic\ModelBasic;use app\admin\model\wechat\WechatUser;/** * 用户管理 model * Class User * @package app\admin\model\user */class User extends ModelBasic{    use ModelTrait;    /**     * @param $where     * @return array     */    public static function systemPage($where){        $model = new self;        if($where['status'] != '')  $model = $model->where('status',$where['status']);        if($where['is_promoter'] != '')  $model = $model->where('is_promoter',$where['is_promoter']);        if($where['nickname'] != '') {            $model = $model->where('nickname','like',"%$where[nickname]%");            if((int)$where['nickname']){                $model = $model->whereOr('uid',(int)$where['nickname']);            }        }        $model = $model->order('uid desc');        return self::page($model,function ($item){            if($item['spread_uid']){                $item['spread_uid_nickname'] = self::where('uid',$item['spread_uid'])->value('nickname');            }else{                $item['spread_uid_nickname'] = '无';            }        },$where);    }    public static function getMonth($time='',$ceil=0){        if(empty($time)){            $firstday = date("Y-m-01",time());            $lastday = date("Y-m-d",strtotime("$firstday +1 month -1 day"));        }else if($time=='n'){            if($ceil!=0)                $season = ceil(date('n') /3)-$ceil;            else                $season = ceil(date('n') /3);            $firstday=date('Y-m-01',mktime(0,0,0,($season - 1) *3 +1,1,date('Y')));            $lastday=date('Y-m-t',mktime(0,0,0,$season * 3,1,date('Y')));        }else if($time=='y'){            $firstday=date('Y-01-01');            $lastday=date('Y-12-31');        }else if($time=='h'){            $firstday = date('Y-m-d', strtotime('this week +'.$ceil.' day')) . ' 00:00:00';            $lastday = date('Y-m-d', strtotime('this week +'.($ceil+1).' day')) . ' 23:59:59';        }        return array($firstday,$lastday);    }    public static function getcount(){        return self::count();    }    /*    *获取用户某个时间段的消费信息    *    * reutrn Array || number    */    public static function consume($where,$status='',$keep=''){        $model = new self;        $user_id=[];        if(is_array($where)){            if($where['is_promoter']!='') $model=$model->where('is_promoter',$where['is_promoter']);            if($where['status']!='')  $model=$model->where('status',$where['status']);            switch ($where['date']){                case null:case 'today':case 'week':case 'year':                if($where['date']==null){                    $where['date']='month';                }                if($keep){                    $model=$model->whereTime('add_time',$where['date'])->whereTime('last_time',$where['date']);                }else{                    $model=$model->whereTime('add_time',$where['date']);                }                break;                case 'quarter':                    $quarter=self::getMonth('n');                    $startTime=strtotime($quarter[0]);                    $endTime=strtotime($quarter[1]);                    if($keep){                        $model = $model->where('add_time','>',$startTime)->where('add_time','<',$endTime)->where('last_time','>',$startTime)->where('last_time','<',$endTime);                    }else{                        $model = $model->where('add_time','>',$startTime)->where('add_time','<',$endTime);                    }                    break;                default:                    //自定义时间                    if(strstr($where['date'],'-')!==FALSE){                        list($startTime,$endTime)=explode('-',$where['date']);                        $model = $model->where('add_time','>',strtotime($startTime))->where('add_time','<',strtotime($endTime));                    }else{                        $model=$model->whereTime('add_time','month');                    }                    break;            }        }else{            if(is_array($status)){                $model=$model->where('add_time','>',$status[0])->where('add_time','<',$status[1]);            }        }        if($keep===true){            return $model->count();        }        if($status==='default'){            return $model->group('from_unixtime(add_time,\'%Y-%m-%d\')')->field('count(uid) num,from_unixtime(add_time,\'%Y-%m-%d\') add_time,uid')->select()->toArray();        }        if($status==='grouping'){            return $model->group('user_type')->field('user_type')->select()->toArray();        }        $uid=$model->field('uid')->select()->toArray();        foreach ($uid as $val){            $user_id[]=$val['uid'];        }        if(empty($user_id)){            $user_id=[0];        }        if($status==='xiaofei'){            $list=UserBill::where('uid','in',$user_id)                ->group('type')                ->field('sum(number) as top_number,title')                ->select()                ->toArray();            $series=[                'name'=>isset($list[0]['title'])?$list[0]['title']:'',                'type'=>'pie',                'radius'=> ['40%', '50%'],                'data'=>[]            ];            foreach($list as $key=>$val){                $series['data'][$key]['value']=$val['top_number'];                $series['data'][$key]['name']=$val['title'];            }            return $series;        }else if($status==='form'){            $list=WechatUser::where('uid','in',$user_id)->group('city')->field('count(city) as top_city,city')->limit(0,10)->select()->toArray();            $count=self::getcount();            $option=[                'legend_date'=>[],                'series_date'=>[]            ];            foreach($list as $key=>$val){                $num=$count!=0?(bcdiv($val['top_city'],$count,2))*100:0;                $t=['name'=>$num.'%  '.(empty($val['city'])?'未知':$val['city']),'icon'=>'circle'];                $option['legend_date'][$key]=$t;                $option['series_date'][$key]=['value'=>$num,'name'=>$t['name']];            }            return $option;        }else{            $number=UserBill::where('uid','in',$user_id)->where('type','pay_product')->sum('number');            return $number;        }    }    /*     * 获取 用户某个时间段的钱数或者TOP20排行     *     * return Array  || number     */    public static function getUserSpend($date,$status=''){        $model=new self();        $model=$model->alias('A');        switch ($date){            case null:case 'today':case 'week':case 'year':            if($date==null) $date='month';            $model=$model->whereTime('A.add_time',$date);            break;            case 'quarter':                list($startTime,$endTime)=User::getMonth('n');                $model = $model->where('A.add_time','>',strtotime($startTime));                $model = $model->where('A.add_time','<',strtotime($endTime));                break;            default:                list($startTime,$endTime)=explode('-',$date);                $model = $model->where('A.add_time','>',strtotime($startTime));                $model = $model->where('A.add_time','<',strtotime($endTime));                break;        }        if($status===true){            return $model->join('user_bill B','B.uid=A.uid')->where('B.type','pay_product')->where('B.pm',0)->sum('B.number');        }        $list=$model->join('user_bill B','B.uid=A.uid')            ->where('B.type','pay_product')            ->where('B.pm',0)            ->field('sum(B.number) as totel_number,A.nickname,A.avatar,A.now_money,A.uid,A.add_time')            ->order('totel_number desc')            ->limit(0,20)            ->select()            ->toArray();        if(!isset($list[0]['totel_number'])){            $list=[];        }        return $list;    }    /*     * 获取 相对于上月或者其他的数据     *     * return Array     */    public static function getPostNumber($date,$status=false,$field='A.add_time',$t='消费'){        $model=new self();        if(!$status) $model=$model->alias('A');        switch ($date){            case null:case 'today':case 'week':case 'year':            if($date==null) {                $date='last month';                $title='相比上月用户'.$t.'增长';            }            if($date=='today') {                $date='yesterday';                $title='相比昨天用户'.$t.'增长';            }            if($date=='week') {                $date='last week';                $title='相比上周用户'.$t.'增长';            }            if($date=='year') {                $date='last year';                $title='相比去年用户'.$t.'增长';            }            $model=$model->whereTime($field,$date);            break;            case 'quarter':                $title='相比上季度用户'.$t.'增长';                list($startTime,$endTime)=User::getMonth('n',1);                $model = $model->where($field,'>',$startTime);                $model = $model->where($field,'<',$endTime);                break;            default:                list($startTime,$endTime)=explode('-',$date);                $title='相比'.$startTime.'-'.$endTime.'时间段用户'.$t.'增长';                $Time=strtotime($endTime)-strtotime($startTime);                $model = $model->where($field,'>',strtotime($startTime)+$Time);                $model = $model->where($field,'<',strtotime($endTime)+$Time);                break;        }        if($status){            return [$model->count(),$title];        }        $number=$model->join('user_bill B','B.uid=A.uid')->where('B.type','pay_product')->where('B.pm',0)->sum('B.number');        return [$number,$title];    }}