<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page isErrorPage="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 	String msg = "";
	request.getParameter("type");
	try{
		msg = "400:"+exception.getMessage();	
	}catch(Exception e){
		msg = "400:None Exception Message";
	} 
	System.out.println("msg ::"+request.getParameter("type"));

	request.getRequestDispatcher("/cme_none.dp/proc.go").forward(request,response);	
%>