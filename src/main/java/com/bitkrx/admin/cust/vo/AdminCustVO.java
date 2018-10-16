/**
 * 씨엠이 소프트 자체 프로젝트 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)씨엠이소프트
 * CopyRight 씨엠이소프트 - 2017
 */
package com.bitkrx.admin.cust.vo;

import com.bitkrx.config.vo.CmeExtendListVO;

import java.util.ArrayList;
import java.util.List;

/**
 * @프로젝트명 : com.bitkrx.admin
 * @패키지 : com.bitkrx.admin.cust.vo
 * @클래스명 : com.bitkrx.admin
 * @작성자 : (주)씨엠이소프트 박상웅
 * @작성일 : 2017. 11. 23.
 */
public class AdminCustVO extends CmeExtendListVO {

    /**
     *
     */
    private static final long serialVersionUID = -2158423623087180142L;

    private String user_email = "";
    private String user_pwd = "";
    private String user_nm = "";
    private String user_mobile = "";
    private String user_phone = "";
    private String post_cd = "";
    private String adrs = "";
    private String dtl_adrs = "";
    private String sign_dt = "";
    private String reg_dt = "";
    private String reg_email = "";
    private String upt_dt = "";
    private String upt_email = "";
    private String use_yn = "";
    private String sign_ip = "";
    private String birth_day = "";
    private String pwd_chg_yn = "";
    private String tmp_pwd = "";
    private String reg_ip = "";
    private String push_code = "";
    private String upt_ip = "";
    private String nick_nm = "";
    private String push_token = "";
    private String gender = "";
    private String country_cd = "";
    private String auth = "";
    private String lang_cd = "";

    private String mode = "";
    private String send_title = "";
    private String msg = "";

    private String brh_code = "";
    private String brh_nm = "";
    private String rcmd_code = "";
    private String rcmd_nm = "";
    private String lock_yn = "";
    private String sh_have_yn = "";

    //api 통신파라메터
    private String param3 = "";
    private String userEmail = "";

    private String bank_cd = "";
    private String bank_acc_no = "";
    private String bank_nm = "";
    private String accnt_nm = "";
    private String trn_id = "";
    private String dps_amt = "";

    private String email_cert_yn = "";
    private String sms_cert_yn = "";
    private String cert_yn = "";
    private String otp_serial = "";

    private String blck_yn = "";
    private String rel_yn = "";
    private String tab_no = "";

    private String insY = "";
    private List RESULT;

    //국가코드 , 지점코드
    private String natn_code = "";
    private String natn_nm = "";

    //보조이메일
    private String sub_user_email = "";

    private String country_nm = "";

    //KYC인증
    private String kyc_cert_yn = "";
    private String kyc_upt_email = "";
    private String kyc_upt_dt = "";
    private String kyc_rsn = "";
    private String file_name1 = "";
    private String file_name2 = "";

    private String send_mth_cd = "";
    private String status = "";
    private String send_dt = "";
    private String in_dt = "";
    private String req_dt = "";
    private String cret_dt = "";
    private String bank_acc_num = "";
    private String card_req_prc = "";
    private String sum_up = "";
    private String card_no = "";
    private String in_mth_cd = "";
    private String set_send_mth_cd = "";
    private String set_status = "";
    private String username = "";
    private String usermb = "";
    private String userMail = "";

    //선불카드 등록

    private String postCd = "";
    private String dtlAdrs = "";
    private String sendMthCd = "";



    private String reqType = "";
    //선불카드 정보

    private String cardActCode = "";
    private String card_act_code = "";
    private String act_no = "";
    private String cry_code = "";
    private String orderid = "";
    private String virtualaccount = "";

    //인증자료제출

    private String cert_code = "";
    private String file_name3 = "";
    private String cert_msg = "";
    private String cert_dt = "";
    private String cert_grade = "";
    private String cert_sub_grade = "";
    private String cert_fail_msg = "";
    private List<AdminCustVO> chgCertList = new ArrayList<AdminCustVO>();
    private String cert_sgrade_cd = "";
    private String cert_sgrade_nm = "";
    private String cert_grade_cd = "";
    private String cert_grade_nm = "";
    private String req_type = "";
    //180608

    private String user_ctl_dt = "";
    private String user_ctl_code = "";
    private String ctl_msg = "";
    private String schWrd = "";
    private String seq ="";
    private String CompareCode="";
    private String set_post_cd="";

    private String set_adrs ="";
    private String set_dtl_adrs ="";

    private String tid = "";
    private String cardname = "";
    private String cardnumber = "";
    private String amount = "";


    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }



    public String getCardname() {
        return cardname;
    }

    public void setCardname(String cardname) {
        this.cardname = cardname;
    }

    public String getCardnumber() {
        return cardnumber;
    }

    public void setCardnumber(String cardnumber) {
        this.cardnumber = cardnumber;
    }




    public String getVirtualaccount() {
        return virtualaccount;
    }

    public void setVirtualaccount(String virtualaccount) {
        this.virtualaccount = virtualaccount;
    }


    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public String getSet_post_cd() {
        return set_post_cd;
    }

    public void setSet_post_cd(String set_post_cd) {
        this.set_post_cd = set_post_cd;
    }

    public String getSet_adrs() {
        return set_adrs;
    }

    public void setSet_adrs(String set_adrs) {
        this.set_adrs = set_adrs;
    }

    public String getSet_dtl_adrs() {
        return set_dtl_adrs;
    }

    public void setSet_dtl_adrs(String set_dtl_adrs) {
        this.set_dtl_adrs = set_dtl_adrs;
    }

    public String getCompareCode() {
        return CompareCode;
    }

    public void setCompareCode(String compareCode) {
        CompareCode = compareCode;
    }

    public String getSeq() {
        return seq;
    }

    public void setSeq(String seq) {
        this.seq = seq;
    }

    public String getUserMail() {return userMail;}

    public void setUserMail(String userMail) {this.userMail = userMail;}

    public String getUser_ctl_dt() {
        return user_ctl_dt;
    }

    public void setUser_ctl_dt(String user_ctl_dt) {
        this.user_ctl_dt = user_ctl_dt;
    }

    public String getUser_ctl_code() {
        return user_ctl_code;
    }

    public void setUser_ctl_code(String user_ctl_code) {
        this.user_ctl_code = user_ctl_code;
    }

    public String getCtl_msg() {
        return ctl_msg;
    }

    public void setCtl_msg(String ctl_msg) {
        this.ctl_msg = ctl_msg;
    }

    public String getSchWrd() {
        return schWrd;
    }

    public void setSchWrd(String schWrd) {
        this.schWrd = schWrd;
    }

    public String getReq_type() {
        return req_type;
    }

    public void setReq_type(String req_type) {
        this.req_type = req_type;
    }

    public String getCardActCode() {
        return cardActCode;
    }

    public void setCardActCode(String cardActCode) {
        this.cardActCode = cardActCode;
    }

    public String getUser_email() {
        return user_email;
    }

    public void setUser_email(String user_email) {
        this.user_email = user_email;
    }

    public String getUser_pwd() {
        return user_pwd;
    }

    public void setUser_pwd(String user_pwd) {
        this.user_pwd = user_pwd;
    }

    public String getUser_nm() {
        return user_nm;
    }

    public void setUser_nm(String user_nm) {
        this.user_nm = user_nm;
    }

    public String getUser_mobile() {
        return user_mobile;
    }

    public void setUser_mobile(String user_mobile) {
        this.user_mobile = user_mobile;
    }

    public String getUser_phone() {
        return user_phone;
    }

    public void setUser_phone(String user_phone) {
        this.user_phone = user_phone;
    }

    public String getPost_cd() {
        return post_cd;
    }

    public void setPost_cd(String post_cd) {
        this.post_cd = post_cd;
    }

    public String getAdrs() {
        return adrs;
    }

    public void setAdrs(String adrs) {
        this.adrs = adrs;
    }

    public String getDtl_adrs() {
        return dtl_adrs;
    }

    public void setDtl_adrs(String dtl_adrs) {
        this.dtl_adrs = dtl_adrs;
    }

    public String getSign_dt() {
        return sign_dt;
    }

    public void setSign_dt(String sign_dt) {
        this.sign_dt = sign_dt;
    }

    public String getReg_dt() {
        return reg_dt;
    }

    public void setReg_dt(String reg_dt) {
        this.reg_dt = reg_dt;
    }

    public String getReg_email() {
        return reg_email;
    }

    public void setReg_email(String reg_email) {
        this.reg_email = reg_email;
    }

    public String getUpt_dt() {
        return upt_dt;
    }

    public void setUpt_dt(String upt_dt) {
        this.upt_dt = upt_dt;
    }

    public String getUpt_email() {
        return upt_email;
    }

    public void setUpt_email(String upt_email) {
        this.upt_email = upt_email;
    }

    public String getUse_yn() {
        return use_yn;
    }

    public void setUse_yn(String use_yn) {
        this.use_yn = use_yn;
    }

    public String getSign_ip() {
        return sign_ip;
    }

    public void setSign_ip(String sign_ip) {
        this.sign_ip = sign_ip;
    }

    public String getBirth_day() {
        return birth_day;
    }

    public void setBirth_day(String birth_day) {
        this.birth_day = birth_day;
    }

    public String getPwd_chg_yn() {
        return pwd_chg_yn;
    }

    public void setPwd_chg_yn(String pwd_chg_yn) {
        this.pwd_chg_yn = pwd_chg_yn;
    }

    public String getTmp_pwd() {
        return tmp_pwd;
    }

    public void setTmp_pwd(String tmp_pwd) {
        this.tmp_pwd = tmp_pwd;
    }

    public String getReg_ip() {
        return reg_ip;
    }

    public void setReg_ip(String reg_ip) {
        this.reg_ip = reg_ip;
    }

    public String getPush_code() {
        return push_code;
    }

    public void setPush_code(String push_code) {
        this.push_code = push_code;
    }

    public String getUpt_ip() {
        return upt_ip;
    }

    public void setUpt_ip(String upt_ip) {
        this.upt_ip = upt_ip;
    }

    public String getNick_nm() {
        return nick_nm;
    }

    public void setNick_nm(String nick_nm) {
        this.nick_nm = nick_nm;
    }

    public String getPush_token() {
        return push_token;
    }

    public void setPush_token(String push_token) {
        this.push_token = push_token;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCountry_cd() {
        return country_cd;
    }

    public void setCountry_cd(String country_cd) {
        this.country_cd = country_cd;
    }

    public String getAuth() {
        return auth;
    }

    public void setAuth(String auth) {
        this.auth = auth;
    }

    public String getLang_cd() {
        return lang_cd;
    }

    public void setLang_cd(String lang_cd) {
        this.lang_cd = lang_cd;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public String getSend_title() {
        return send_title;
    }

    public void setSend_title(String send_title) {
        this.send_title = send_title;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getBrh_code() {
        return brh_code;
    }

    public void setBrh_code(String brh_code) {
        this.brh_code = brh_code;
    }

    public String getBrh_nm() {
        return brh_nm;
    }

    public void setBrh_nm(String brh_nm) {
        this.brh_nm = brh_nm;
    }

    public String getRcmd_code() {
        return rcmd_code;
    }

    public void setRcmd_code(String rcmd_code) {
        this.rcmd_code = rcmd_code;
    }

    public String getRcmd_nm() {
        return rcmd_nm;
    }

    public void setRcmd_nm(String rcmd_nm) {
        this.rcmd_nm = rcmd_nm;
    }

    public String getLock_yn() {
        return lock_yn;
    }

    public void setLock_yn(String lock_yn) {
        this.lock_yn = lock_yn;
    }

    public String getSh_have_yn() {
        return sh_have_yn;
    }

    public void setSh_have_yn(String sh_have_yn) {
        this.sh_have_yn = sh_have_yn;
    }

    public String getParam3() {
        return param3;
    }

    public void setParam3(String param3) {
        this.param3 = param3;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getBank_cd() {
        return bank_cd;
    }

    public void setBank_cd(String bank_cd) {
        this.bank_cd = bank_cd;
    }

    public String getBank_acc_no() {
        return bank_acc_no;
    }

    public void setBank_acc_no(String bank_acc_no) {
        this.bank_acc_no = bank_acc_no;
    }

    public String getBank_nm() {
        return bank_nm;
    }

    public void setBank_nm(String bank_nm) {
        this.bank_nm = bank_nm;
    }

    public String getAccnt_nm() {
        return accnt_nm;
    }

    public void setAccnt_nm(String accnt_nm) {
        this.accnt_nm = accnt_nm;
    }

    public String getTrn_id() {
        return trn_id;
    }

    public void setTrn_id(String trn_id) {
        this.trn_id = trn_id;
    }

    public String getDps_amt() {
        return dps_amt;
    }

    public void setDps_amt(String dps_amt) {
        this.dps_amt = dps_amt;
    }

    public String getEmail_cert_yn() {
        return email_cert_yn;
    }

    public void setEmail_cert_yn(String email_cert_yn) {
        this.email_cert_yn = email_cert_yn;
    }

    public String getSms_cert_yn() {
        return sms_cert_yn;
    }

    public void setSms_cert_yn(String sms_cert_yn) {
        this.sms_cert_yn = sms_cert_yn;
    }

    public String getCert_yn() {
        return cert_yn;
    }

    public void setCert_yn(String cert_yn) {
        this.cert_yn = cert_yn;
    }

    public String getOtp_serial() {
        return otp_serial;
    }

    public void setOtp_serial(String otp_serial) {
        this.otp_serial = otp_serial;
    }

    public String getBlck_yn() {
        return blck_yn;
    }

    public void setBlck_yn(String blck_yn) {
        this.blck_yn = blck_yn;
    }

    public String getRel_yn() {
        return rel_yn;
    }

    public void setRel_yn(String rel_yn) {
        this.rel_yn = rel_yn;
    }

    public String getTab_no() {
        return tab_no;
    }

    public void setTab_no(String tab_no) {
        this.tab_no = tab_no;
    }

    public String getInsY() {
        return insY;
    }

    public void setInsY(String insY) {
        this.insY = insY;
    }

    public List getRESULT() {
        return RESULT;
    }

    public void setRESULT(List RESULT) {
        this.RESULT = RESULT;
    }

    public String getNatn_code() {
        return natn_code;
    }

    public void setNatn_code(String natn_code) {
        this.natn_code = natn_code;
    }

    public String getNatn_nm() {
        return natn_nm;
    }

    public void setNatn_nm(String natn_nm) {
        this.natn_nm = natn_nm;
    }

    public String getSub_user_email() {
        return sub_user_email;
    }

    public void setSub_user_email(String sub_user_email) {
        this.sub_user_email = sub_user_email;
    }

    public String getCountry_nm() {
        return country_nm;
    }

    public void setCountry_nm(String country_nm) {
        this.country_nm = country_nm;
    }

    public String getKyc_cert_yn() {
        return kyc_cert_yn;
    }

    public void setKyc_cert_yn(String kyc_cert_yn) {
        this.kyc_cert_yn = kyc_cert_yn;
    }

    public String getKyc_upt_email() {
        return kyc_upt_email;
    }

    public void setKyc_upt_email(String kyc_upt_email) {
        this.kyc_upt_email = kyc_upt_email;
    }

    public String getKyc_upt_dt() {
        return kyc_upt_dt;
    }

    public void setKyc_upt_dt(String kyc_upt_dt) {
        this.kyc_upt_dt = kyc_upt_dt;
    }

    public String getKyc_rsn() {
        return kyc_rsn;
    }

    public void setKyc_rsn(String kyc_rsn) {
        this.kyc_rsn = kyc_rsn;
    }

    public String getFile_name1() {
        return file_name1;
    }

    public void setFile_name1(String file_name1) {
        this.file_name1 = file_name1;
    }

    public String getFile_name2() {
        return file_name2;
    }

    public void setFile_name2(String file_name2) {
        this.file_name2 = file_name2;
    }

    public String getSend_mth_cd() {
        return send_mth_cd;
    }

    public void setSend_mth_cd(String send_mth_cd) {
        this.send_mth_cd = send_mth_cd;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getSend_dt() {
        return send_dt;
    }

    public void setSend_dt(String send_dt) {
        this.send_dt = send_dt;
    }

    public String getIn_dt() {
        return in_dt;
    }

    public void setIn_dt(String in_dt) {
        this.in_dt = in_dt;
    }

    public String getReq_dt() {
        return req_dt;
    }

    public void setReq_dt(String req_dt) {
        this.req_dt = req_dt;
    }

    public String getCret_dt() {
        return cret_dt;
    }

    public void setCret_dt(String cret_dt) {
        this.cret_dt = cret_dt;
    }

    public String getBank_acc_num() {
        return bank_acc_num;
    }

    public void setBank_acc_num(String bank_acc_num) {
        this.bank_acc_num = bank_acc_num;
    }

    public String getCard_req_prc() {
        return card_req_prc;
    }

    public void setCard_req_prc(String card_req_prc) {
        this.card_req_prc = card_req_prc;
    }

    public String getSum_up() {
        return sum_up;
    }

    public void setSum_up(String sum_up) {
        this.sum_up = sum_up;
    }

    public String getCard_no() {
        return card_no;
    }

    public void setCard_no(String card_no) {
        this.card_no = card_no;
    }

    public String getIn_mth_cd() {
        return in_mth_cd;
    }

    public void setIn_mth_cd(String in_mth_cd) {
        this.in_mth_cd = in_mth_cd;
    }

    public String getSet_send_mth_cd() {
        return set_send_mth_cd;
    }

    public void setSet_send_mth_cd(String set_send_mth_cd) {
        this.set_send_mth_cd = set_send_mth_cd;
    }

    public String getSet_status() {
        return set_status;
    }

    public void setSet_status(String set_status) {
        this.set_status = set_status;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsermb() {
        return usermb;
    }

    public void setUsermb(String usermb) {
        this.usermb = usermb;
    }

    public String getPostCd() {
        return postCd;
    }

    public void setPostCd(String postCd) {
        this.postCd = postCd;
    }

    public String getDtlAdrs() {
        return dtlAdrs;
    }

    public void setDtlAdrs(String dtlAdrs) {
        this.dtlAdrs = dtlAdrs;
    }

    public String getSendMthCd() {
        return sendMthCd;
    }

    public void setSendMthCd(String sendMthCd) {
        this.sendMthCd = sendMthCd;
    }

    public String getReqType() {
        return reqType;
    }

    public void setReqType(String reqType) {
        this.reqType = reqType;
    }

    public String getCard_act_code() {
        return card_act_code;
    }

    public void setCard_act_code(String card_act_code) {
        this.card_act_code = card_act_code;
    }

    public String getAct_no() {
        return act_no;
    }

    public void setAct_no(String act_no) {
        this.act_no = act_no;
    }

    public String getCry_code() {
        return cry_code;
    }

    public void setCry_code(String cry_code) {
        this.cry_code = cry_code;
    }

    public String getCert_code() {
        return cert_code;
    }

    public void setCert_code(String cert_code) {
        this.cert_code = cert_code;
    }

    public String getFile_name3() {
        return file_name3;
    }

    public void setFile_name3(String file_name3) {
        this.file_name3 = file_name3;
    }

    public String getCert_msg() {
        return cert_msg;
    }

    public void setCert_msg(String cert_msg) {
        this.cert_msg = cert_msg;
    }

    public String getCert_dt() {
        return cert_dt;
    }

    public void setCert_dt(String cert_dt) {
        this.cert_dt = cert_dt;
    }

    public String getCert_grade() {
        return cert_grade;
    }

    public void setCert_grade(String cert_grade) {
        this.cert_grade = cert_grade;
    }

    public String getCert_sub_grade() {
        return cert_sub_grade;
    }

    public void setCert_sub_grade(String cert_sub_grade) {
        this.cert_sub_grade = cert_sub_grade;
    }

    public String getCert_fail_msg() {
        return cert_fail_msg;
    }

    public void setCert_fail_msg(String cert_fail_msg) {
        this.cert_fail_msg = cert_fail_msg;
    }

    public List<AdminCustVO> getChgCertList() {
        return chgCertList;
    }

    public void setChgCertList(List<AdminCustVO> chgCertList) {
        this.chgCertList = chgCertList;
    }

    public String getCert_sgrade_cd() {
        return cert_sgrade_cd;
    }

    public void setCert_sgrade_cd(String cert_sgrade_cd) {
        this.cert_sgrade_cd = cert_sgrade_cd;
    }

    public String getCert_sgrade_nm() {
        return cert_sgrade_nm;
    }

    public void setCert_sgrade_nm(String cert_sgrade_nm) {
        this.cert_sgrade_nm = cert_sgrade_nm;
    }

    public String getCert_grade_cd() {
        return cert_grade_cd;
    }

    public void setCert_grade_cd(String cert_grade_cd) {
        this.cert_grade_cd = cert_grade_cd;
    }

    public String getCert_grade_nm() {
        return cert_grade_nm;
    }

    public void setCert_grade_nm(String cert_grade_nm) {
        this.cert_grade_nm = cert_grade_nm;
    }
}