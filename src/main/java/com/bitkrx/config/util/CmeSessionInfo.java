package com.bitkrx.config.util;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bitkrx.config.logging.CmeCommonLogger;
import com.bitkrx.config.util.CmeConstant.CmeSessionConst;
import com.bitkrx.config.vo.LoginCommVO;


/**
 * @Class Name  : CmeSessionInfo
 * @작성일   : 2012. 9. 26. 
 * @작성자   : Kim, YunKwan
 * @변경이력  :
 * @Method 설명 : 세션정보를 통합 관리
 */
public class CmeSessionInfo {
	CmeCommonLogger log = new CmeCommonLogger(this.getClass());
	SessionUtil sUtil;

	public CmeSessionInfo() {
		sUtil = SessionUtil.getinstance();
	}

	public void setUserInfo(HttpServletRequest request, HttpServletResponse response, LoginCommVO loginInfo){

		if(loginInfo != null){
			
			sUtil.SetSessionValue(request, CmeSessionConst.IsLogin, "true");
			sUtil.SetSessionValue(request, CmeSessionConst.ADMIN_EMAIL, loginInfo.getAdmin_email());
			sUtil.SetSessionValue(request, CmeSessionConst.USER_IP, loginInfo.getRemoteIp());
			sUtil.SetSessionValue(request, CmeSessionConst.ADMIN_NAME, loginInfo.getAdmin_name());
			sUtil.SetSessionValue(request, CmeSessionConst.ADMIN_PHONE, loginInfo.getAdmin_phone());

		}else{
			log.ViewWarnLog("세션에 담을 로그인 정보가 없습니다.(LoginVO)");
		}
	}

}
