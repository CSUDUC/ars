// JavaScript Document
$(function(){
		//<!--首页左侧俩按钮点击效果-->
		$('..BbWebBtns ul li .block').click(function(e) {
//			$('.BbDrawBlock').show();
//			$('.BbRegionSelect').hide();
//			$('.BbWebBlockCheck').hide();
//			$('.BbBlockSavingWrap').hide(); 
        });
		$('.block_btns ul li .save').click(function(e) {
           //$('.BbBlockSavingWrap').show(); 
		   //$('.BbDrawBlock').hide();
           //$('.block_btns').hide();
        });
//		$('.BbWebBtns ul li .region').click(function(e) {
//            $('.BbRegionSelect').show();
//			//$('.BbDrawBlock').hide();
//			$('.BbWebBlockCheck').hide();
//			$('.BbBlockSavingWrap').hide(); 
//        });
		$('.BbWebBtns ul li').mouseover(function(e) {
            $(this).css('background-image','url(newview/images/index_webbtn_hover_bg.png)');
        });
		$('.BbWebBtns ul li').mouseout(function(e) {
            $(this).css('background-image','url(newview/images/index_webbtn_default_bg.png)');
        });
		$('.BbWebBtns ul li').click(function(e) {
            $(this).css('background-image','url(newview/images/index_webbtn_pressed_bg.png)');
        });
		
		var node_w=$('.BbWebBlockTime').width();
		//alert(node_w);
		$('.block_lists').css('width',node_w-117);
		$('.prev').hover(function(e) {
            $(this).toggleClass('on');
        });
		$('.next').hover(function(e) {
            $(this).toggleClass('on');
        });
		
		$('.block_list_ul li').hover(function(e) {
            $(this).toggleClass('current');
        });
		
		
		$('.block_btns ul li').mouseover(function(e) {
            $(this).addClass('states_hover');
        });
		$('.block_btns ul li').mouseleave(function(e) {
            $(this).removeClass('states_hover');
			$(this).removeClass('states_click');
        });
		$('.block_btns ul li').click(function(e) {
            $(this).addClass('states_click').siblings().removeClass('states_click');
        });
//		$('.block_btns ul li .delete').click(function(e) {
//            $('.BbDrawBlock').hide();
//        });
		/////保存框
		$('.BbBlockSaving .close').click(function(e) {
            $('.BbBlockSavingWrap').hide(); 
        });
		$('.block_saving_btns .sure').click(function(e) {
            $('.BbAlertshadow').show();
			$('.BbBlockSavingWrap').hide(); 
        });
		$('.block_saving_btns .sure').mouseover(function(e) {
            $(this).css('background','#1189aa');
        });
		$('.block_saving_btns .sure').mouseout(function(e) {
            $(this).css('background','#24add2');
        });
		$('.block_saving_btns .cancel').click(function(e) {
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
		/////////
		$('.alert_text .cancel').click(function(e) {
            $('.BbAlertshadow').hide();
        });
		$('.alert_text .cancel').mouseover(function(e) {
            $(this).css('background','#24add2');
			$(this).css('color','#fff');
        });
		$('.alert_text .cancel').mouseout(function(e) {
            $(this).css('background','#fff');
			$(this).css('color','#24add2');
        });
		$('.crop_lists span').click(function(e) {
			if($(this).hasClass("on"))
			{
				
				$(this).removeClass('on');
			}
			else{
				$(this).addClass('on');
			}
            
        });
		
		$('.block_img').hover(function(e) {
            $('.block_states_hover').toggle();
			//$(this).addClass('states_hover01');
        });
//		$('.block_img').click(function(e) {
//            $('.BbBlockRightWrap').show();
//			$('.BbWebBlockTime').show();
//			$(this).addClass('states_hover01');
//        });
//		$('.Block_function li').click(function(e) {
//            $(this).addClass('checked').siblings().removeClass('checked');
//        });
		$('.BbBlockTab span').click(function(e) {
            $(this).addClass('choosed').siblings().removeClass('choosed');
        });
		$('.block_mini').click(function(e) {
            $('.BbWebBlockWrap').show();
			//$('.BbWebBlockCheck').show();
			$(this).hide();
        });
})