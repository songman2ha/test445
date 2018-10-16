package com.bitkrx.config.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;


/**
 * @프로젝트명	: com.bitkrx.web
 * @패키지    	: com.bitkrx.config.vo
 * @클래스명  	: com.bitkrx.web
 * @작성자		:  (주)씨엠이소프트 임승연
 * @작성일		: 2017. 11. 8.
 */
public class MailInfoVO  implements Serializable{
    
	
    /**
	 * 
	 */
	private static final long serialVersionUID = -1645974012541711279L;

	private String mailHost;
    
    private int mailPort;
    
    private String mailProtocol;
    
    private String mailUser;
    
    private String mailPass;
    
    private String mailEncoding = "UTF-8";
    
    private String mailTemplateForm;
    
    private String mailFrom;
    
    private String mailTo;
 
    private String mailCc;
 
    private String mailBcc;
 
    private String mailSubject;
 
    private String mailContent;
 
    private String contentType;
 
    private String ctnts_code; // 메일 컨텐츠 코드
    
    private String reg_ip;
    
    
    
    public String getCtnts_code() {
		return ctnts_code;
	}

	public void setCtnts_code(String ctnts_code) {
		this.ctnts_code = ctnts_code;
	}

	public String getReg_ip() {
		return reg_ip;
	}

	public void setReg_ip(String reg_ip) {
		this.reg_ip = reg_ip;
	}

	private List < Object > attachments;
 
    private Map < String, Object > model;
 
    public MailInfoVO() {
        contentType = "text/plain";
    }
 
    public String getContentType() {
        return contentType;
    }
 
    public void setContentType(String contentType) {
        this.contentType = contentType;
    }
 
    public String getMailBcc() {
        return mailBcc;
    }
 
    public void setMailBcc(String mailBcc) {
        this.mailBcc = mailBcc;
    }
 
    public String getMailCc() {
        return mailCc;
    }
 
    public void setMailCc(String mailCc) {
        this.mailCc = mailCc;
    }
 
    public String getMailFrom() {
        return mailFrom;
    }
 
    public void setMailFrom(String mailFrom) {
        this.mailFrom = mailFrom;
    }
 
    public String getMailSubject() {
        return mailSubject;
    }
 
    public void setMailSubject(String mailSubject) {
        this.mailSubject = mailSubject;
    }
 
    public String getMailTo() {
        return mailTo;
    }
 
    public void setMailTo(String mailTo) {
        this.mailTo = mailTo;
    }
 
    public Date getMailSendDate() {
        return new Date();
    }
 
    public String getMailContent() {
        return mailContent;
    }
 
    public void setMailContent(String mailContent) {
        this.mailContent = mailContent;
    }
 
    public List < Object > getAttachments() {
        return attachments;
    }
 
    public void setAttachments(List < Object > attachments) {
        this.attachments = attachments;
    }
 
    public Map < String, Object > getModel() {
        return model;
    }
 
    public void setModel(Map < String, Object > model) {
        this.model = model;
    }

    public String getMailHost() {
        return mailHost;
    }

    public void setMailHost(String mailHost) {
        this.mailHost = mailHost;
    }

    public int getMailPort() {
        return mailPort;
    }

    public void setMailPort(int mailPort) {
        this.mailPort = mailPort;
    }

    public String getMailProtocol() {
        return mailProtocol;
    }

    public void setMailProtocol(String mailProtocol) {
        this.mailProtocol = mailProtocol;
    }

    public String getMailUser() {
        return mailUser;
    }

    public void setMailUser(String mailUser) {
        this.mailUser = mailUser;
    }

    public String getMailPass() {
        return mailPass;
    }

    public void setMailPass(String mailPass) {
        this.mailPass = mailPass;
    }

    public String getMailEncoding() {
        return mailEncoding;
    }

    public void setMailEncoding(String mailEncoding) {
        this.mailEncoding = mailEncoding;
    }

    public String getMailTemplateForm() {
        return mailTemplateForm;
    }

    public void setMailTemplateForm(String mailTemplateForm) {
        this.mailTemplateForm = mailTemplateForm;
    }
    
}
