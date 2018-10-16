/**
 * 씨엠이 소프트 자체 프로젝트 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)씨엠이소프트
 * CopyRight 씨엠이소프트 - 2017
 */
package com.bitkrx.config.vo;

import java.io.Serializable;

/**
 * @프로젝트명	: com.bitkrx.admin
 * @패키지    	: com.bitkrx.config.vo
 * @클래스명  	: com.bitkrx.admin
 * @작성자		:  (주)씨엠이소프트 박상웅
 * @작성일		: 2017. 12. 8.
 */
public class SmsInfoVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -1081495244710334570L;

	String email_info		=		"";
	String name_info		=		"";
	String mobile_info		=		"";
	String etc1				=		"";
	String etc2				=		"";
	String etc3				=		"";
	String etc4				=		"";	
	String etc5				=		"";
	String auth_key			=		"";
	public String getEmail_info() {
		return email_info;
	}
	public void setEmail_info(String email_info) {
		this.email_info = email_info;
	}
	public String getName_info() {
		return name_info;
	}
	public void setName_info(String name_info) {
		this.name_info = name_info;
	}
	public String getMobile_info() {
		return mobile_info;
	}
	public void setMobile_info(String mobile_info) {
		this.mobile_info = mobile_info;
	}
	public String getEtc1() {
		return etc1;
	}
	public void setEtc1(String etc1) {
		this.etc1 = etc1;
	}
	public String getEtc2() {
		return etc2;
	}
	public void setEtc2(String etc2) {
		this.etc2 = etc2;
	}
	public String getEtc3() {
		return etc3;
	}
	public void setEtc3(String etc3) {
		this.etc3 = etc3;
	}
	public String getEtc4() {
		return etc4;
	}
	public void setEtc4(String etc4) {
		this.etc4 = etc4;
	}
	public String getEtc5() {
		return etc5;
	}
	public void setEtc5(String etc5) {
		this.etc5 = etc5;
	}
	public String getAuth_key() {
		return auth_key;
	}
	public void setAuth_key(String auth_key) {
		this.auth_key = auth_key;
	}	
	
}
