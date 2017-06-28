/**
 * 
 */
var activeid="";//当前选中的地块id
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
//		$('.myTableoperation span.delete').click(function(e) {
//			alert("okkkk");
//            $('.BbAlertshadow').show();
//			$('.BbSavingok').show();
//			$('.BbSavingok.block_edit').hide();
//        });
		$('.BbSavingok .block_saving_btns .cancel').click(function(e) {
            $('.BbAlertshadow').hide();
			$('.BbSavingok').hide();
        });
		//删除确认按钮
		$('.BbSavingok .block_saving_btns .sure').click(function(e) {
            $('.BbSavingok.block_edit').show();
			$('.BbAlertshadow').delay(3000).hide(0);
			$('.BbSavingok.block_edit').delay(3000).hide(0);
			//执行删除操作
			operation_btn_delete_sure();
        });
		$('.BbQueryTable tr td .operation span').mouseover(function(e) {
            $(this).css('font-weight','bold');
        });
		$('.BbQueryTable tr td .operation span').mouseout(function(e) {
            $(this).css('font-weight','normal');
        });
		$('.query_left button').mouseover(function(e) {
            $(this).css('background','#289f62');
        });
		$('.query_left button').mouseout(function(e) {
            $(this).css('background','#51bb85');
        });
		$('.query_right span').mouseover(function(e) {
            $(this).css('color','#00abf8');
        });
		$('.query_right span').mouseout(function(e) {
            $(this).css('color','#666');
        });
		$('.query_right .download').click(function(e) {
			//批量下载
			download_seleted();
        });
		$('.query_right .delete').click(function(e) {
			$('.BbAlertshadow').show();
			$('.BbSavingok').show();
			$('.BbSavingok.block_edit').hide();
			//批量删除
			delete_seleted();
        });
		//表格自定义查询
		$.fn.dataTableExt.search.push(
			    function( settings, data, dataIndex ) {
			        var query_block_name=$("#query_block_name").val();
			        var query_block_date=$("#query_block_date").val();
			        //query_block_date=formatTime(query_block_date);
			        var block_name=data[1];
			        	var block_date=data[2];
			        
			        if(query_block_name.length==0&&query_block_date.length==0)
		        		{
			        		return true;
		        		}
			        else if((query_block_name==block_name)&&query_block_date.length==0)
			        	{
			        		return true;
			        	}
			        else if((query_block_name.length==0)&&(query_block_date.length!=0))
			        	{
			        		if(formatTime(query_block_date)==block_date)
		        			{
			        			return true;
		        			}
			        		return false;
			        	}
			        	else if((query_block_name==block_name)&&(formatTime(query_block_date)==block_date)){
			        		return true;
			        	}
			        return false;
			        	
			    }
			); 
		//初始化表格
		var myTable=$('#myTable').DataTable({
			"bAutoWidth":true,   
            "ajax":retrieveDataAjax,
            "ordering": false,
            	columns: [
                { title: "序号" },
                { title: "地块名称" },
                { title: "时间" },
                { title: "操作" }
            ],
            "language": {
                "url": "newview/plugins/datatables/Chinese.json"
            },
            "scrollX": true,
            "columnDefs": 
         	   	[ 
         	    		{
					    "targets": 0,
					    "width": "10%",
					    "searchable": false,
			            "orderable": false,
					    "data": null,
					    "render": function ( data, type, full, meta ) {
					 	  
					    		return "<input type='checkbox' name='datas_id' id="+data[3]+" value='http://10.2.3.222:8080/ars/newview/test.docx'><span class='num'>"+data[0]+"</span>";
					    }
         	    		},
	         	    {
		         	    "targets": -1,
		                "data": null,
		                "render": function ( data, type, full, meta ) {
		             	 
		                	return "<div class='myTableoperation'>"+
	                    	"<a href='http://10.2.3.222:8080/ars/newview/test.docx'><span class='downloading'>下载</span></a>"+
	                    	"<span class='delete' onclick='operation_btn_delete("+data[3]+");'>删除</span>"+
	                    "</div>";

	          	    	}
	               /*  "defaultContent": "<input id='doLocalDownload' name='doLocalDownload_btn' type='button' value='本地下载' class='btn m-r-5' />"
	                +"<input id='doNewBackup' name='doNewBackup_btn' type='button' value='重新备份' class='btn m-r-5'/>"
	                +"<input id='doDeleteSeleted' name='doDeleteSeleted_btn' type='button' value='删除' class='btn m-r-5'/>"
	                */
         	    }]
        });
		// Event listener to the two range filtering inputs to redraw on input
		// 点击查询 触发事件
		$("#doquery").click(function(event) {
			myTable.draw();
		});
	    
})
 function retrieveDataAjax(data, callback,settings)
{
	
   $.ajax({    
        type: 'POST',     
        contentType: "application/json",    
        url:"doinitDownload",     
        dataType: "json",    
        success:function(res) {    
           var returnData = {};
           returnData.data = res.data;
           callback(returnData);
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
//单个删除
function operation_btn_delete(param)
{
	activeid="";//清空之前的
    $('.BbAlertshadow').show();
	$('.BbSavingok').show();
	$('.BbSavingok.block_edit').hide();
	
	activeid=param;
}
function operation_btn_delete_sure(){
	alert(activeid);
	//提交删除，后台更新数据库
//   	$.ajax({  
//            type:"POST",  
//            url:"doDeleteBlock",  
//            dataType:"json",  
//            async: false,  
//            data:{codeid:activeid},  
//            success:function(data){  
//            		//alert(data);
//            	 var li_index=del_li(activeid);//首先删除原有的
//            },  
//            error:function(){  
//                 alert("方法执行不成功!");  
//            }    
//     });
}
function download_seleted()
{
	//var datas_idStr="";
	var datas_id=document.getElementsByName("datas_id"); 
    for(var i=0;i<datas_id.length;i++){
         if(datas_id[i].checked){
       	  
       	  //datas_idStr+=(datas_id[i].value+"/");
       	  downloadFile(datas_id[i].value);
       }
    }
	
}
/** 下载 **/
function downloadFile(url) 
{   
	try{ 
		var elemIF = document.createElement("iframe");   
		elemIF.src = url;   
		elemIF.style.display = "none";   
		document.body.appendChild(elemIF);
		//document.body.removeChild(elemIF);
	}
	catch(e){ 
	
	} 
}  
function delete_seleted()
{
	activeid="";//清空之前的
	var datas_id=document.getElementsByName("datas_id"); 
    for(var i=0;i<datas_id.length;i++){
         if(datas_id[i].checked){
       	  
        	 activeid+=(datas_id[i].id+"/");
         
       }
    }
}
