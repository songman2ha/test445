/**
 * 씨엠이 소프트 자체 프로젝트 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)씨엠이소프트
 * CopyRight 씨엠이소프트 - 2017
 */
package com.bitkrx.admin.login.control;

import java.security.PrivateKey;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitkrx.admin.login.service.AdminLoginService;
import com.bitkrx.config.CmeResultVO;
import com.bitkrx.config.control.CmeDefaultExtendController;
import com.bitkrx.config.util.CmeSessionInfo;
import com.bitkrx.config.util.ComUtil;
import com.bitkrx.config.util.SessionUtil;
import com.bitkrx.config.util.StringUtils;
import com.bitkrx.config.vo.LoginCommVO;
import com.bitkrx.core.util.SecurityUtil;


/**
 * @프로젝트명	: com.web.adexbeone
 * @패키지    	: cme.com.web.exbeone.admin.login.control
 * @클래스명  	: com.web.adexbeone
 * @작성자		:  (주)씨엠이소프트 임승연
 * @작성일		: 2017. 9. 27.
 */
@Controller
@RequestMapping(value="/admin")
public class AdminLoginController extends CmeDefaultExtendController{

	private static String RSA_WEB_KEY = "_RSA_WEB_Key_"; // 개인키 session key
    private static String RSA_INSTANCE = "RSA"; // rsa transformation
    
	@Autowired
	AdminLoginService loginService;

    @Autowired
    ServletContext servletContext;

//    @Value("${encrypt.key}")
    String enc_key;
	
    String adminMainUrl = "/admin.cust.list.dp/proc.go";
	
    /**
     * 
     * @Method Name  : getLoginView
     * @작성일   : 2016. 11. 4. 
     * @작성자   : 장기숙
     * @변경이력  :
     * @Method 설명 : 로그인 화면
     * @param model
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
	@RequestMapping(value="/login/view.dm")   
	public ModelAndView getLoginView(Model model, HttpServletRequest request, HttpServletResponse response)throws Exception{
		ModelAndView mv = null;
		String rtn_url = "/admin/login/admin_login";
		
//		boolean Auth = sUtil.isAuthenticate();	
//		debugLog("::::::::::::::::: Auth >>> " +Auth);
//		
//		if(Auth){
//			rtn_url = "forward:" + adminMainUrl;// 메인
//			mv = new ModelAndView(rtn_url);
//			return mv; 
//		}
		
		String isLogin = sUtil.getStrValue("isLogin");
//		System.out.println(">>>>>>>>>>>>>>>>>>>>"+isLogin);
		
		Map<String,Object> map = SecurityUtil.RsaKeyCreate();
		PrivateKey privateKey = (PrivateKey) map.get("privateKey");
		//개인키를 session 에 저장한다.
		request.getSession().setAttribute("_RSA_WEB_Key_", privateKey);
		
    	model.addAttribute("pubKeyModule", (String) map.get("pubKeyModule"));
    	model.addAttribute("pubKeyExponent", (String) map.get("pubKeyExponent"));

		mv = new ModelAndView(rtn_url);
		
		return mv;
	}
	
	/**
	 * 
	 * @Method Name  : getLoginCheck
	 * @작성일   : 2016. 11. 4. 
	 * @작성자   : 장기숙
	 * @변경이력  :
	 * @Method 설명 : 아이디 체킹 
	 * @param loginVO
	 * @param response
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login/check.dm")
	public @ResponseBody CmeResultVO getLoginCheck(@ModelAttribute LoginCommVO loginVO , HttpServletResponse response , HttpServletRequest request)throws Exception{

		CmeResultVO res = new CmeResultVO();
		
		res = loginService.checkLogin(loginVO);
		
		return res;
	}

	/**
	 *
	 * @Method Name  : getadminLogin
	 * @작성일   : 2016. 11. 4.
	 * @작성자   : 장기숙
	 * @변경이력  :
	 * @Method 설명 : 로그인 처리
 	 * @param loginVO
	 * @param response
	 * @param model
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/login/action.dm")
	public ModelAndView getadminLogin(@ModelAttribute LoginCommVO loginVO, HttpServletResponse response, Model model, HttpServletRequest request)throws Exception{
		ModelAndView mv = null;
		debugLog("LoginProc ===> Start");
		LoginCommVO resultVO = new LoginCommVO();

		HttpSession session = request.getSession();
        // session 에서 privateKey 가져오기

        PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_Key_");

        if(privateKey == null){
            Map<String,Object> map = SecurityUtil.RsaKeyCreate();
            privateKey = (PrivateKey) map.get("privateKey");
            //개인키를 session 에 저장한다.
            request.getSession().setAttribute("_RSA_WEB_Key_", privateKey);
        }

        //세션키 제거
       	session.removeAttribute("_RSA_WEB_Key_");

		// 복호화
        String aceKey = loginVO.getAce_key();
        aceKey = SecurityUtil.decryptRsa(privateKey, aceKey);
//        System.out.println("aceKey================>"+aceKey);
        debugLog("loginVO.getUser_pwd()"+loginVO.getUser_pwd());
        String _userPw =  SecurityUtil.Dec256Str(loginVO.getUser_pwd(), aceKey);
//        System.out.println("_userPw================>"+_userPw);

		//패스워드 인 경우 복호화르 하지 않고 암호화 된 상태에서 다시 shd256으로 암호화 하여 저장 하거나 비교 한다.
        String _suserPw = SecurityUtil.Sha256Encode(_userPw);
        loginVO.setUser_pwd(_suserPw);
		resultVO = loginService.actionLogin(loginVO);
        boolean loginSuccess = false;

        if (resultVO != null) {
        	loginSuccess = true;
		}

        if(!loginSuccess){
            if (resultVO != null && !"".equals(StringUtils.checkNull(resultVO.getAdmin_email()))) {
            	loginSuccess = true;
            } else {
            	Map<String,String> param_map = new HashMap<String,String>();
                ComUtil.postRedirect(response, request, param_map, "/admin.login.view.dp/proc.go","ID 또는 비밀번호가 일치하지 않습니다.");
            }
        }

        if(loginSuccess){

        	resultVO.setRemoteIp(ComUtil.getRemoteIP(request));

            CmeSessionInfo sessionInfo = new CmeSessionInfo();
        	sessionInfo.setUserInfo(request, response, resultVO);

            ComUtil.postRedirect(response, request, null, "/admin.cust.list.dp/proc.go", "");
        }

        return mv;
	}


	/**
	 * 
	 * @Method Name  : logOut
	 * @작성일   : 2016. 11. 4. 
	 * @작성자   :  장기숙
	 * @변경이력  :
	 * @Method 설명 : 로그아웃 처리
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/logout/view.dm")
	public ModelAndView logOut(HttpServletRequest request, HttpServletResponse response, Model model)throws Exception{
		ModelAndView mv = null;		
		SessionUtil sessionUtil = SessionUtil.getinstance();
		sessionUtil.RemoveAllSession(request);
        Map<String,Object> param_map = ComUtil.setParam(request, null);   
        ComUtil.postRedirect(response, request, param_map, "/admin.login.view.dp/proc.go","");
		return mv;
		
	}
}
