<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<c:import url="/admin.include.common_admin_head.ds/proc.go" charEncoding="utf-8"/>
<c:import url="/admin.include.rsaSec.ds/proc.go" charEncoding="utf-8" />
<%--암호화--%>
<script type="text/javascript">
	$(document).ready(function() {
// 		getid();
		var id = GetCookie('saveAdid');
// 		console.log(id);
		if (id != '' && typeof id != 'undefined' && id != null) {
			$("#checkId").attr("checked", true);
			$("#_id").val(id);
			$("#_password").focus();
		} else {
			$("#checkId").attr("checked", false);
			$("#_id").val('');
			$("#_id").focus();
		}

	});

	function getid() {
		var id = GetCookie('saveAdid');

		if (id != '' && typeof id != 'undefined' && id != null) {
			$("#checkId").attr("checked", true);
			$("#_id").val(id);
			$("#_password").focus();
		} else {
			$("#checkId").attr("checked", false);
			$("#_id").val('');
			$("#_id").focus();
		}
	}

	function saveIdProc() {
		var idval = $("#_id").val();
		if ($("#checkId").is(':checked')) {
			SetCookie("saveAdid", idval, 30);
		} else {
			RemoveCookie("saveAdid");
		}
	}

	function fnInit() {
		getid();
	}

	function loginCheck() {

		if ($("#_id").val() == '') {
			alert("아이디는 필수입력사항입니다.");
			$("#_id").focus();
			return;
		}

		if ($("#_password").val() == '') {
			alert("아이디는 필수입력사항입니다.");
			$("#_password").focus();
			return;
		}
		
		$("#user_email").val($("#_id").val());
		
		var data = {
			"user_email" : $("#user_email").val()
		};

		var _url = "/admin.login.check.dp/proc.go";
		postLoadigAjax(_url, data, LogincheckRes, true, "");
	}

	function LogincheckRes(data) {
		if (data.resultCode > 0) {
			actionLogin();
		} else {
// 			popupOk('로그인', data.resultMsg, '다시 확인해 주세요.', "확인");
			alert(data.resultMsg);
		}
	}
	
	function actionLogin() {
		saveIdProc();
		
		//비밀번호 암호화
		var pw = $("#_pwd").val();
		var randomKey = generateId(32);
	        	
		// rsa 암호화
		var res = EncryptRSA($('#RSAModulus').val(),$('#RSAExponent').val(), randomKey);
		
		var encAESPW = EncryptAES(pw,randomKey);

		$("#user_pwd").val(encAESPW);
		$("#ace_key").val(res);
		
		loadFrm("loading", "adminLogin", "post", "/admin.login.action.dp/proc.go?${paramSet}");
	}

	function refresh() {
		location.reload();
	}
</script>
</head>
<body>

	<div class="header">
		<h1>
			<a href="#n" class="logo">
				<img src="/images/admin/img_logo_bo.png">
			</a>
		</h1>
		<a href="#n" class="btn_menu">
			<img src="/images/admin/ico_hamburger.png">
		</a>
	</div>
	<!--// header -->

	<div class="container">
		<form id="adminLogin" name="adminLogin" method="post">
			<input type="hidden" id="RSAModulus" value="${pubKeyModule}"/>
	        <input type="hidden" id="RSAExponent" value="${pubKeyExponent}"/> 
	        <input type="hidden" id="ace_key" name="ace_key">
			<div class="login_box">
				<img src="/images/admin/img_logo_login.png">
				<p>관리자모드 로그인</p>
				<div class="login_form">
					<span class="user_id">
						<label>아이디</label>
						<input type="text" title="아이디를 입력하세요." id="_id" onkeydown="javascript:if (event.keyCode == 13) { loginCheck(); }" />
					</span>
					<span class="user_pw">
						<label>비밀번호</label>
						<input type="password" maxlength="25" title="비밀번호를 입력하세요." id="_pwd" onkeydown="javascript:if (event.keyCode == 13) { loginCheck();}" />
					</span>
				</div>
				<span class="select_wrap">
					<input type="checkbox" name="checkId" id="checkId">
					<label>계정정보 기억하기</label>
				</span>
				<a class="btn_c02 mt15" alt="로그인" id="actLogin" onclick="javascript:loginCheck();">로그인(Login)</a>
				<input type="hidden" id="user_pwd" name="user_pwd" />
				<input type="hidden" id="user_email" name="user_email" />
			</div>
		</form>
	</div>
	<!--// container -->
</body>
</html>