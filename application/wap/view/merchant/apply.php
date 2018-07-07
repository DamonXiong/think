{extend name="public/container"}
{block name="title"}招商加盟{/block}
{block name="head_top"}
<link rel="stylesheet" type="text/css" href="{__WAP_PATH}crmeb/font/iconfont.css" />
{/block}
{block name="content"}
<body style="background:#f5f5f5;">
 <div class="ruzhu-banner"><img src="{__WAP_PATH}crmeb/images/ruzhu_banner.jpg"></div>
<div id="dealer" class="dealer-settled submit-info-next">
        <section style="padding-bottom: .3rem;">
            <div class="deealer-info ">
                <input class="address" readonly type="text" @click="selectAddress" v-model="address" placeholder="请选择入驻地址"/>
                <input type="text" v-model="form.address" placeholder="请填写详细地址"/>
                <input type="text" v-model="form.company_name" placeholder="请填写商户名称"/>
                <input type="text" v-model="form.link_user" placeholder="请填写联系人"/>
                <input type="tel" v-model="form.link_tel" placeholder="请填写联系电话"/>
            </div>
            <div class="add-infos">
                <div class="item add-images flex" @click="updatePic">
                    <span></span>
                    <p>点击上传公司资质</p>
                </div>
                <div class="item flex" v-for="(pic,index) in form.charter">
                    <img :src="pic"/>
                    <span class="delete-btn" class="delete-btn" @click="removePic(index)"></span>
                </div>
            </div>
            <p style="color: #ff7271;margin: .2rem 0;line-height: 1.4;"><strong>未通过：</strong>{$enterInfo.fail_message}</p>
            <?php /*  <div class="upload-pic flex">
                  <div class="item">
                      <img src="{__WAP_PATH}crmeb/picture/test.jpg" />
                      <div class="close flex">
                          <img src="{__WAP_PATH}crmeb/images/addto-pic.png" />
                          <p>身份证背面照</p>
                      </div>
                  </div>
                  <div class="item">
                      <div class="select-pic flex">
                          <img src="{__WAP_PATH}crmeb/images/addto-pic.png" />
                          <p>身份证背面照</p>
                      </div>
                  </div>
              </div>  */ ?>
            <div class="sub-btn" @click="submit">立即申请</div>
        </section>
    <yd-cityselect :items="district()" v-model="addressShow" :callback="changeAddress"></yd-cityselect>
</div>
 <script>
     (function(){
         requirejs(['vue','reg-verify','ydui','static/plug/ydui/province_city_area','helper','store'],function(Vue,$reg,ydui,district,$h,storeApi){
            Vue.use(ydui.default);
             var wxApi = mapleWx($jssdk());
            new Vue({
                el:"#dealer",
                data:{
                    district:function(){
                        return district
                    },
                    addressShow:false,
                    form:{
                        province:'{$enterInfo.province}',
                        city:'{$enterInfo.city}',
                        district:'{$enterInfo.district}',
                        address:'{$enterInfo.address}',
                        company_name:'{$enterInfo.merchant_name}',
                        link_user:'{$enterInfo.link_user}',
                        link_tel:'{$enterInfo.link_tel}',
                        charter:<?=json_encode($enterInfo['charter'])?>||[],
                        id:'{$enterInfo.id}'
                    }
                },
                computed:{
                    address:function () {
                        return $reg.trim(this.form.province+' '+this.form.city+' '+this.form.district);
                    }
                },
                methods:{
                    selectAddress:function(){
                        this.addressShow = true;
                        document.activeElement.blur();
                    },
                    changeAddress:function(address){
                        this.form.province = address.itemName1;
                        this.form.city = address.itemName2;
                        this.form.district = address.itemName3;
                    },
                    updatePic:function(){
                        var that = this;
                        storeApi.wechatUploadImg(wxApi,6 - that.form.charter.length,function(res){
                            that.form.charter = that.form.charter.concat(res);
                        });
                    },
                    removePic:function(index){
                        this.form.charter.splice(index,1);
                    },
                    submit:function(){
                        if(!$reg.isPhone(this.form.link_tel))
                            return $h.pushMsgOnce('请输入正确的手机号!');
                        if(!this.address)
                            return $h.pushMsgOnce('请选择入驻地址!');
                        if(!this.form.address)
                            return $h.pushMsgOnce('请输入详细地址!');
                        if(!this.form.company_name)
                            return $h.pushMsgOnce('请输入商户名称!');
                        if(!this.form.link_user)
                            return $h.pushMsgOnce('请输入联系人!');
                        if(this.form.charter.length == 0)
                            return $h.pushMsgOnce('请上传公司资质!');
                        $h.loadFFF();
                        storeApi.basePost("{:url('submit')}",this.form,function(){
                            $h.pushMsg('提交申请成功!',function(){
                                location.href = $h.U({
                                    c:'index',
                                    a:'index'
                                })
                            })
                        },function(){ $h.loadClear(); return true;});
                    }
                },
                mounted:function(){
                    vm = this;
                }
            })
         });
     }());
 </script>
{/block}