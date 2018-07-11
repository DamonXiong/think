<?php
namespace  app\routine\model\routine;

class RoutineTemplate{


    /**
     * 获取小程序模板库所有标题列表
     * @param string $accessToken
     * @param int $offset
     * @param int $count
     * @return mixed
     */
    public static function getTemplateListAll($offset = 0,$count = 20){
        $accessToken = RoutineServer::get_access_token();
        $url = "https://api.weixin.qq.com/cgi-bin/wxopen/template/library/list?access_token=".$accessToken;
        $data['access_token'] = $accessToken;
        $data['offset'] = $offset;
        $data['count'] = $count;
        return json_decode(RoutineServer::curlPost($url,json_encode($data)),true);
    }

    /**
     * 获取模板库某个模板标题下关键词库
     * @param string $templateId    模板ID 未添加之前的ID
     * @return mixed
     */
    public static function getTemplateKeyword($templateId = 'AT0005'){
        $accessToken = RoutineServer::get_access_token();
        $url = "https://api.weixin.qq.com/cgi-bin/wxopen/template/library/get?access_token=".$accessToken;
        $data['access_token'] = $accessToken;
        $data['id'] = $templateId;
        return json_decode(RoutineServer::curlPost($url,json_encode($data)),true);
    }

    /**
     * 获取小程序模板库申请的标题列表
     * @param int $offset
     * @param int $count
     * @return mixed
     */
    public static function getTemplateList($offset = 0,$count = 20){
        $accessToken = RoutineServer::get_access_token();
        $url = "https://api.weixin.qq.com/cgi-bin/wxopen/template/list?access_token=".$accessToken;
        $data['access_token'] = $accessToken;
        $data['offset'] = $offset;
        $data['count'] = $count;
        return json_decode(RoutineServer::curlPost($url,json_encode($data)),true);
    }

    /**
     * 删除小程序中的某个模板消息
     * @param string $templateId
     * @return bool|mixed
     */
    public static function delTemplate($templateId = ''){
        if($templateId == '') return false;
        $accessToken = RoutineServer::get_access_token();
        $url = "https://api.weixin.qq.com/cgi-bin/wxopen/template/del?access_token=".$accessToken;
        $data['access_token'] = $accessToken;
        $data['template_id'] = $templateId;
        return json_decode(RoutineServer::curlPost($url,json_encode($data)),true);
    }

    /**
     * 发送模板消息
     * @param string $openId   接收者（用户）的 openid
     * @param string $templateId 所需下发的模板消息的id
     * @param string $link 点击模板卡片后的跳转页面，仅限本小程序内的页面。支持带参数,（示例index?foo=bar）。该字段不填则模板无跳转。
     * @param string $formId 表单提交场景下，为 submit 事件带上的 formId；支付场景下，为本次支付的 prepay_id
     * @param array $dataKey 模板内容，不填则下发空模板
     * @param string $emphasisKeyword 模板需要放大的关键词，不填则默认无放大
     * @return bool|mixed
     */
    public static function sendTemplate($openId = '',$templateId = '',$link = '',$dataKey = array(),$formId = '',$emphasisKeyword = ''){
        if($openId == '' || $templateId == '' || $formId == '') return false;
        $accessToken = RoutineServer::get_access_token();
        $url = "https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token=".$accessToken;
        $data['touser'] =  $openId;//接收者（用户）的 openid
        $data['template_id'] =  $templateId; //所需下发的模板消息的id
        $data['page'] =  $link; //点击模板卡片后的跳转页面，仅限本小程序内的页面。支持带参数,（示例index?foo=bar）。该字段不填则模板无跳转。
        $data['form_id'] =  $formId; //	表单提交场景下，为 submit 事件带上的 formId；支付场景下，为本次支付的 prepay_id
        $data['data'] =  $dataKey;  //模板内容，不填则下发空模板
        $data['emphasis_keyword'] =  $emphasisKeyword;  //模板需要放大的关键词，不填则默认无放大
        return json_decode(RoutineServer::curlPost($url,json_encode($data)),true);
    }
}