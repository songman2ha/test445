package com.bitkrx.config.util;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntity;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;

import com.bitkrx.config.control.CmeDefaultExtendController;
import com.bitkrx.config.vo.SmsInfoVO;
import com.bitkrx.core.util.HttpComLib;
import com.google.gson.Gson;


public class ServerTrans extends CmeDefaultExtendController{
	
/*	public ServerTrans(){
	}*/
	
	private static ServerTrans serverTrans = null;
	
	public static ServerTrans getinstance(){
		synchronized(ServerTrans.class){
			if(serverTrans == null){
				serverTrans = new ServerTrans();
			}
			return serverTrans;
		}
	}	

	private class JsonWraper<T> {

		private <T> T createObject(Class<T> clazz)
				throws InstantiationException, IllegalAccessException {
			return clazz.newInstance();
		}

		public T getDTOfromJSON(InputStream source, Class<T> clazz) {
			T dto = null;
			try {
				dto = createObject(clazz);

				Gson gson = new Gson();
				Reader reader = new InputStreamReader(source);
				dto = gson.fromJson(reader, clazz);

			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return dto;
		}

	}	
	
	public resultVO PostResult(String url, final Map<String,String> param_map) {
		resultVO res = new resultVO();
		
		try {
			HttpPost httppost = new HttpPost(url);
			HttpParams httpParameters = new BasicHttpParams();
			
			int timeoutConnection = 5000;
			HttpConnectionParams.setConnectionTimeout(httpParameters,
					timeoutConnection);

			int timeoutSocket = 8000;
			HttpConnectionParams.setSoTimeout(httpParameters, timeoutSocket);			
			
			HttpClient httpclient = new DefaultHttpClient();
			MultipartEntity multipartEntity = new MultipartEntity();
			Iterator<String> itr = param_map.keySet().iterator();
			while(itr.hasNext()){
				String key = itr.next();
				//CommonUtil.A_Log("Key:"+key+"/val:"+param_map.get(key));
				multipartEntity.addPart(key, new StringBody(param_map.get(key), Charset.forName("UTF-8")));
			}

			httppost.setEntity(multipartEntity);
			HttpResponse response = httpclient.execute(httppost);
			HttpEntity resEntity = response.getEntity();

			try {
				Gson gson = new Gson();
				Reader reader = new InputStreamReader(resEntity.getContent());
				res = gson.fromJson(reader, resultVO.class);
			} catch (Exception e) {
				//CommonUtil.A_Log("ServerTran PostResult(String url, final Map<String,String> param_map)Error:"+e.getMessage());
			}			

		} catch (Exception e) {
			//CommonUtil.A_Log("FileUpload Error:"+e.getMessage());
		}
		return res;
	}

	public String BizSender(SmsInfoVO vo, HttpServletRequest request) throws Exception {

		String url = CmeConstant.HttpBizSender;
		debugLog(url);

		HttpLib httpUtil = new HttpLib();
		Map<String,Object> params = new HashMap<String,Object>();
		
		params.put("m_email", vo.getEmail_info());
		params.put("m_nm", vo.getName_info());
		params.put("m_mobile", vo.getMobile_info());
		params.put("m_memo1", vo.getEtc1());
		params.put("m_memo2", vo.getEtc2());
		params.put("m_memo3", vo.getEtc3());
		params.put("m_memo4", vo.getEtc4());		
		params.put("m_memo5", vo.getEtc5());		
		params.put("auth_key", vo.getAuth_key());
		params.put("biz_id", CmeConstant.BizId);
		
		String responseData = httpUtil.getPostData(url, params, request);		
		debugLog("MailSend retuenDATA::====================> Res : " + responseData);
		return responseData;
	}
	
}
