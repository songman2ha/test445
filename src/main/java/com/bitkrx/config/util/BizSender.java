/**
 * (주)씨엠이소프트 의 시스템 웹어플리케이션 프레임웍 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)씨엠이소프트
 * CopyRight CMESoft. Co.,LTD. Since 2015 
 * 총괄 개발 책임자 : 주식회사 씨엠이소프트 통합기술개발실 실장 김윤관
 */
package com.bitkrx.config.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;

import com.bitkrx.config.control.CmeDefaultExtendController;
import com.bitkrx.config.vo.SmsInfoVO;

/**
 * @프로젝트명	: cme.web.noryweb
 * @패키지    	: cme.com.web.common.util
 * @클래스명  	: cme.web.noryweb
 * @작성자		: (주)씨엠이소프트 김윤관
 * @작성일		: 2016. 2. 9.
 */
public class BizSender extends CmeDefaultExtendController{

	
	private static BizSender bizSender = null;
	
	@Autowired(required=true)
	HttpServletRequest request;
	
	public static BizSender getinstance(){
		synchronized(BizSender.class){
			if(bizSender == null){
				bizSender = new BizSender();
			}
			return bizSender;
		}
	}	
	
	public String sendMailSms(SmsInfoVO vo) {
		String res = "";
		try {
			ServerTrans tran = ServerTrans.getinstance();			
			res = tran.BizSender(vo, request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public String sendMailSms(SmsInfoVO vo,String res) {
		res = "";
		try {
			ServerTrans tran = ServerTrans.getinstance();			
			res = tran.BizSender(vo, request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
/*	public void sendSms(SendInfoVO vo) {
		try {
			ServerTrans tran = ServerTrans.getinstance();			
			tran.BizSender(vo, request);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/	
	
}
