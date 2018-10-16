/**
 * 씨엠이 소프트 자체 프로젝트 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)씨엠이소프트
 * CopyRight 씨엠이소프트 - 2017
 */
package com.bitkrx.admin.login.service;

import java.util.List;

import com.bitkrx.config.CmeResultVO;
import com.bitkrx.config.vo.LoginCommVO;

/**
 * @프로젝트명	: com.web.adexbeone
 * @패키지    	: cme.com.web.exbeone.admin.login.service
 * @클래스명  	: com.web.adexbeone
 * @작성자		:  (주)씨엠이소프트 임승연
 * @작성일		: 2017. 9. 27.
 */
public interface AdminLoginService {


	LoginCommVO actionLogin(LoginCommVO vo)throws Exception;
	
	CmeResultVO checkLogin(LoginCommVO vo)throws Exception;
	
	CmeResultVO changePwd(LoginCommVO vo)throws Exception;

}
