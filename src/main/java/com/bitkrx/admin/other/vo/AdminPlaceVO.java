package com.bitkrx.admin.other.vo;

import com.bitkrx.config.vo.CmeExtendListVO;

import java.util.ArrayList;
import java.util.List;

public class AdminPlaceVO extends CmeExtendListVO {

    private String brh_code = "";
    private String brh_nm = "";
    private String mngr_email = "";
    private String mngr_nm = "";
    private String tel_no = "";
    private String addr1 = "";
    private String addr2 = "";
    private String dtl_adrs = "";
    private String use_yn = "";
    private String etc = "";
    private String reg_email = "";
    private String reg_dt = "";
    private String reg_ip = "";
    private String upt_email = "";
    private String upt_dt = "";
    private String upt_ip = "";
    private String brh_nm_en = "";
    private String natn_code = "";
    private String natn_nm = "";
    private String auth_level_cd = "";
    private List<AdminPlaceVO> chgSelList = new ArrayList<AdminPlaceVO>();

    public String getNatn_nm() {
        return natn_nm;
    }

    public void setNatn_nm(String natn_nm) {
        this.natn_nm = natn_nm;
    }

    public String getNatn_code() {
        return natn_code;
    }

    public void setNatn_code(String natn_code) {
        this.natn_code = natn_code;
    }

    /**
     * @return the brh_code
     */
    public String getBrh_code() {
        return brh_code;
    }

    /**
     * @param brh_code the brh_code to set
     */
    public void setBrh_code(String brh_code) {
        this.brh_code = brh_code;
    }

    /**
     * @return the brh_nm
     */
    public String getBrh_nm() {
        return brh_nm;
    }

    /**
     * @param brh_nm the brh_nm to set
     */
    public void setBrh_nm(String brh_nm) {
        this.brh_nm = brh_nm;
    }

    /**
     * @return the mngr_email
     */
    public String getMngr_email() {
        return mngr_email;
    }

    /**
     * @param mngr_email the mngr_email to set
     */
    public void setMngr_email(String mngr_email) {
        this.mngr_email = mngr_email;
    }

    /**
     * @return the mngr_nm
     */
    public String getMngr_nm() {
        return mngr_nm;
    }

    /**
     * @param mngr_nm the mngr_nm to set
     */
    public void setMngr_nm(String mngr_nm) {
        this.mngr_nm = mngr_nm;
    }

    /**
     * @return the tel_no
     */
    public String getTel_no() {
        return tel_no;
    }

    /**
     * @param tel_no the tel_no to set
     */
    public void setTel_no(String tel_no) {
        this.tel_no = tel_no;
    }

    /**
     * @return the addr1
     */
    public String getAddr1() {
        return addr1;
    }

    /**
     * @param addr1 the addr1 to set
     */
    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    /**
     * @return the addr2
     */
    public String getAddr2() {
        return addr2;
    }

    /**
     * @param addr2 the addr2 to set
     */
    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }

    /**
     * @return the dtl_adrs
     */
    public String getDtl_adrs() {
        return dtl_adrs;
    }

    /**
     * @param dtl_adrs the dtl_adrs to set
     */
    public void setDtl_adrs(String dtl_adrs) {
        this.dtl_adrs = dtl_adrs;
    }

    /**
     * @return the use_yn
     */
    public String getUse_yn() {
        return use_yn;
    }

    /**
     * @param use_yn the use_yn to set
     */
    public void setUse_yn(String use_yn) {
        this.use_yn = use_yn;
    }

    /**
     * @return the etc
     */
    public String getEtc() {
        return etc;
    }

    /**
     * @param etc the etc to set
     */
    public void setEtc(String etc) {
        this.etc = etc;
    }

    /**
     * @return the reg_email
     */
    public String getReg_email() {
        return reg_email;
    }

    /**
     * @param reg_email the reg_email to set
     */
    public void setReg_email(String reg_email) {
        this.reg_email = reg_email;
    }

    /**
     * @return the reg_dt
     */
    public String getReg_dt() {
        return reg_dt;
    }

    /**
     * @param reg_dt the reg_dt to set
     */
    public void setReg_dt(String reg_dt) {
        this.reg_dt = reg_dt;
    }

    /**
     * @return the reg_ip
     */
    public String getReg_ip() {
        return reg_ip;
    }

    /**
     * @param reg_ip the reg_ip to set
     */
    public void setReg_ip(String reg_ip) {
        this.reg_ip = reg_ip;
    }

    /**
     * @return the upt_email
     */
    public String getUpt_email() {
        return upt_email;
    }

    /**
     * @param upt_email the upt_email to set
     */
    public void setUpt_email(String upt_email) {
        this.upt_email = upt_email;
    }

    /**
     * @return the upt_dt
     */
    public String getUpt_dt() {
        return upt_dt;
    }

    /**
     * @param upt_dt the upt_dt to set
     */
    public void setUpt_dt(String upt_dt) {
        this.upt_dt = upt_dt;
    }

    /**
     * @return the upt_ip
     */
    public String getUpt_ip() {
        return upt_ip;
    }

    /**
     * @param upt_ip the upt_ip to set
     */
    public void setUpt_ip(String upt_ip) {
        this.upt_ip = upt_ip;
    }

    /**
     * @return the brh_nm_en
     */
    public String getBrh_nm_en() {
        return brh_nm_en;
    }

    /**
     * @param brh_nm_en the brh_nm_en to set
     */
    public void setBrh_nm_en(String brh_nm_en) {
        this.brh_nm_en = brh_nm_en;
    }

    public List<AdminPlaceVO> getChgSelList() {
        return chgSelList;
    }

    public void setChgSelList(List<AdminPlaceVO> chgSelList) {
        this.chgSelList = chgSelList;
    }

    public String getAuth_level_cd() { return auth_level_cd; }

    public void setAuth_level_cd(String auth_level_cd) { this.auth_level_cd = auth_level_cd; }

}
