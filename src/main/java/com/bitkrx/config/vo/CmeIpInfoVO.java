package com.bitkrx.config.vo;

import java.io.Serializable;

public class CmeIpInfoVO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3955528980842434229L;

	private String ipinfo = "";
	private String ipdesc = "";
	private String use_yn = "";
	private String create_dt = "";
	private String update_dt = "";
	private String create_user = "";
	private String update_user = "";
	
	public String getIpinfo() {
		return ipinfo;
	}
	public void setIpinfo(String ipinfo) {
		this.ipinfo = ipinfo;
	}
	public String getIpdesc() {
		return ipdesc;
	}
	public void setIpdesc(String ipdesc) {
		this.ipdesc = ipdesc;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getCreate_dt() {
		return create_dt;
	}
	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}
	public String getUpdate_dt() {
		return update_dt;
	}
	public void setUpdate_dt(String update_dt) {
		this.update_dt = update_dt;
	}
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}
	public String getUpdate_user() {
		return update_user;
	}
	public void setUpdate_user(String update_user) {
		this.update_user = update_user;
	}
	
}
