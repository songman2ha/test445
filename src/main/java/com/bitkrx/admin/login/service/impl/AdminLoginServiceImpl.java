/**
 * 씨엠이 소프트 자체 프로젝트 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)씨엠이소프트
 * CopyRight 씨엠이소프트 - 2017
 */
package com.bitkrx.admin.login.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitkrx.admin.login.dao.AdminLoginDAO;
import com.bitkrx.admin.login.service.AdminLoginService;
import com.bitkrx.config.CmeResultVO;
import com.bitkrx.config.service.CmeAbstractServiceImpl;
import com.bitkrx.config.util.StringUtils;
import com.bitkrx.config.vo.LoginCommVO;


/**
 * @프로젝트명	: com.web.adexbeone
 * @패키지    	: cme.com.web.exbeone.admin.login.service.impl
 * @클래스명  	: com.web.adexbeone
 * @작성자		:  (주)씨엠이소프트 임승연
 * @작성일		: 2017. 9. 27.
 */
@Service
public class AdminLoginServiceImpl extends CmeAbstractServiceImpl implements AdminLoginService{


	@Autowired
	AdminLoginDAO loginDAO;
	

	@Override
//	@CommonDataSource(DataSourceType.OPRBIT)
	public LoginCommVO actionLogin(LoginCommVO vo) throws Exception {
		// TODO Auto-generated method stub
		LoginCommVO loginVO = loginDAO.actionLogin(vo);
    	// 3. 결과를 리턴한다.
		
	
    	if (loginVO != null && !"".equals(StringUtils.checkNull(loginVO.getAdmin_email()))){
    		return loginVO;
    	} else {
    		loginVO = null;
    	}
		return loginVO;
	}

	@Override
//	@CommonDataSource(DataSourceType.OPRBIT)
	public CmeResultVO checkLogin(LoginCommVO vo) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.checkLogin(vo);
	}


	@Override
//	@CommonDataSource(DataSourceType.OPRBIT)
	public CmeResultVO changePwd(LoginCommVO vo) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.changePwd(vo);
	}


}
