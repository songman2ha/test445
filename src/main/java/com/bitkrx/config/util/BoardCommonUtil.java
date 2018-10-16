package com.bitkrx.config.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class BoardCommonUtil {

	/**
	 * @Method Name  : getSrcExp
	 * @작성일   : 2017. 3. 09. 
	 * @작성자   : cjk
	 * @변경이력  :
	 * @Method 설명 : 이미지 태그가 blob:http://~/ 으로 자체 변경 된 부분을 수정
	 * @param str
	 * @param code
	 * @return
	 */
	public static String getSrcExp( String str, String code, String fileIdSn) {
		 
		Map<String,String> map = new HashMap<String,String>();
		if(!"".equals(fileIdSn)) {
			String[] arrStr = fileIdSn.split(",");
			for(String _str : arrStr) {
				String[] _arrStr = _str.split(":");
				map.put(_arrStr[0], _arrStr[1]);
			}
		}
		 Pattern pattern4 = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
		 Pattern pattern1 = Pattern.compile("id=[\"']?([^>\"']+)[\"']"); 
		 Pattern pattern = Pattern.compile("[\\s]src=[\"']?([^>\"']+)[\"']"); 
		 
	     Matcher matcher4 = pattern4.matcher(str);
	     
	     
	     StringBuffer _replacedString = new StringBuffer();
	     StringBuffer replacedString = new StringBuffer();

	     while(matcher4.find()){ 
	    	 String strMatcher4 = matcher4.group();
	    	 
	 	     Matcher matcher1 = pattern1.matcher(strMatcher4);
	 	     
	 	     String fileId = "";
	 	     if(matcher1.find()) {
	 	    	fileId = matcher1.group(1);
	 	     }
	    	 
	    	 Matcher matcher = pattern.matcher(strMatcher4);
	    	 String matcherStr = "";
	    	 if(matcher.find()) {
	    		 matcherStr = matcher4.group(1);
	    	 }
	    	 
	    	 if(matcherStr.indexOf("blob") > -1 ) {
	    		 int matchcnt = Integer.parseInt(map.get(fileId));
	    		 
	    		 matcher.appendReplacement(_replacedString, "src=\"/common.file.getImageView.dp/proc.go?atchFileId="+code+"&fileSn="+Integer.toString(matchcnt)+"\">");
	    		 
	    		 matcher4.appendReplacement(replacedString, _replacedString.toString());
	    		 
	    		 _replacedString.setLength(0);
	    	 }
	     }
	     
	     matcher4.appendTail(replacedString);
	     
	     return replacedString.toString();
	}
	
	/**
	 * @Method Name  : getIdExp
	 * @작성일   : 2017. 3. 09. 
	 * @작성자   : cjk
	 * @변경이력  :
	 * @Method 설명 : 게시글 중 생성된 태그에서 ID 만 가져와서 file 업로드 비교를 위한 ID 검출 정규식
	 * @param str	
	 * @return
	 */
	public static String getIdExp(String str) {
		String chkFileName = "";
		
		Pattern pattern1 = Pattern.compile("<img[^>]*id=[\"']?([^>\"']+)[\"']?[^>]*>");
	    Matcher matcher1 = pattern1.matcher(str);
	     
	    while(matcher1.find()){
	    	if ("".equals(chkFileName)) {
	    		chkFileName = matcher1.group(1);
	    	} else {
	    		chkFileName = chkFileName +","+ matcher1.group(1);
	    	}
	    }
	    
	    return chkFileName;
	}
	
	public static List<String> fileIdCompare(String asis, String tobe) {
		List<String> asisChkFileName = new ArrayList<String>();
		List<String> tobeChkFileName = new ArrayList<String>();
		
		List<String> atchFileIdList = new ArrayList<String>();
	    List<String> fileSnList = new ArrayList<String>();
	    
	    Pattern pattern4 = Pattern.compile("<img[^>]*atchFileId=[\"']?([^>\"']+)[&]");
	    Matcher matcher4 = pattern4.matcher(asis);
	    
	    while(matcher4.find()){
	    	atchFileIdList.add(matcher4.group(1));
	    }
	    
	    Pattern pattern5 = Pattern.compile("<img[^>]*fileSn=[\"']?([^>\"']+)[\"']?[^>]*>");
	    Matcher matcher5 = pattern5.matcher(asis);
	    
	    while(matcher5.find()){
	    	fileSnList.add(matcher5.group(1));
	    }
		
		Pattern pattern1 = Pattern.compile("<img[^>]*id=[\"']?([^>\"']+)[\"']?[^>]*>");
	    Matcher matcher1 = pattern1.matcher(asis);
	    
	    while(matcher1.find()){
	    	asisChkFileName.add(matcher1.group(1));
	    }
	    
	    Matcher matcher2 = pattern1.matcher(tobe);
	  
	    while(matcher2.find()){
	    	tobeChkFileName.add(matcher2.group(1));
	    }
	    
	    List<String> finalList = new ArrayList<String>();
	    
	    if (asisChkFileName.size() >= tobeChkFileName.size()) {
	    	Iterator<String> asisiter = asisChkFileName.iterator();
	    	int matchCnt = 0;
	    	while (asisiter.hasNext()) {
	    		boolean isMatch = false;
	    		
	    		//a b c
	    		String s = asisiter.next();
	    		
	    		for(String s1 : tobeChkFileName) {
	    			if (s.equals(s1)) { //a c
	    				isMatch = true;
	    				asisiter.remove();
		    		} 
	    		}
	    		
	    		if ( !isMatch ) {
	    			finalList.add(atchFileIdList.get(matchCnt)+","+fileSnList.get(matchCnt));
	    		}
	    		
	    		matchCnt++;
	    	}
	    }
	  
	    return finalList;
	}
	
}
