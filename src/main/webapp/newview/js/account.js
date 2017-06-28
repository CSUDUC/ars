/**
 * 
 */
var productType_en2ch={
		"TRSQ":"土壤墒情监测",//土壤墒情
		"NZWJXFL":"农作物分类与面积统计",//农作物精细分类与面积统计
		"YMJZSJC":"叶面积指数监测",//叶面积指数监测
		"NYBCHJC":"农业病虫害监测",//农业病虫害监测
		"NZWZSJC":"农作物长势监测",//农作物长势监测
		"NZWGC":"农作物估产",//农作物估产
		"TRFL":"土壤肥力监测"//土壤肥力
};
var productType_ch2en={
		"土壤墒情监测":"TRSQ",//土壤墒情监测
		"农作物分类与面积统计":"NZWJXFL",//农作物分类与面积统计
		"叶面积指数监测":"YMJZSJC",//叶面积指数监测
		"农业病虫害监测":"NYBCHJC",//农业病虫害监测
		"农作物长势监测":"NZWZSJC",//农作物长势监测
		"农作物估产":"NZWGC",//农作物估产
		"土壤肥力监测":"TRFL"//土壤肥力监测
};
$(function(){
	$(".jcDate").jcDate({					       
			IcoClass : "jcDateIco",
			Event : "click",
			Speed : 100,
			Left : 0,
			Top : 28,
			format : "-",
			Timeout : 100
	});
	$('.BbWebMenu ul li').click(function(e) {
        $(this).addClass('current').siblings().removeClass('current');
    });
	$('.webinfo_img').click(function(e) {
		$('.user_mark').toggle();
		
    });
	$('.user_mark a').click(function(e) {
        $('.user_mark').hide();
    });
	//修改账号信息
	$('.account_title .modify.account').click(function(e) {
        $('.BbAlertshadow').show();
		$('.BbAccountModify').show();
		$('.BbServiceModify').hide();
		$('.BbPasswordModify').hide();
		$('.BbPicModify').hide();
    });
	$('.account_title .modify.account').mouseover(function(e) {
        $(this).css('color','#00abf8');
    });
	$('.account_title .modify.account').mouseout(function(e) {
        $(this).css('color','#999');
    });
	//修改头像
	$('.BbAccountPic .account_text').mouseover(function(e) {
        $(this).css('background','#1189aa');
    });
	$('.BbAccountPic .account_text').mouseout(function(e) {
        $(this).css('background','#24add2');
    });
	$('.BbAccountPic .account_text').click(function(e) {
        $('.BbPicModify').show();
		$('.BbAlertshadow').show();
		$('.BbAccountModify').hide();
		$('.BbServiceModify').hide();
		$('.BbPasswordModify').hide();
    });
	$('.BbPicModify .block_saving_btns .cancel').click(function(e) {
        $('.BbAlertshadow').hide();
		$('.BbAccountModify').hide();
    });
	$('.BbPicModify .block_saving_btns .cancel').mouseover(function(e) {
        $(this).css('background','#24add2');
		$(this).css('color','#fff');
    });
	$('.BbPicModify .block_saving_btns .cancel').mouseout(function(e) {
        $(this).css('background','#fff');
		$(this).css('color','#24add2');
    });
//	$('.BbPicModify .block_saving_btns .sure').click(function(e) {
//        $('.BbAccountModify').hide();
//		$('.BbAlertshadow').hide();
//    });
//	$('.BbPicModify .block_saving_btns .sure').mouseover(function(e) {
//        $(this).css('background','#1189aa');
//    });
//	$('.BbPicModify .block_saving_btns .sure').mouseout(function(e) {
//        $(this).css('background','#24add2');
//	});
	//上传按钮
	$('.accountPicUpload_submit').click(function(e) {
        $('.BbAccountModify').hide();
		$('.BbAlertshadow').hide();
		accountPicUpload();
    });
	$('.accountPicUpload_submit').mouseover(function(e) {
        $(this).css('background','#1189aa');
    });
	$('.accountPicUpload_submit').mouseout(function(e) {
        $(this).css('background','#24add2');
	});
	
	$('.BbPicModify .BbBlockSaving .close').click(function(e) {
        $('.BbAlertshadow').hide();
		$('.BbPicModify').hide();
    });
	
	$('.BbAccountModify .block_saving_btns .cancel').click(function(e) {
        $('.BbAlertshadow').hide();
		$('.BbAccountModify').hide();
    });
	$('.BbAccountModify .block_saving_btns .cancel').mouseover(function(e) {
        $(this).css('background','#24add2');
		$(this).css('color','#fff');
    });
	$('.BbAccountModify .block_saving_btns .cancel').mouseout(function(e) {
        $(this).css('background','#fff');
		$(this).css('color','#24add2');
    });
	$('.BbAccountModify .block_saving_btns .sure').click(function(e) {
        $('.BbAccountModify').hide();
		$('.BbAlertshadow').hide();
    });
	$('.BbAccountModify .block_saving_btns .sure').mouseover(function(e) {
        $(this).css('background','#1189aa');
    });
	$('.BbAccountModify .block_saving_btns .sure').mouseout(function(e) {
        $(this).css('background','#24add2');
	});
	$('.BbAccountModify .BbBlockSaving .close').click(function(e) {
        $('.BbAlertshadow').hide();
		$('.BbAccountModify').hide();
    });
	//修改密码
	$('.detailsinfo button').click(function(e) {
        $('.BbAlertshadow').show();
		$('.BbPasswordModify').show();
		$('.BbAccountModify').hide();
		$('.BbServiceModify').hide();
		$('.BbPicModify').hide();
    });
	$('.detailsinfo button').mouseover(function(e) {
        $(this).css('background','#289f62');
    });
	$('.detailsinfo button').mouseout(function(e) {
        $(this).css('background','#51bb85');
    });
	$('.BbPasswordModify .block_saving_btns .cancel').click(function(e) {
        $('.BbAlertshadow').hide();
		$('.BbPasswordModify').hide();
    });
	$('.BbPasswordModify .block_saving_btns .cancel').mouseover(function(e) {
        $(this).css('background','#24add2');
		$(this).css('color','#fff');
    });
	$('.BbPasswordModify .block_saving_btns .cancel').mouseout(function(e) {
        $(this).css('background','#fff');
		$(this).css('color','#24add2');
    });
	//修改密码-确认
	$('.BbPasswordModify .block_saving_btns .sure').click(function(e) {
//        $('.BbPasswordModify').hide();
//		$('.BbAlertshadow').hide();
		modifyPwd();
    });
	$('.BbPasswordModify .block_saving_btns .sure').mouseover(function(e) {
        $(this).css('background','#1189aa');
    });
	$('.BbPasswordModify .block_saving_btns .sure').mouseout(function(e) {
        $(this).css('background','#24add2');
    });
	$('.BbPasswordModify .BbBlockSaving .close').click(function(e) {
        $('.BbAlertshadow').hide();
		$('.BbPasswordModify').hide();
    });
	//修改服务信息
	$('.account_title .modify.service').click(function(e) {
        $('.BbAlertshadow').show();
		$('.BbServiceModify').show();
		$('.BbPasswordModify').hide();
		$('.BbAccountModify').hide();
		$('.BbPicModify').hide();
    });
	$('.account_title .modify.service').mouseover(function(e) {
        $(this).css('color','#00abf8');
    });
	$('.account_title .modify.service').mouseout(function(e) {
        $(this).css('color','#999');
    });
	$('.BbServiceModify .block_saving_btns .cancel').click(function(e) {
        $('.BbAlertshadow').hide();
		$('.BbServiceModify').hide();
    });
	$('.BbServiceModify .block_saving_btns .cancel').mouseover(function(e) {
        $(this).css('background','#24add2');
		$(this).css('color','#fff');
    });
	$('.BbServiceModify .block_saving_btns .cancel').mouseout(function(e) {
        $(this).css('background','#fff');
		$(this).css('color','#24add2');
    });
	$('.BbServiceModify .block_saving_btns .sure').click(function(e) {
		//alert("ok");
        $('.BbServiceModify').hide();
		$('.BbAlertshadow').hide(); 
		modifyService();
    });
	$('.BbServiceModify .block_saving_btns .sure').mouseover(function(e) {
        $(this).css('background','#1189aa');
    });
	$('.BbServiceModify .block_saving_btns .sure').mouseout(function(e) {
        $(this).css('background','#24add2');
    });
	$('.BbServiceModify .BbBlockSaving .close').click(function(e) {
        $('.BbAlertshadow').hide();
		$('.BbServiceModify').hide();
    });
	$('.piclists ul li').hover(function(e) {
        $(this).toggleClass('on');
    });
	$('.piclists ul li').click(function(e) {
        $(this).addClass('clicked').siblings().removeClass('clicked');
    });
	
	initAccountPage();//初始化页面
})
function initAccountPage()
{
	$.ajax({  
        type:"POST",  
        url:"doinitaccount",  
        dataType:"json",  
        async: false,  
        //data:{codeid:codeid},  
        success:function(data){
        		UpdateAccountPage(data);
        },  
        error:function(){  
                alert("方法执行不成功!");  
        }    
	});  
}
function UpdateAccountPage(data)
{
	//清除先前记录
	var series_ul=document.getElementsByClassName("services_ul_li");
	$(series_ul).parent().removeClass("choosed");
	//标记服务类型
	var producttypes=data["producttype"].split("/");
	
	for(var i=0;i<producttypes.length-1;i++)
	{
		var producttypes_ch=productType_en2ch[producttypes[i]];
		var t=series_ul.length;
		for(var j=0;j<t;j++)
		{
			//$(series_ul[j]).parent().removeClass("choosed");
			if(series_ul[j].innerText==producttypes_ch)
			{
				$(series_ul[j]).parent().addClass("choosed");
			}
		}
	}
//标记服务时间
	document.getElementById("serviceBeginTime").innerText=data["servstarttime"];
	//console.log(document.getElementById("serviceBeginTime").innerText);
	document.getElementById("serviceEndTime").innerText=data["servendtime"];
}
function modifyService()
{
	//选择的服务
	 var producttypeStr="";
	 var productTypes=document.getElementsByName("productTypes"); 
    for(var i=0;i<productTypes.length;i++){
         if(productTypes[i].checked){
       	  var productType_en=productType_ch2en[productTypes[i].value];
       	  producttypeStr+=(productType_en+"/");
         
       }
    }
    
    //服务的起始时间-结束时间
    var service_begin_time=$("#service_begin_time").val();//起始时间
    service_begin_time=formatTime(service_begin_time);
    var service_end_time=$("#service_end_time").val();//结束时间
    service_end_time=formatTime(service_end_time);
  //修改服务信息，后台更新数据库
	$.ajax({  
         type:"POST",  
         url:"doModifyServiceInfo",  
         dataType:"json",  
         async: false,  
         data:{producttypeStr:producttypeStr,
        	 servicebegintime:service_begin_time,
        	 serviceendtime:service_end_time},  
         success:function(data){  
        	 	UpdateAccountPage(data);
         },  
         error:function(){  
              alert("方法执行不成功!");  
         }    
  });
}
function formatTime(time)
{
	var times=time.split("-");
	//console.log(times[1]);
	if(times[1]<10)
		{
			times[1]="0"+times[1];			
		}
	if(times[2]<10)
	{
		times[2]="0"+times[2];
	}
	return times[0]+"-"+times[1]+"-"+times[2];
}
function accountPicUpload()
{
	var formData = new FormData($( "#accountPicUpload" )[0]);  
    $.ajax({  
         url: 'accountPicUpload' ,  
         type: 'POST',  
         data: formData,  
         async: true,  
         cache: false,  
         contentType: false,  
         processData: false,  
         success: function (urlphoto) {  
        	 	//account_pic_img
        	 	//user_img
        	 	//console.log(urlphoto);
        	 //alert("ok");
	        	 var account_pic_img = document.getElementById('account_pic_img');
	        	 account_pic_img.src = urlphoto;
	        	 
	        	 var user_img = document.getElementById('user_img');
	        	 user_img.src = urlphoto;
         },  
         error: function (returndata) {  
             alert(returndata);  
         }  
    });  
}
function modifyPwd()
{
	var PasswordModify_oldpwd=$("#PasswordModify_oldpwd").val();
	var PasswordModify_newpwd=$("#PasswordModify_newpwd").val();
	var PasswordModify_newpwd_confirm=$("#PasswordModify_newpwd_confirm").val();
	if(PasswordModify_newpwd!=PasswordModify_newpwd_confirm)//新密码两次输入不一致
	{
		$('.alert-danger').show();
		$('.alert-danger').delay(3000).hide(0);
	}
	else{
		//修改服务信息，后台更新数据库
		$.ajax({  
	         type:"POST",  
	         url:"doModifyPwd",  
	         dataType:"json",  
	         async: false,  
	         data:{oldpwd:PasswordModify_oldpwd,
	        	 newpwd:PasswordModify_newpwd},  
	         success:function(data){  
	        	 	//UpdateAccountPage(data);
	        	 	if(data==1)
	        	 	{
	        	 	   $('.BbPasswordModify').hide();
	        	 	   $('.BbAlertshadow').hide();
	        	 	}
	        	 	else{
	        	 		$('.alert-danger').show();
	        			$('.alert-danger').delay(3000).hide(0);
	        	 	}
	         },  
	         error:function(){  
	              alert("方法执行不成功!");  
	         }    
	  });
	}
	
}