package com.bitkrx.config.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.bitkrx.config.logging.CmeCommonLogger;

public class CmeTagFilterRequestWrapper extends HttpServletRequestWrapper{
	 protected CmeCommonLogger log = new CmeCommonLogger(this.getClass());

    public CmeTagFilterRequestWrapper(HttpServletRequest request) {
        super(request);
        // TODO Auto-generated constructor stub
    }

    public String[] getParameterValues(String parameter) {
    	
    	//log.DebugLog(this.getClass().getName()+ " :: getParameterValues start");
    	
        String[] values = super.getParameterValues(parameter);

        if (values == null) {
            return null;
        }

        for (int i = 0; i < values.length; i++) {
            if (values[i] != null) {
                StringBuffer strBuff = new StringBuffer();
                for (int j = 0; j < values[i].length(); j++) {
                    char c = values[i].charAt(j);
                    switch (c) {
                        case '<':
                            strBuff.append("&lt;");
                            break;
                        case '>':
                            strBuff.append("&gt;");
                            break;
                        case '&':
                            strBuff.append("&amp;");
                            break;
                        case '"':
                            strBuff.append("&quot;");
                            break;
                        case '\'':
                            strBuff.append("&apos;");
                            break;
                        default:
                            strBuff.append(c);
                            break;
                    }
                }
                values[i] = strBuff.toString();
            } else {
                values[i] = null;
            }
        }
        //log.DebugLogMsg(values.toString());
        //log.DebugLogMsg(this.getClass().getName()+ " :: getParameterValues stop");
        //log.DebugLogLine(false);
        return values;
    }

    public String getParameter(String parameter) {
    	//log.DebugLogLine(true);
    	//log.DebugLogMsg(this.getClass().getName()+ " :: getParameter start");
        String value = super.getParameter(parameter);

        if (value == null) {
            return null;
        }

        StringBuffer strBuff = new StringBuffer();

        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            switch (c) {
                case '<':
                    strBuff.append("&lt;");
                    break;
                case '>':
                    strBuff.append("&gt;");
                    break;
                case '&':
                    strBuff.append("&amp;");
                    break;
                case '"':
                    strBuff.append("&quot;");
                    break;
                case '\'':
                    strBuff.append("&apos;");
                    break;
                default:
                    strBuff.append(c);
                    break;
            }
        }

        value = strBuff.toString();
        //log.DebugLogMsg(value);
        //log.DebugLogMsg(this.getClass().getName()+ " :: getParameter stop");
        //log.DebugLogLine(false);
        return value;
    }   
    
    
}
