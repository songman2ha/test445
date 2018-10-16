package com.bitkrx.config.util;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.document.AbstractJExcelView;

import com.bitkrx.config.logging.CmeCommonLogger;
import com.bitkrx.config.util.CmeConstant.ExcelConst;

import jxl.Cell;
import jxl.CellView;
import jxl.format.Alignment;
import jxl.format.BoldStyle;
import jxl.format.Colour;
import jxl.format.Pattern;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;

public class DmCustomExcelViewBind extends AbstractJExcelView{

	CmeCommonLogger log = new CmeCommonLogger(this.getClass());
	protected SessionUtil sUtil = SessionUtil.getinstance();
	
	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			WritableWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		Map<String,Object> excelData = (Map<String,Object>)model.get(ExcelConst.ExcelData);
		
		String FileName = StringUtils.checkNull(String.valueOf(excelData.get(ExcelConst.ExcelFileName)));
		String createFileNm = "";
		
		Colour columColor = Colour.WHITE;
		int cellWidth = 20;
		
		if(excelData.containsKey(ExcelConst.ExcelCellColor)){
			columColor = (Colour)excelData.get(ExcelConst.ExcelCellColor);
		}
		
		if(excelData.containsKey(ExcelConst.ExcelCellWidth)){
			cellWidth = (Integer)excelData.get(ExcelConst.ExcelCellWidth);
		}
		
		log.DebugLog("FileName:"+FileName);
		
		if(!"".equals(FileName)){
			createFileNm = createFileName(FileName);
			setFileNameToResponse(request, response, createFileNm);
		}else{
			FileName = ExcelConst.ExcelData;
		}
		
		WritableSheet sheet = workbook.createSheet(FileName, 0);
		//sheet = DmExcelUtil.getSheetTitle(sheet, FileName);
		
		//컬럼세팅
		LinkedHashMap<String,String> columList = null;
		if(excelData.containsKey(ExcelConst.ColumeNameList)){
			columList = (LinkedHashMap<String,String>)excelData.get(ExcelConst.ColumeNameList);
		}
		List<String> columeMethod = new ArrayList<String>(); 
		int cnt=0;
		if(columList !=null){
			Iterator<String> keys = columList.keySet().iterator();
			
			while (keys.hasNext()) {
				String columMethod = keys.next();
				columeMethod.add(columMethod);
				sheet.setColumnView(cnt, cellWidth);			
				Label columnData = DmExcelUtil.getFormatCell(cnt, 2, columList.get(columMethod), null, columColor, true, 12);
				sheet.addCell(columnData);
				cnt++;
			}
			
			String title = ComUtil.isNull(String.valueOf(excelData.get(ExcelConst.ExcelTitle)));
			if(!"".equals(title)){
				FileName = title;
			}
			sheet = DmExcelUtil.getSheetTitlehap(sheet, FileName, cnt-1);
			if(sUtil.GetSessionValue(request, "excelLan") != null && sUtil.GetSessionValue(request, "excelLan").equals("CN")){
				sheet = DmExcelUtil.getSheetDatePrintChinese(sheet, cnt-1, 1);
			}else{
				sheet = DmExcelUtil.getSheetDatePrint(sheet, cnt-1, 1);
			}
		}
		
		List<Object> objList = null; 
		if(excelData.containsKey(ExcelConst.CellDataList)){
			objList =	(List<Object>)excelData.get(ExcelConst.CellDataList);
			int row = 3;
			
			for(int i=0; i< objList.size(); i++){
				Object obj = objList.get(i);
				
				//필수 3열이상 필요하다. 
				//merge ==> 컬럼명:merge,컬럼명:gubun,컬럼명:시작하는 열 위치|합쳐질 열갯수|데이터,컬럼명:시작하는 열 위치|합쳐질 열갯수|데이터,.......
				int colSize = columeMethod.size();
				for(int j=0; j< colSize; j++){
					sheet.setColumnView(j, cellWidth);
					//merge 일경우
					if(j==0){
						
						String keyVal = getMethodValue(obj, columeMethod.get(j));
						if(j==0 && ExcelConst.MergeCell.equals(keyVal)){
							String gubun = getMethodValue(obj, columeMethod.get(1));
							String _keyVal = getMethodValue(obj, columeMethod.get(2));
							String[] arrKey = _keyVal.split("["+gubun+"]");
							int arrCnt = arrKey.length;
							for(int k=0; k<arrCnt; k++){
								//컬럼순번|레코드순번|데이터|가로정렬|폰트사이즈|
								String[] _arrKey = arrKey[k].split("\\|");
								int sCol = Integer.parseInt(_arrKey[0]);
								int eCol = Integer.parseInt(_arrKey[1]);
								String data = _arrKey[2];
								String alignment = _arrKey[3]; // param alignment    가로정렬           
								Alignment al = null;
								if("left".equals(alignment)){
									al = Alignment.LEFT;
								}else if("right".equals(alignment)){
									al = Alignment.RIGHT;
								}
								String wrap = _arrKey[4];
								int iWrap = 0;
								if("".endsWith(wrap)){
									iWrap = 10;
								}else {
									iWrap = Integer.parseInt(wrap);
								}
								
								Label celData = DmExcelUtil.getFormatCell(sCol, row, data, al, Colour.GRAY_25, true, iWrap);
								sheet.addCell(celData);	
								sheet.mergeCells(sCol, row, eCol, row);
							}
							//다음 row 이동
							break;
						}
					}
					
					Label celData = DmExcelUtil.getFormatCell(j, row, getMethodValue(obj, columeMethod.get(j)), null, null, true, 10);
					sheet.addCell(celData);	
					
				}
				
				row++;
			}
		}
	}
	
	@SuppressWarnings("unused")
	private static WritableCellFormat getCellFormat(Colour colour,
			Pattern pattern) throws WriteException {
		WritableFont cellFont = new WritableFont(WritableFont.ARIAL, 12, WritableFont.BOLD);
		
		WritableCellFormat cellFormat = new WritableCellFormat(cellFont);
		cellFormat.setBackground(colour, pattern);
		return cellFormat;
	}
	
	private String getMethodValue(Object obj, String methodNm)throws Exception{
		Method[] methods = obj.getClass().getMethods();
		String res = "";
		for(int i=0; i < methods.length; i++){
			String _methodName = methods[i].getName();
			String _methodHead = _methodName.substring(0,3);
			if("get".equals(_methodHead)){
				Method _method = obj.getClass().getMethod(
						_methodName, new Class[] {});
				
				if(_method.getReturnType() == java.lang.String.class){
					String strVal = (String)_method.invoke(obj,
							new Object[] {});
					strVal = StringUtils.checkNull(strVal);
					if(methodNm.equals(_methodName)){
						res = strVal;
						break;
					}

				}
				
			}
		}

		return res;
	}
	
	
	private void setFileNameToResponse(HttpServletRequest request,
			HttpServletResponse response, String fileName) {
		String userAgent = request.getHeader("User-Agent");
		if (userAgent.indexOf("MSIE 5.5") >= 0) {
			response.setContentType("doesn/matter");
			response.setHeader("Content-Disposition", "filename=\"" + fileName
					+ "\"");
		} else {
			response.setHeader("Content-Disposition", "attachment; filename=\""	+ fileName + "\"");
		}
		response.setHeader("Content-Transfer-Encoding", "binary"); 

	}

	private String createFileName(String fname) {
		SimpleDateFormat fileFormat = new SimpleDateFormat("yyyyMMdd_HHmmss");
		String rs = new StringBuilder(fname)
					.append("_")
					.append(fileFormat.format(new Date()))
					.append(".xls")
					.toString(); 
		
		try {
			rs = new String(rs.getBytes("euc-kr"), "8859_1");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	
}


