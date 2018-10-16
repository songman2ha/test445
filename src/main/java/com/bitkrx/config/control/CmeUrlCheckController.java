package com.bitkrx.config.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitkrx.config.service.IpCheckService;
import com.bitkrx.config.util.ComUtil;
import com.bitkrx.config.util.StringUtils;
import com.bitkrx.config.vo.CmeExceptionVO;
import com.bitkrx.config.vo.CmeIpInfoVO;



@Component
@Controller
public class CmeUrlCheckController extends CmeDefaultExtendController{

    @Autowired 
    IpCheckService ipCheckService;
        
    @RequestMapping(value = "/{urlId}/proc.go")
    public ModelAndView getSIASUrlReturn(@PathVariable("urlId") String urlId, Model model, 
                            HttpServletRequest request, 
                            HttpServletResponse response)throws Exception {
        
        ModelAndView mv = null;
                
        Map<String,Object> param_map = ComUtil.setParam(request, null);
        
        if(!ComUtil.isDmUrl(urlId)){
            mv = new ModelAndView();
            Map<String,String> resultMap = new HashMap<String,String>();
            resultMap.put("code", "-1");
            resultMap.put("codeMsg", "BAD ACCESS");
            
            mv.addAllObjects(resultMap);
            mv.setViewName("jsonView");
            return mv;
            
        }
        if(urlId.indexOf(".") < 0){
           log.DebugLog("============= 비정상적인 접근 ================"); 
        }
            
        //boolean urlPass = true; //스테이징에서는 무조건 true
        boolean urlPass = false; //스테이징에서는 무조건 true

        int chk = urlId.toLowerCase().indexOf("admin");
        if (chk > -1) {
			CmeIpInfoVO vo = new CmeIpInfoVO();
			List<CmeIpInfoVO> iplist;
			try {
				iplist = ipCheckService.getIpPassList(vo);
				
				String remoteIp = ComUtil.getRemoteIP(request);
				
				debugLog("remoteIp:"+remoteIp);
				String[] arRemoteip = remoteIp.split("\\.");
				
				for(int i=0; i < iplist.size(); i++){
					vo = iplist.get(i);
					String ipinfo = vo.getIpinfo();
					String[] arip = ipinfo.split("\\.");  
					try {
						if(arip[3].indexOf("*") > -1){
							remoteIp = arRemoteip[0]+arRemoteip[1]+arRemoteip[2];
							ipinfo = arip[0] + arip[1] + arip[2]; 
						}else{
							remoteIp = arRemoteip[0]+arRemoteip[1]+arRemoteip[2]+arRemoteip[3];
							ipinfo = arip[0] + arip[1] + arip[2] + arip[3];
						}
					} catch (Exception e) {
						mv = new ModelAndView();
						Map<String,String> resultMap = new HashMap<String,String>();
						resultMap.put("code", "-1");
						resultMap.put("codeMsg", "비정상적인 접근");
						
						mv.addAllObjects(resultMap);
						mv.setViewName("jsonView");  
						return mv;
					}
					
					if(ipinfo.equals(remoteIp)){
						urlPass = true;
						break;
					}
				}				
				
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
			if (!urlPass) {
				mv = new ModelAndView();
				Map<String,String> resultMap = new HashMap<String,String>();
				resultMap.put("code", "-1");
				resultMap.put("codeMsg", "비정상적인 접근");
				
				mv.addAllObjects(resultMap);
				mv.setViewName("jsonView");
				debugLog("urlPass:"+ urlPass);
				return mv;
			}
		}
        
        debugLog("urlPass:"+ urlPass);
        
        String[] urls = urlId.split("\\.");
        StringBuffer urlParse = new StringBuffer();

        for(int i=0; i < urls.length; i++){
            if(i < urls.length-1){
                urlParse.append(urls[i]);                   
            }
            if(i < urls.length-2){
                urlParse.append("/");
            }
        } 
        
        String urlHeader = "forward:/";
        
        if(urls[urls.length-1].equals("ds")){//jsp forward
            mv = new ModelAndView(urlParse.toString());
        }else if(urls[urls.length-1].equals("dp")){
        	
        	urlParse.append(".dm");
            //debugLog("urlParse:"+urlHeader+urlParse.toString());
            mv = new ModelAndView(urlHeader+urlParse.toString(), param_map);
        }
        
        return mv;
    }
    
    @RequestMapping(value="/cme_none.go")
    public ModelAndView rtnError(
                                    @ModelAttribute CmeExceptionVO vo,
                                    @RequestParam(value="errmsg", required=false) String exceptmsg,
                                    @RequestParam(value="title", required=false) String title,
                                    @RequestParam(value="msg", required=false) String message,
                                    ModelMap model,
                                    HttpServletRequest request, 
                                    HttpServletResponse response)throws Exception{
        ModelAndView mv = null;
        String _exceptmsg = "";
        String _title = "";
        String _message = "";
        
//        System.out.println("###/"+vo.getErrorStatusCode() + "####/"+ vo.getErrorMessageCode() + "###/"+vo.getErrorTitleCode());
        
        if(!"".equals(vo.getExmessage())){
            _exceptmsg = vo.getExmessage();
        }else{
            _exceptmsg = StringUtils.checkNull(exceptmsg); 
        }       
        
        if(!"".equals(vo.getErrorTitleCode())){
            _title = vo.getErrorTitleCode();
        }else{
            _title = StringUtils.checkNull(title);
        }
        
        if(!"".equals(vo.getErrorMessageCode())){
            _message = vo.getErrorMessageCode();
        }else{
            _message = StringUtils.checkNull(message);
        }
        
        
        model.addAttribute("exceptVO", vo);
			
		
		mv = new ModelAndView("/error/error_main");
		
        
        return mv;
    }
}
