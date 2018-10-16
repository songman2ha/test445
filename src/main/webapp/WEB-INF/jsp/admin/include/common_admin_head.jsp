<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<meta charset="utf-8">
<title>PlanBit</title>
 <meta http-equiv="Content-Style-Type" content="text/css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">

<link href="/css/admin/reset.css" rel="stylesheet">
<link href="/css/admin/common.css" rel="stylesheet">
<link href="/css/admin/style.css" rel="stylesheet">
<link href="/css/admin/page.css" rel="stylesheet">
<link type="text/css" rel="stylesheet" href="/jquery/themes/blue/jquery.ui.all.css">

<!-- test -->
<script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>
<script type="text/javascript" src="/js/admin/exb_default.js"></script>
<script type="text/javascript" src="/js/jquery-ui.js"></script>
<script src="/js/admin/common.js" type="text/javascript"></script>
<script type="text/javascript" src="/js/cl.js"></script>

<script type="text/javascript" src="/js/jquery.modal.min.js"></script>

<script src='/js/jquery.easing.1.3.js'></script>
<script src='/js/jquery.hoverIntent.minified.js'></script>
<script src='/js/diapo.js'></script>	
<script type="text/javascript" src="/js/jquery.treeview.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">

	$(document).ready(function() {
		
		jQuery.fn.center = function () {
		    this.css("position","absolute");
		    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
		    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
		    return this;
		}
	});
	
	
	/* 모든  alert 경고창을 불러옴  지우지 마세여! */
	var msg = '${message}';
	
	if(msg != ''){
		alert(msg);
	}

	//돈 콤마
	function numberWithCommas(num) {
	    return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	//콤마풀기
	function uncomma(str) {
	    str = String(str);
	    return str.replace(/[^\d]+/g, '');
	}
	
	
</script>

<div id="loadingScreen">
	<div class='loadingimg'></div>	
	<div class='message'></div>
</div>
