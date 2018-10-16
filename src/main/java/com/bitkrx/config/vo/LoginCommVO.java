/**
 * 서일회계법인 프로젝트 관리 시스템 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)크림소프트
 * CopyRight 서일회계법인 - 2015
 */
package com.bitkrx.config.vo;

import java.io.Serializable;
import java.util.List;

/**
 * @프로젝트명	: Seoil.Act.WebApp
 * @패키지    	: seoil.act.web.login.vo
 * @클래스명  	: Seoil.Act.WebApp
 * @작성자		: (주)크림소프트 김윤관
 * @작성일		: 2015. 3. 21.
 */
public class LoginCommVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 7442272242210914590L;
	
	private String remoteIp = "";
    private String admin_email  = "";
    private String admin_password  = "";
    private String admin_name = "";
    private String admin_phone  = "";
    private String upt_ip  = "";
    private String upt_email = "";
    private String upt_dt   = "";
    private String reg_email = "";
    private String reg_dt   = "";
    private String ace_key = "";
    private String user_ip ="";
    private String user_email ="";
    private String user_pwd ="";

    public static long getSerialVersionUID() { return serialVersionUID; }

    public String getRemoteIp() { return remoteIp; }

    public void setRemoteIp(String remoteIp) { this.remoteIp = remoteIp; }

    public String getAdmin_email() { return admin_email; }

    public void setAdmin_email(String admin_email) { this.admin_email = admin_email; }

    public String getAdmin_password() { return admin_password; }

    public void setAdmin_password(String admin_password) { this.admin_password = admin_password; }

    public String getAdmin_name() { return admin_name; }

    public void setAdmin_name(String admin_name) { this.admin_name = admin_name; }

    public String getAdmin_phone() { return admin_phone; }

    public void setAdmin_phone(String admin_phone) { this.admin_phone = admin_phone; }

    public String getUpt_ip() { return upt_ip; }

    public void setUpt_ip(String upt_ip) { this.upt_ip = upt_ip; }

    public String getUpt_email() { return upt_email; }

    public void setUpt_email(String upt_email) { this.upt_email = upt_email; }

    public String getUpt_dt() { return upt_dt; }

    public void setUpt_dt(String upt_dt) { this.upt_dt = upt_dt; }

    public String getReg_email() { return reg_email; }

    public void setReg_email(String reg_email) { this.reg_email = reg_email; }

    public String getReg_dt() { return reg_dt; }

    public void setReg_dt(String reg_dt) { this.reg_dt = reg_dt; }

    public String getAce_key() { return ace_key; }

    public void setAce_key(String ace_key) { this.ace_key = ace_key; }

    public String getUser_ip() { return user_ip; }

    public void setUser_ip(String user_ip) { this.user_ip = user_ip; }

    public String getUser_email() { return user_email; }

    public void setUser_email(String user_email) { this.user_email = user_email; }

    public String getUser_pwd() { return user_pwd; }

    public void setUser_pwd(String user_pwd) { this.user_pwd = user_pwd; }
}
