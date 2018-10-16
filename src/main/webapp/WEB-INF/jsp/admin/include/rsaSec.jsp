<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String ctxPath = (String) request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>
<!-- 순서에 유의 -->
<script language="JavaScript" type="text/javascript" src="/js/dmenc/jsbn.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/dmenc/prng4.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/dmenc/rng.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/dmenc/rsa.js"></script>
<script language="JavaScript" type="text/javascript" src="/js/dmenc/enc_aes.js"></script>

<script type="text/javascript">
	
	function arrayFrom() {
		if (!Array.from) {
			  Array.from = (function () {
			    var toStr = Object.prototype.toString;
			    var isCallable = function (fn) {
			      return typeof fn === 'function' || toStr.call(fn) === '[object Function]';
			    };
			    var toInteger = function (value) {
			      var number = Number(value);
			      if (isNaN(number)) { return 0; }
			      if (number === 0 || !isFinite(number)) { return number; }
			      return (number > 0 ? 1 : -1) * Math.floor(Math.abs(number));
			    };
			    var maxSafeInteger = Math.pow(2, 53) - 1;
			    var toLength = function (value) {
			      var len = toInteger(value);
			      return Math.min(Math.max(len, 0), maxSafeInteger);
			    };

			    // The length property of the from method is 1.
			    return function from(arrayLike/*, mapFn, thisArg */) {
			      // 1. Let C be the this value.
			      var C = this;

			      // 2. Let items be ToObject(arrayLike).
			      var items = Object(arrayLike);

			      // 3. ReturnIfAbrupt(items).
			      if (arrayLike == null) {
			        throw new TypeError("Array.from requires an array-like object - not null or undefined");
			      }

			      // 4. If mapfn is undefined, then let mapping be false.
			      var mapFn = arguments.length > 1 ? arguments[1] : void undefined;
			      var T;
			      if (typeof mapFn !== 'undefined') {
			        // 5. else
			        // 5. a If IsCallable(mapfn) is false, throw a TypeError exception.
			        if (!isCallable(mapFn)) {
			          throw new TypeError('Array.from: when provided, the second argument must be a function');
			        }

			        // 5. b. If thisArg was supplied, let T be thisArg; else let T be undefined.
			        if (arguments.length > 2) {
			          T = arguments[2];
			        }
			      }

			      // 10. Let lenValue be Get(items, "length").
			      // 11. Let len be ToLength(lenValue).
			      var len = toLength(items.length);

			      // 13. If IsConstructor(C) is true, then
			      // 13. a. Let A be the result of calling the [[Construct]] internal method of C with an argument list containing the single item len.
			      // 14. a. Else, Let A be ArrayCreate(len).
			      var A = isCallable(C) ? Object(new C(len)) : new Array(len);

			      // 16. Let k be 0.
			      var k = 0;
			      // 17. Repeat, while k < len… (also steps a - h)
			      var kValue;
			      while (k < len) {
			        kValue = items[k];
			        if (mapFn) {
			          A[k] = typeof T === 'undefined' ? mapFn(kValue, k) : mapFn.call(T, kValue, k);
			        } else {
			          A[k] = kValue;
			        }
			        k += 1;
			      }
			      // 18. Let putStatus be Put(A, "length", len, true).
			      A.length = len;
			      // 20. Return A.
			      return A;
			    };
			  }());
			}
	}

	function dec2hex (dec) {
	  return ('0' + dec.toString(16)).substr(-2)
	}

	// generateId :: Integer -> String
	function generateId (len) {
		arrayFrom();
	  var arr = new Uint8Array((len || 40) / 2)
// 	  window.crypto.getRandomValues(arr)
	  var crypto = window.crypto || window.msCrypto;
	  crypto.getRandomValues(arr);
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
	
</script>
</head>
</html>
