/**
 * 서일회계법인 프로젝트 관리 시스템 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)크림소프트
 * CopyRight 서일회계법인 - 2015
 */
package com.bitkrx.config.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import com.bitkrx.config.exception.CmeApplicationException;
import com.bitkrx.config.logging.CmeCommonLogger;
import com.bitkrx.config.util.ComUtil;
import com.bitkrx.config.util.SessionUtil;
import com.bitkrx.config.util.StringUtils;
import com.bitkrx.config.vo.CmeExceptionVO;


/**
 * @프로젝트명	: Seoil.Act.WebApp
 * @패키지    	: cme.com.web.common.core.extend
 * @클래스명  	: Seoil.Act.WebApp
 * @작성자		: (주)크림소프트 김윤관
 * @작성일		: 2015. 3. 25.
 */
public class CmeAbstractServiceImpl {

	protected CmeCommonLogger log = new CmeCommonLogger(this.getClass());
	protected SessionUtil sUtil = SessionUtil.getinstance();
	
	@Resource(name = "messageSource")
	private MessageSource messageSource;

	/**
	 * EgovBizException 발생을 위한 메소드 
	 * @param msgKey 메세지리소스에서 제공되는 메세지의 키값
	 * @return Exception EgovBizException 객체 
	 */
	protected Exception processException(final String msgKey) {
		return processException(msgKey, new String[] {});
	}
	/**
	 * EgovBizException 발생을 위한 메소드 
	 * @param msgKey 메세지리소스에서 제공되는 메세지의 키값
	 * @param exception 발생한 Exception(내부적으로 취하고 있다가 에러핸들링시 사용)
	 * @return Exception EgovBizException 객체 
	 */
	protected Exception processException(final String msgKey, Exception e) {
		return processException(msgKey, new String[] {}, e);
	}
	/**
	 * EgovBizException 발생을 위한 메소드 
	 * @param msgKey 메세지리소스에서 제공되는 메세지의 키값
	 * @param msgArgs msgKey의 메세지에서 변수에 취환되는 값들 
	 * @return Exception EgovBizException 객체 
	 */
	protected Exception processException(final String msgKey, final String[] msgArgs) {
		return processException(msgKey, msgArgs, null);
	}

	/**
	 * EgovBizException 발생을 위한 메소드 
	 * @param msgKey 메세지리소스에서 제공되는 메세지의 키값
	 * @param msgArgs msgKey의 메세지에서 변수에 취환되는 값들 
	 * @param exception 발생한 Exception(내부적으로 취하고 있다가 에러핸들링시 사용)
	 * @return Exception EgovBizException 객체 
	 */
	protected Exception processException(final String msgKey, final String[] msgArgs, final Exception e) {
		return processException(msgKey, msgArgs, e, LocaleContextHolder.getLocale());
	}
	/**
	 * EgovBizException 발생을 위한 메소드 
	 * @param msgKey 메세지리소스에서 제공되는 메세지의 키값
	 * @param msgArgs msgKey의 메세지에서 변수에 취환되는 값들 
	 * @param exception 발생한 Exception(내부적으로 취하고 있다가 에러핸들링시 사용)
	 * @param locale 명시적 국가/언어지정 
	 * @return Exception EgovBizException 객체 
	 */
	protected Exception processException(final String msgKey, final String[] msgArgs, final Exception e, Locale locale) {
		return processException(msgKey, msgArgs, e, locale, null);
	}
	/**
	 * EgovBizException 발생을 위한 메소드 
	 * @param msgKey 메세지리소스에서 제공되는 메세지의 키값
	 * @param msgArgs msgKey의 메세지에서 변수에 취환되는 값들 
	 * @param exception 발생한 Exception(내부적으로 취하고 있다가 에러핸들링시 사용)
	 * @param locale 명시적 국가/언어지정 
	 * @param exceptionCreator 외부에서 별도의 Exception 생성기 지정
	 * @return Exception EgovBizException 객체 
	 */
	protected Exception processException(final String msgKey, final String[] msgArgs, final Exception e,
	                                     final Locale locale, ExceptionCreator exceptionCreator) {
		ExceptionCreator eC = null;
		if (exceptionCreator == null) {
			eC = new ExceptionCreator() {
				public Exception createBizException(MessageSource messageSource) {
					return new Exception(messageSource.toString(), e);
				}
			};
		}
		return eC.createBizException(messageSource);
	}

	protected interface ExceptionCreator {
		Exception createBizException(MessageSource messageSource);
	}

		
	
	@ExceptionHandler(CmeApplicationException.class)
	public ModelAndView handleException(CmeApplicationException exception, HttpServletRequest req, HttpServletResponse response) {
		ModelAndView mv = null;
		CmeExceptionVO vo = exception.getExceptVo();
		String strexp = "";
		
		if(!"".equals(vo.getExmessage())){
			strexp = vo.getExmessage();
		}else{
			strexp = StringUtils.checkNull(exception.getMessage());			
		}
		
		if(strexp.length() > 3500){
			strexp = strexp.substring(0, 3400) + "...";
		}
		vo.setExmessage(strexp+"("+vo.getErrorStatusCode()+")");
		vo.setErrorMessage(vo.getErrorMessage() + "(" + vo.getErrorStatusCode() + ")");
		//vo.setErrorMessage(exception.getCustomMessage());
		vo.setTimestamp(exception.getCurDateTime());
		try {
			ComUtil.postRedirect(response, req, vo, "/cme_none.dp/proc.go", "");
		} catch (IOException e) {
			e.printStackTrace();
			mv = new ModelAndView("/cme_none.dp/proc.go");
			return mv;
		}
		return mv;
	}	
	
	
	protected void debugLog(String msg){
		log.DebugLog(msg);
	}
	
	protected void infoLog(String msg){
		log.ViewLog(msg);
	}
	
	protected void errLog(String msg){
		log.ViewErrorLog(msg);
	}
	
	protected void warnLog(String msg){
		log.ViewWarnLog(msg);
	}	

	protected String getTodayTime(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String todayTime = sdf.format(date);
		return todayTime;
	}	
	
}
