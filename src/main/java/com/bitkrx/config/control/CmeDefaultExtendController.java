package com.bitkrx.config.control;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.servlet.LocaleResolver;

public class CmeDefaultExtendController extends CmeExtendsControl{
	
	
	@Autowired
	private MessageSource messageSource;	
	
	@Autowired
	private LocaleResolver localeResolver;	
    /**
     * @오바라이딩클래스 : isAuthenticate
     * @작성자     : (주)크림소프트 김윤관
     * @작성일     : 2015. 5. 10.
     * @Method 설명 :
     * @see CmeExtendsControl.com.cmm.CmmExtendsControl#isAuthenticate()
     */
   /* @Override
    protected boolean isAuthenticate() {
        // TODO Auto-generated method stub

        if(!sUtil.isAuthenticate()){
            CmeExceptionVO vo = new CmeExceptionVO();
            vo.setErrorStatusCode(""+HttpStatus.SERVICE_UNAVAILABLE);
            vo.setErrorMessageCode("error.page.data.not.exist");
            vo.setErrorTitleCode("error.page.data.not.exist.title");
            String custMsg = "로그인이 되어있지 않습니다.<br/>돌아가기를 누르면 로그인페이지로 이동합니다.";
            String custTit = "로그인 오류";
            
            vo.setTitle(custTit);
            vo.setErrorMessage(custMsg);
            vo.setExmessage(custMsg);
            vo.setReturnUrl("LOGIN");
            throw new CmeApplicationException(vo); // 강제로 화면에 오류를 표출 시키주는 커스텀 Exception          
        }
        
        return true;
    }*/

    /**
     * @오바라이딩클래스 : checkAuth
     * @작성자     : (주)크림소프트 김윤관
     * @작성일     : 2015. 5. 10.
     * @Method 설명 :
     * @param chkauth
     * @return
     * @see CmeExtendsControl.com.cmm.CmmExtendsControl#checkAuth(int)
     */
    /*@Override
    protected boolean checkAuth(int chkauth) {
        // TODO Auto-generated method stub
        int userAuth = sUtil.getAuthLevel();
        debugLog("userAuth:" + userAuth + "/chkAuth:" + chkauth);
        
        if(chkauth > 0){
            if(!sUtil.isAuthenticate()){
                CmeExceptionVO vo = new CmeExceptionVO();
                vo.setErrorStatusCode(""+HttpStatus.SERVICE_UNAVAILABLE);
                vo.setErrorMessageCode("error.page.data.not.exist");
                vo.setErrorTitleCode("error.page.data.not.exist.title");
                String custMsg = "로그인이 되어있지 않습니다.<br/>돌아가기를 누르면 로그인페이지로 이동합니다.";
                String custTit = "로그인 오류";
                
                vo.setTitle(custTit);
                vo.setErrorMessage(custMsg);
                vo.setExmessage(custMsg);
                vo.setReturnUrl("LOGIN");
                throw new CmeApplicationException(vo); // 강제로 화면에 오류를 표출 시키주는 커스텀 Exception          
            }
        }
        
        if(userAuth < chkauth){//권한없음
            CmeExceptionVO vo = new CmeExceptionVO();
            vo.setErrorStatusCode(""+HttpStatus.SERVICE_UNAVAILABLE);
            vo.setErrorMessageCode("error.page.data.not.exist");
            vo.setErrorTitleCode("error.page.data.not.exist.title");
            String custMsg = "해당 프로그램에 접근할 충분한 권한이 없습니다.<br/>관리자에게 문의바랍니다.";
            String custTit = "접근 권한이 없습니다.";
            
            vo.setTitle(custTit);
            vo.setErrorMessage(custMsg);
            vo.setExmessage(custMsg);
            vo.setReturnUrl(sUtil.getPreMenuId());
            throw new CmeApplicationException(vo); // 강제로 화면에 오류를 표출 시키주는 커스텀 Exception
            //return false;
        }
        
        return true;
    }*/

    /**
     * @오바라이딩클래스 : isAuth
     * @작성자     : (주)크림소프트 김윤관
     * @작성일     : 2015. 7. 15.
     * @Method 설명 :
     * @return
     * @see CmeExtendsControl.com.cmm.CmmExtendsControl#isAuth()
     */
   /* @Override
    protected boolean isAuth() {
        // TODO Auto-generated method stub
        return sUtil.isAuthenticate();
    }*/

	protected String getLoMsg(HttpServletRequest request, String key) {
		
		String msg = "";
//		msg = messageSource.getMessage(key,null, "no surch", Locale.KOREA);
		msg = messageSource.getMessage(key,null, "", localeResolver.resolveLocale(request));
		
		return msg;
	}
	
	protected String getLocale(HttpServletRequest request) {
		return localeResolver.resolveLocale(request).getLanguage();
	}
	
	protected void setLocale(HttpServletRequest request, HttpServletResponse response, String lang) {
		localeResolver.setLocale(request, response, new Locale(lang));
	}
	
    
}
