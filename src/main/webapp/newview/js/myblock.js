/**
 * 
 */
/*
$(document).ready(function(){//初始化页面
	$('.block_series_ul li').remove();
	
	$.ajax({  
	    type:"POST",  
	    url:"doinitmyblock",  
	    dataType:"json",  
	    async: false,  
	    success:function(data){
	    		//fieldsArray = data;
	    		for(var i = 0;i<data.length;i++)
	    			{
	    			var order = data[i];
	    			var block_series_li="<li class='block_series_li'>"+
	    			"<div class='block_info' id='"+order["codeid"]+"'"+
	    			"style='background:url("+order["sdpath"]+") no-repeat;'>"+
	    					"<div class='block_operation'>"+
		    			    		"<span class='text'>"+order["ordername"]+"</span>"+
		    			        "<span class='delete operation_btn' onclick='operation_btn_delete("+order["codeid"]+");'></span>"+
		    			        "<span class='edit operation_btn' onclick='operation_btn_edit("+order["codeid"]+");'></span>"+
		    			        "<form id='tolocationform' method=post>"+
		    			        "<span class='location operation_btn' onclick='operation_btn_location("+order["codeid"]+");'></span>"+
		    			        "</form>"+
	    			    		"</div>"+
	    			    "<div class='block_details'>"+
	    			    		"<div class='details_text'>"+
	    			        		"<p>面积：2800亩</p>"+
	    			            "<p>主要作物："+order["cropkinds"]+"</p>"+
	    			            "<p>土壤墒情：良好</p>"+
	    			            "<p>病虫害威胁：良</p>"+
	    			            "<p>预计产值：56546KG</p>"+
	    			        "</div>"+
	    			    	"</div>"+
	    			"</div>"+
	    			"</li>";
	    				$(".block_series_ul").append(block_series_li);
	    			}
	    		
	    },  
	    error:function(){  
	         alert("方法执行不成功!");  
	    }    
	});
	
	$('.block_info').hover(function(e) {
        $(this).children('.block_details').toggle();
    });
	$('.block_operation .operation_btn').hover(function(e) {
        $(this).toggleClass('on');
    });
});
*/
$('.BbWebMenu ul li').click(function(e) {
    $(this).addClass('current').siblings().removeClass('current');
});
$('.webinfo_img').click(function(e) {
	$('.user_mark').toggle();
});
$('.user_mark a').click(function(e) {
    $('.user_mark').hide();
});
$('.crop_lists span').click(function(e) {
    //$(this).addClass('on');
    if($(this).hasClass("on"))
	{
		
		$(this).removeClass('on');
	}
	else{
		$(this).addClass('on');
	}
});
$('.block_search button').mouseover(function(e) {
    $(this).css('background','url(newview/images/block_search_btn_pressed.png)');
});
$('.block_search button').mouseout(function(e) {
    $(this).css('background','url(newview/images/block_search_btn.png)');
});
//搜索地块
$('.block_search button').click(function(e) {
//    var blockName = document.getElementById("block_search_name").value; 
//	blockSearch(blockName);
});
$("#block_search_name").bind("input propertychange",function(){
	blockSearch($(this).val());//实时搜索
});

$('.block_operation .operation_btn').click(function(e) {
    $(this).addClass('on').siblings('.operation_btn').removeClass('on');
});
//		$('.block_operation .operation_btn').hover(function(e) {
//            $(this).toggleClass('on');
//        });
//		$('.block_info').hover(function(e) {
//            $(this).children('.block_details').toggle();
//        });
//		$('.block_operation .location').click(function(e) {
//            window.location.href="index.html?flag=open";
//        });
//		$('.block_operation .delete').click(function(e) {
//            $('.BbAlertshadow').show();
//			$(this).parent().parent().siblings('.BbSavingok').show();
//			$('.BbSavingok.success').hide();
//			$('.BbSavingok.block_edit').hide();
//        });
//编辑地块、删除地块 取消按钮
$('.block_saving_btns .cancel').click(function(e) {
    $('.BbAlertshadow').hide();
	$('.BbSavingok').hide();
	$('.BbBlockSavingWrap').hide();
});
$('.block_saving_btns .cancel').mouseover(function(e) {
    $(this).css('background','#24add2');
	$(this).css('color','#fff');
});
$('.block_saving_btns .cancel').mouseout(function(e) {
    $(this).css('background','#fff');
	$(this).css('color','#24add2');
});
//删除地块确认按钮
$('.BbSavingok .block_saving_btns .sure').click(function(e) {
	//alert(activeid);
	$('.BbSavingok').hide();
	$('.BbSavingok.success').show();
	$('.BbAlertshadow').delay(3000).hide(0);
	$('.BbSavingok.success').delay(3000).hide(0);
	//$('.block_series_li').delay(3000).hide(0);
	
	//提交删除，后台更新数据库
   	$.ajax({  
            type:"POST",  
            url:"doDeleteBlock",  
            dataType:"json",  
            async: false,  
            data:{codeid:activeid},  
            success:function(data){  
            		//alert(data);
            	 var li_index=del_li(activeid);//首先删除原有的
            },  
            error:function(){  
                 alert("方法执行不成功!");  
            }    
     });
   	
});
$('.BbSavingok .block_saving_btns .sure').mouseover(function(e) {
    $(this).css('background','#1189aa');
});
$('.BbSavingok .block_saving_btns .sure').mouseout(function(e) {
    $(this).css('background','#24add2');
});
//		//地块编辑按钮
//		$('.block_operation .edit').click(function(e) {
//			$('.BbAlertshadow').show();
//			$('.BbBlockSavingWrap').show();
//			var activeid = $(this).parent().parent('.block_info').attr("id");
//			alert(activeid);
//        });
//编辑地块确认按钮
$('.BbBlockSaving .block_saving_btns .sure').click(function(e) {
    
	//alert(activeid);
   	//alert(JSON.stringify(m_cropKindsVal));
    $('.BbBlockSavingWrap').hide();
		$('.BbAlertshadow').delay(3000).hide(0);
	//地块名称
	var m_drawareaName = $('#DrawAreaName').val();
	//作物种类
   	var m_cropKinds = $('.crop_lists span');
   	var m_cropKindsVal = [];
   	for(var i=0;i<3;i++)
   		{
           	if(m_cropKinds[i].className=="on")
   	        	{
           		m_cropKindsVal.push(m_cropKinds[i].innerText);
   	        	}
   		}
  //alert(m_drawareaName);
   	//提交编辑信息，后台更新数据库
   	$.ajax({  
            type:"POST",  
            url:"doUpdateBlock",  
            dataType:"json",  
            async: false,  
            data:{codeid:activeid,drawareaName:m_drawareaName,cropKinds:JSON.stringify(m_cropKindsVal)},  
            success:function(data){  
            		//alert(data);
            		var li_index=del_li(activeid);//首先删除原有的
            		//alert(li_index);
            		add_li(li_index,data);//再添加update之后的
            		
                	$('.BbSavingok.block_edit').show();
        			$('.BbSavingok.block_edit').delay(3000).hide(0);
            },  
            error:function(){  
                 alert("方法执行不成功!");  
            }    
     });
});
$('.BbBlockSaving .block_saving_btns .sure').mouseover(function(e) {
    $(this).css('background','#1189aa');
});
$('.BbBlockSaving .block_saving_btns .sure').mouseout(function(e) {
    $(this).css('background','#24add2');
});
//编辑地块右上角关闭按钮
$('.BbBlockSavingWrap .BbBlockSaving .close').click(function(e) {
    $('.BbAlertshadow').hide();
	$('.BbBlockSavingWrap').hide();
});

function del_li(n)
 {
	
  var block_series_ul=document.getElementById("block_series_ul_id")
  var t=block_series_ul.childNodes.length;
  //alert(t);
  for (var i=t-1;i>0;i--)
  {
	   var li_id = $(block_series_ul.childNodes[i]).children('.block_info').attr("id");
	  
	   if (li_id==n)
	   {
		   block_series_ul.removeChild(block_series_ul.childNodes[i]);
		   return i;
	   }
  }
 }
function add_li(index,data)
 {
	
	 var block_series_ul=document.getElementById("block_series_ul_id")
	 var t=block_series_ul.childNodes.length;
	 
	 var block_series_li="<li class='block_series_li'>"+
	"<div class='block_info' id='"+data["codeid"]+"'"+
	"style='background:url("+data["sdpath"]+") no-repeat;'>"+
			"<div class='block_operation'>"+
			    		"<span class='text'>"+data["ordername"]+"</span>"+
			        "<span class='delete operation_btn' onclick='operation_btn_delete("+data["codeid"]+");'></span>"+
			        "<span class='edit operation_btn' onclick='operation_btn_edit("+data["codeid"]+");'></span>"+
			        "<form id='tolocationform' method=post>"+
			        "<span class='location operation_btn' onclick='operation_btn_location("+data["codeid"]+");'></span>"+
			        "</form>"+
	    		"</div>"+
	    "<div class='block_details'>"+
	    		"<div class='details_text'>"+
	        		"<p>面积：2800亩</p>"+
	            "<p>主要作物："+data["cropkinds"]+"</p>"+
	            "<p>土壤墒情：良好</p>"+
	            "<p>病虫害威胁：良</p>"+
	            "<p>预计产值：56546KG</p>"+
	        "</div>"+
	    	"</div>"+
	"</div>"+
	"</li>";
	 
	 
	 var li= document.createElement("li");
	 li.innerHTML=block_series_li;
	 
	 block_series_ul.insertBefore(li,block_series_ul.childNodes[index]);
	 
	 $('.block_info').hover(function(e) {
	        $(this).children('.block_details').toggle();
    });
	$('.block_operation .operation_btn').hover(function(e) {
        $(this).toggleClass('on');
    });
//			 if(index==(t-1))
//			 {
//				 block_series_ul.appendChild(li);
//			 }
//			 else{
//				 block_series_ul.insertBefore(li,block_series_ul.childNodes[index]);
//			 }
	
 }
function operation_btn_location(param)
{
	var tolocation = document.getElementById("tolocationform");
	
	tolocation.action = "index?codeid="+param;
	tolocation.submit();
}
function operation_btn_delete(param)
{
	$('.BbAlertshadow').show();
	$('.BbSavingok').show();
	$('.BbSavingok.success').hide();
	$('.BbSavingok.block_edit').hide();
	
	activeid = param;
}
function operation_btn_edit(param)
{
	$('.BbAlertshadow').show();
	$('.BbBlockSavingWrap').show();
	
	activeid = param;
}
function blockSearch(blockName)
{
	var block_series_ul=document.getElementsByClassName("blockName");
	var t=block_series_ul.length;
	
	for(var j=0;j<t;j++)
	{
		if(block_series_ul[j].innerText!=blockName)
		{
			$(block_series_ul[j]).parent().parent().parent().hide();
		}
		if(block_series_ul[j].innerText==blockName)
		{
			$(block_series_ul[j]).parent().parent().parent().show();
		}
		if(blockName.length==0)
		{
			$(block_series_ul[j]).parent().parent().parent().show();
		}
	}
}