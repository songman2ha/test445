$(function(){				
	/**
	 @ window 창 높이값을 컨텐츠에 적용 ( 높이값 - nHeader 높이값 )
	**/
	winHeight();	
	$(window).resize(function(){winHeight();});
	/**
	 @ 사이드 메뉴 스크롤
	**/	
	$(window).resize(function(){				
		$("#nSnb").height( $("body").outerHeight() - 46 );	
	});
	$("#nSnb").height( $("body").outerHeight() - 46 );
//	$("#nSnb").mCustomScrollbar({
//		autoHideScrollbar:true,
//		autoDraggerLength:true,
//		advanced:{
//        	updateOnBrowserResize: true,
//    		updateOnContentResize: true
//    	}
//	});
	/**
	 @ SNB 메뉴 접기/열기
	**/	
	$(".contentAction").click(function(){				
		if (!$(this).hasClass("on"))
		{
			$("#nSnb").hide().css("width",0);
			$("#nContent").animate({"margin-left":"0"},"fast");
			$(this).addClass("on");
		} 
		else
		{
			$("#nContent").animate({"margin-left":"180px"},"fast",function(){
				$("#nSnb").show().css("width",'180px');
			});					
			$(this).removeClass("on");
		}		
	});
	/**
	 @ 사이드 메뉴 컨트롤
	**/	
	var autoTimer;	
	var sNum = $('#sMenu>li.on').index(); /* 사이드 메뉴 기본값 셋팅 */
	$("#sMenu > li > a").bind("click" , function(){				
		$("#sMenu > li").stop(true, true).removeClass("on");
		$("#sMenu > li > ul").stop(true, true).hide();
		$(this).parent().addClass("on");
		$(this).next("ul").show();
	});
	$("#sMenu li").mouseover(function(){		
		if($(this).hasClass("on")){						
		}else{
			$(this).addClass("over");
		}		
	}).mouseout(function(){
		$(this).removeClass("over");
	});		
	function sMenuActive(){
		$("#sMenu > li").stop(true, true).removeClass("on");
		$("#sMenu > li > ul").stop(true, true).hide();
		$("#sMenu > li").eq(sNum).addClass("on");
		$("#sMenu > li").eq(sNum).find("ul").show();
	}
	$("#sMenu > li > ul > li").on("click",function(){
		$("#sMenu > li > ul > li").removeClass("on");		
		$(this).addClass("on");
		if($(this).children("a").text()=="주문상태"){						
			$(this).removeClass("on");						
		}
		if($("#sMenu > li > ul > li").hasClass("on")){
			$(".order_state > li").removeClass("on")
		}
	});
//	$( ".datepicker" ).datepicker();
	
	// @DATE: 2017-06-15
	// @WRITER : yejin.choi
	// @COMMENT : lnb 트리액션
	
	$('.lnb_sbj a').on('click',function(){

		if ($('img',this).attr('src') == '/images/admin/ico_close_lnb.png') {
			$('img',this).attr('src','/images/admin/ico_open_lnb.png');
        } else {
            $('img',this).attr('src','/images/admin/ico_close_lnb.png');   
        }
	})

	$('.lnb_sbj > a').click(function(){
		$('+.sub_lnbmenu',this).slideToggle();
	})

	$('.sub_lnbmenu li > a').click(function(){
		$('+.sl_inmenu',this).slideToggle();
	})
	
	
	$('.tabWrap01 .tabNav li').each(function(index){
		$(this).attr('data-i',index+1);
	})
	$('.tabWrap01 .tabNav li').click(function(){
		var i = parseInt($(this).attr('data-i'));
		$('.tabWrap01 .tabNav li').removeClass('current');
		$(this).addClass('current');
		$('.tabWrap01 .tabCnWrap .tabCn').addClass('dis_none');
		$('.tabWrap01 .tabCnWrap .tabCn'+i).removeClass('dis_none');
	})
	
});

function winHeight(){
	if ($(window).height() > 600)
	{		
		$("#nContent").css("min-height" , $(window).height()-66);		
	}		
}