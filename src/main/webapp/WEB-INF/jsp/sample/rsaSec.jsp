<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String ctxPath = (String) request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>
<script type="text/javascript" src="/js/jquery-3.1.0.min.js"></script>
<!-- 순서에 유의 -->
<script language="JavaScript" type="text/javascript" src="/js/dmenc/jsbn.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/dmenc/prng4.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/dmenc/rng.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/dmenc/rsa.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/dmenc/enc_aes.js"></script>

<script type="text/javascript">    
	function dec2hex (dec) {
	  return ('0' + dec.toString(16)).substr(-2)
	}

	// generateId :: Integer -> String
	function generateId (len) {
	  var arr = new Uint8Array((len || 40) / 2)
	  window.Crypto.getRandomValues(arr)
	  return Array.from(arr, dec2hex).join('')
	}
	
	function EncryptRSA(m, e, text){
		var rsa = new RSAKey();
		rsa.setPublic(m, e);
		return rsa.encrypt(text);
	}
	
	function EncryptAES(plain_text, k)
	{
		GibberishAES.size(256);	
		return GibberishAES.aesEncrypt(plain_text, k);
	}
	
	

    function login(){
        var id = $("#USER_ID_TEXT");
        var pw = $("#USER_PW_TEXT");
   		
        var randomKey = generateId(32);
        	
        // rsa 암호화
        var res = EncryptRSA($('#RSAModulus').val(),$('#RSAExponent').val(), randomKey);
        
        var encAESID = EncryptAES(id.val(),randomKey);
        var encAESPW = EncryptAES(pw.val(),randomKey);
  
        $("#USER_PW").val(encAESPW); 
        $("#USER_ID").val(encAESID);
        $("#ACE_KEY").val(res);
        
        id.val("");
        pw.val("");
 
        return true;
    }
</script>
</head>
<body>
    <form name="frm" method="post" action="/sample.rsaUtilDncSec.dp/proc.go" onsubmit="return login()">
        <input type="text" id="RSAModulus" value="${pubKeyModule}"/>
        <input type="text" id="RSAExponent" value="${pubKeyExponent}"/>    
        <input type="text" placeholder="아이디" id="USER_ID_TEXT" name="USER_ID_TEXT" />
        <input type="password" placeholder="비밀번호" id="USER_PW_TEXT" name="USER_PW_TEXT" />
        <input type="hidden" id="USER_ID" name="USER_ID">
        <input type="hidden" id="USER_PW" name="USER_PW">
        <input type="hidden" id="ACE_KEY" name="ACE_KEY">
        <input type="submit" value="로그인" />
    </form>
</body>
</html>
