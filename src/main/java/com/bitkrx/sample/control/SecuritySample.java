package com.bitkrx.sample.control;

import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPublicKeySpec;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitkrx.core.util.SecurityUtil;
import com.common.utils.AesUtil;
import com.sun.xml.internal.messaging.saaj.util.Base64;

@Controller
@RequestMapping("/sample")
public class SecuritySample {
	private static String RSA_WEB_KEY = "_RSA_WEB_Key_"; // 개인키 session key
    private static String RSA_INSTANCE = "RSA"; // rsa transformation
    
    @RequestMapping("/rsaUtilEncSec.dm")
	public ModelAndView rsaUtilEncSec(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		ModelAndView mv = null;
		
		Map<String,Object> map = SecurityUtil.RsaKeyCreate();
		PrivateKey privateKey = (PrivateKey) map.get("privateKey");
		//개인키를 session 에 저장한다.
		request.getSession().setAttribute("_RSA_WEB_Key_", privateKey);
		
    	model.addAttribute("pubKeyModule", (String) map.get("pubKeyModule"));
    	model.addAttribute("pubKeyExponent", (String) map.get("pubKeyExponent"));
    	
		mv = new ModelAndView();
		mv.setViewName("/sample/rsaSec");
		return mv;
	}
    
    @RequestMapping("/rsaUtilDncSec.dm")
	public ModelAndView rsaUtilDncSec(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
    	ModelAndView mv = null;
    	
    	String userId = (String) request.getParameter("USER_ID");
    	String userPw = (String) request.getParameter("USER_PW");
       
        HttpSession session = request.getSession();
        // session 에서 privateKey 가져오기 
        PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_Key_");
        //세션키 제거
      	session.removeAttribute("_RSA_WEB_Key_");
                
        // 복호화
        String aceKey = (String) request.getParameter("ACE_KEY");
        aceKey = SecurityUtil.decryptRsa(privateKey, aceKey);
//        System.out.println("aceKey================>"+aceKey);
        
        String _userID =  SecurityUtil.Dec256Str(userId, aceKey);
//        System.out.println("_userId================>"+_userID);
        
        String _userPw =  SecurityUtil.Dec256Str(userPw, aceKey);
//        System.out.println("_userPw================>"+_userPw);
        
        //패스워드 인 경우 복호화르 하지 않고 암호화 된 상태에서 다시 shd256으로 암호화 하여 저장 하거나 비교 한다.
        String _suserPw = SecurityUtil.Sha256Encode(userPw);
//        System.out.println("_suserPw================>"+_suserPw);        
        /*//
        	비지니스 진행
        
        //*/
        mv = new ModelAndView();
		mv.setViewName("/sample/rsaSec");
		return mv;
	}

	@RequestMapping("/rsaEncSec.dm")
	public ModelAndView rsaEncSec(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		ModelAndView mv = null;
		
		//String test = testDecryptRsa(initRsa(request),encRsa(request));
		initRsa(request);
		//System.out.println("init ::"+test);
		
		mv = new ModelAndView();
		mv.setViewName("/sample/rsaSec");
		return mv;
	}
	
	@RequestMapping("/rsaDncSec.dm")
	public ModelAndView rsaDencSec(
			@RequestParam(name="USER_ID",required=false) String userId,
			HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		
		ModelAndView mv = null;
		
		
		//String userId = (String) request.getParameter("USER_ID");
        String userPw = (String) request.getParameter("USER_PW");
 
        HttpSession session = request.getSession();
        PrivateKey privateKey = (PrivateKey) session.getAttribute(SecuritySample.RSA_WEB_KEY);
        
        if(privateKey == null) {
//        	System.out.println("========== privateKey null =============");
        }
        
        // 복호화
        String aceKey = (String) request.getParameter("ACE_KEY");
        aceKey = decryptRsa(privateKey, aceKey);
//        System.out.println("aceKey================>"+aceKey);
//        System.out.println("userId================>"+userId);
        String _userID = AesUtil.AES_256Decode(userId, aceKey);
//        System.out.println("_userId================>"+_userID);
        		
        String _userPw = AesUtil.AES_256Decode(userPw, aceKey);
        String _suserPw = SecurityUtil.Sha256Encode(userPw);
//        System.out.println("_userPw================>"+_userPw);
//        System.out.println("_suserPw================>"+_suserPw);
		session.removeAttribute(SecuritySample.RSA_WEB_KEY);
		
		mv = new ModelAndView();
		mv.setViewName("/sample/rsaSec");
		return mv;
	}
	
	/**
     * 복호화
     * 
     * @param privateKey
     * @param securedValue
     * @return
     * @throws Exception
     */
    private String decryptRsa(PrivateKey privateKey, String securedValue) throws Exception {
        Cipher cipher = Cipher.getInstance(SecuritySample.RSA_INSTANCE);
        
        byte[] encryptedBytes = hexToByteArray(securedValue);
        /*byte[] encryptedBytes2 = new byte[encryptedBytes.length-1];
        if(encryptedBytes[0] == 0){
        System.arraycopy(encryptedBytes, 1, encryptedBytes2, 0, encryptedBytes.length-1);
        }*/
        
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
    }
    
    /**
     * 16진 문자열을 byte 배열로 변환한다.
     * 
     * @param hex
     * @return
     */
    public static byte[] hexToByteArray(String hex) {
    	int len = hex.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(hex.charAt(i), 16) << 4)
                                 + Character.digit(hex.charAt(i+1), 16));
        }
        return data;
      
    }



	
	/**
     * rsa 공개키, 개인키 생성
     * 
     * @param request
     */
    public PrivateKey initRsa(HttpServletRequest request) {
        HttpSession session = request.getSession();
 
        KeyPairGenerator generator;
        PrivateKey privateKey = null;
        try {
            generator = KeyPairGenerator.getInstance(SecuritySample.RSA_INSTANCE);
            generator.initialize(1024);
 
            KeyPair keyPair = generator.genKeyPair();
            KeyFactory keyFactory = KeyFactory.getInstance(SecuritySample.RSA_INSTANCE);
            PublicKey publicKey = keyPair.getPublic();
            privateKey = keyPair.getPrivate();
 
            session.setAttribute(SecuritySample.RSA_WEB_KEY, privateKey); // session에 RSA 개인키를 세션에 저장
 
            RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
            String publicKeyModulus = publicSpec.getModulus().toString(16);
            String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
            
//            System.out.println("pubKeyModule ::"+publicKeyModulus);
//            System.out.println("pubKeyExponent ::"+publicKeyExponent);
            
            request.setAttribute("pubKeyModule", publicKeyModulus); // rsa modulus 를 request 에 추가
            request.setAttribute("pubKeyExponent", publicKeyExponent); // rsa exponent 를 request 에 추가
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return privateKey;
    }
    
    /*
     * rsa 통한 암호화 - 테스트를 위해 public key 로 암호화 한다.
     */
    public byte[] encRsa(HttpServletRequest request) throws Exception {
    	String publicKeyModulus = (String) request.getAttribute("RSAModulus"); // rsa modulus 를 request 에 추가
    	String publicKeyExponent = (String) request.getAttribute("RSAExponent"); // rsa exponent 를 request 에 추가
    	
    	BigInteger modulus = new BigInteger(publicKeyModulus, 16);
    	BigInteger exponent = new BigInteger(publicKeyExponent, 16);
    	RSAPublicKeySpec pubks = new RSAPublicKeySpec(modulus, exponent);
    	
    	KeyFactory keyFactory = KeyFactory.getInstance("RSA");
    	 
    	PublicKey publicKey = keyFactory.generatePublic(pubks);
    	
    	Cipher cipher = Cipher.getInstance("RSA");
//    	System.out.println("byte --::"+ Base64.encode("testtest".getBytes()));
    	 cipher.init(Cipher.ENCRYPT_MODE, publicKey);
         byte[] cipherText = cipher.doFinal("testtest".getBytes());
//         System.out.println("cipher: ("+ cipherText.length +")"+ new String(cipherText));
    	
         return cipherText;
    }
    
    /**
     * public key 암호화 한것을 복호화
     *   
     */
    private String testDecryptRsa(PrivateKey privateKey,byte[] by) throws Exception {
        Cipher cipher = Cipher.getInstance(SecuritySample.RSA_INSTANCE);
       
        
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(by);
        String decryptedValue = new String(decryptedBytes, "utf-8"); // 문자 인코딩 주의.
        return decryptedValue;
    }


}
