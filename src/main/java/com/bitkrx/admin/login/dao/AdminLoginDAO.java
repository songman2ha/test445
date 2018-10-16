/**
 * 씨엠이 소프트 자체 프로젝트 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)씨엠이소프트
 * CopyRight 씨엠이소프트 - 2017
 */
package com.bitkrx.admin.login.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bitkrx.config.CmeResultVO;
import com.bitkrx.config.dao.CmeComAbstractDAO;
import com.bitkrx.config.util.StringUtils;
import com.bitkrx.config.vo.LoginCommVO;

/**
 * @프로젝트명	: com.web.adexbeone
 * @패키지    	: cme.com.web.exbeone.admin.login.dao
 * @클래스명  	: com.web.adexbeone
 * @작성자		:  (주)씨엠이소프트 임승연
 * @작성일		: 2017. 9. 27.
 */
@Repository
public class AdminLoginDAO extends CmeComAbstractDAO{

	public LoginCommVO actionLogin(LoginCommVO vo)throws Exception{
		
		LoginCommVO logininfo = new LoginCommVO();
		
    	logininfo = (LoginCommVO)selectByPk("AdminLoginDAO.actionLogin", vo);
    	return logininfo;				
		
	}
	
	public CmeResultVO checkLogin(LoginCommVO vo)throws Exception{
		CmeResultVO res = new CmeResultVO();
		String user_email = (String)selectByPk("AdminLoginDAO.getAdminId", vo);
		res.setResultStrCode(user_email);
		res.setResultCode(1);
		
		log.DebugLog("user_email:" + user_email);
		
		if("".equals(StringUtils.checkNull(user_email))){
			res.setResultMsg("아이디가 존재하지 않습니다. 아이디를 확인해주십시요.");
			res.setResultCode(-1);
		}
		return res;		
	}
	
	public CmeResultVO changePwd(LoginCommVO vo)throws Exception{
		CmeResultVO res = new CmeResultVO();
		int resUpt = 0;
		resUpt = (int)update("AdminLoginDAO.uptPasswd", vo);
		log.DebugLog("비밀번호변경:" + resUpt);
		res.setResultCode(resUpt);
		if(resUpt > 0){
			res.setResultMsg("비밀번호변경이 성공하였습니다.");
		}else{
			res.setResultMsg("비밀번호변경이 실패하였습니다.");
		}
		
		return res;		
	}
	
	
	public String getChgPwdYN(String id){
		
		String res = "";
		log.DebugLog("check ID : " + id);
		try {
			res = (String)selectByPk("AdminLoginDAO.getPwdChgYN", id);
		} catch (Exception e) {
			// TODO: handle exception
			log.DebugLog(e.getMessage());
		}
		return res;
	}
	
}