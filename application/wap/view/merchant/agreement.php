{extend name="public/container"}
{block name="head"}
<style>
    .wed-reservation .start-res a.disabled{background-color: #ccc;}
</style>
{/block}
{block name="content"}
<div class="wrapper">
    <section>
        <div class="wed-reservation martop">
            <div class="title">欢迎入驻西北养殖网</div>
            <h1>公司入驻说明</h1>
            <div class="txt-con">
                <p>预约成功后订单不可更改，如需取消将产生订金损失，退款规则如下：</p>
                <span>距拍摄时间72小时以上取消订单，退99%订金</span>
                <span>距拍摄时间48-72小时取消订单，退50%订金</span>
                <span>距拍摄时间不足48小时取消订单，不可退订金</span>
                <p>如未按预定日期到店，订单则视为放弃，订金将不予退还。</p>
                <p>我们会提供精修后的.jpg格式底片，不提供原始拍摄文件。</p>
                <p>除登记照外，暂时仅支持单人预约，如需多人请分别预约</p>
            </div>
            <div class="start">
                <div class="confirm-btn">
                    <label class="well-check">
                        <input class="ckecks" type="checkbox" value=""><i class="icon"></i>
                        我已仔细阅读上述说明
                    </label>
                </div>
                <div class="start-res"><a class="disabled" href="javascript:void(0);">开始预约</a></div>
            </div>
        </div>
    </section>
</div>
<script>
    requirejs(['helper'],function($h){
        var a = $('.start-res a');
        $('.ckecks').on('change',function(){
            var type = ($(this).prop('checked'));
            type == true ? a.removeClass('disabled') : a.addClass('disabled');
        });
        a.on('click',function(){
            if($(this).is('.disabled')) return false;
            $h.setCookie('_mer_check_auth',1,12);
            location.href = $h.U({
                'c':'merchant',
                'a':'apply'
            });
        });
    });
</script>
{/block}