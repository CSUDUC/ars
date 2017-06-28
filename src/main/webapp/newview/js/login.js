/**
 * 
 */
var productType_ch2en={
		"土壤墒情监测":"TRSQ",//土壤墒情监测
		"农作物分类与面积统计":"NZWJXFL",//农作物分类与面积统计
		"叶面积指数监测":"YMJZSJC",//叶面积指数监测
		"农业病虫害监测":"NYBCHJC",//农业病虫害监测
		"农作物长势监测":"NZWZSJC",//农作物长势监测
		"农作物估产":"NZWGC",//农作物估产
		"土壤肥力监测":"TRFL"//土壤肥力监测
};
$(function (){
		$(".jcDate").jcDate({					       
				IcoClass : "jcDateIco",
				Event : "click",
				Speed : 100,
				Left : 0,
				Top : 28,
				format : "-",
				Timeout : 100
		});
		//注册账号按钮
		$('.register_mark').click(function(e) {
            $('.registercons').show();
			$('.logincons').hide();
			$('.forgetpasswordcons').hide();
			
			
			
        });
		//选择服务按钮
		$('.register_btn').click(function(e) {
			var register_username=$("#register_username").val();
			var register_pwd=$("#register_pwd").val();
			var register_pwd_confirm=$("#register_pwd_confirm").val();
			if((register_pwd==register_pwd_confirm)&&register_pwd&&register_pwd_confirm)
			{
				if(register_username)
				{
					$('.registercons').hide();
					$('.servicecons').show();
					$('.forgetpasswordcons').hide();
				}
				else{
					$('.alert-danger').show();
					$('.alert-danger').delay(3000).hide(0);
				}
				
			}
			else
			{
				$('.alert-danger').show();
				$('.alert-danger').delay(3000).hide(0);
			}
			
        });
		$('.forget_password').click(function(e) {
            $('.registercons').hide();
			$('.servicecons').hide();
			$('.logincons').hide();
			$('.forgetpasswordcons').show();
        });
		$('.login_btn').mouseover(function(e) {
            $(this).css('background','url(newview/images/login_btn_bg_hover.png)');
        });
		$('.login_btn').mouseout(function(e) {
            $(this).css('background','url(newview/images/login_btn_bg.png)');
        });
		
		$('.login_btn').click(function(e) {
            $(this).css('background','url(newview/images/login_btn_bg_click.png)');
            
        });
		//立即登陆按钮
		$('#registerAndin').click(function(e) {
            getRegisterInfoAndlogin();
        });
		$('.download a').mouseover(function(e) {
            $(this).css('background','#086f99');
        });
		$('.download a').mouseout(function(e) {
            $(this).css('background','#0589be');
        });
		$('.register_btn').mouseover(function(e) {
            $(this).css('background','url(newview/images/register_btn_bg_hover.png)');
        });
		$('.register_btn').mouseout(function(e) {
            $(this).css('background','url(newview/images/register_btn_bg.png)');
        });
		$('.register_btn').click(function(e) {
            $(this).css('background','url(newview/images/register_btn_bg_click.png)');
        });
		$('.login_marks span').mouseover(function(e) {
            $(this).css('color','#fff');
        });
		$('.login_marks span').mouseout(function(e) {
            $(this).css('color','#00b4ff');
        });
	});
//获取注册时，注册信息
function getRegisterInfoAndlogin()
{
	 var register_username=$("#register_username").val();//用户名
	 var register_pwd=$("#register_pwd").val();//密码
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
     
   //注册信息，后台更新数据库
    	$.ajax({  
             type:"POST",  
             url:"doRegister",  
             dataType:"json",  
             async: false,  
             data:{username:register_username,pwd:register_pwd,
            	 producttypeStr:producttypeStr,
            	 servicebegintime:service_begin_time,
            	 serviceendtime:service_end_time},  
             success:function(data){  
             	//alert(data["username"]);
            	 	//console.log(data);
             	var registerAndlogin = document.getElementById("registerAndlogin");
        			
             	registerAndlogin.action = "index";
             	registerAndlogin.submit();
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