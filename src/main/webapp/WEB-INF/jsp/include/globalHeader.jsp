<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="today" class="java.util.Date" />

<fmt:formatDate value="${today}" var="CurDate"  type="DATE" pattern="yyyyMMdd"/>
<fmt:formatDate value="${today}" var="CurDate1" type="DATE" pattern="yyyy-MM-dd"/>
<fmt:formatDate value="${today}" var="CurDate2" type="DATE" pattern="yyyy/MM/dd"/>
<fmt:formatDate value="${today}" var="CurDate3" type="DATE" pattern="yyyy.MM.dd"/>
<fmt:formatDate value="${today}" var="CurDate4"  type="DATE" pattern="yyyyMMddHHmmss"/>
<fmt:formatDate value="${today}" var="CurDate5"  type="DATE" pattern="yyyyMMddHHmm"/>
<fmt:formatDate value="${today}" var="CurDay"   type="DATE" pattern="dd"/>
<fmt:formatDate value="${today}" var="CurYM"    type="DATE" pattern="yyyyMM"/>
<fmt:formatDate value="${today}" var="CurYear"  type="DATE" pattern="yyyy"/>
<fmt:formatDate value="${today}" var="CurMon"   type="DATE" pattern="MM"/>
<fmt:formatDate value="${today}" var="CurHour"  type="TIME" pattern="HH"/>
<fmt:formatDate value="${today}" var="CurMin"   type="TIME" pattern="mm"/>
<fmt:formatDate value="${today}" var="CurSec"   type="TIME" pattern="ss"/>
<fmt:formatDate value="${today}" var="CurSec"   type="TIME" pattern=""/>


<%
/* 	String requestUrl = (String) request.getAttribute("javax.servlet.forward.request_uri");
	String queryString = (request.getQueryString() == null) ? "" : "?" + request.getQueryString();
	String fullRequestUrl = requestUrl + queryString;
	String noRedirect = (String) pageContext.getAttribute("noRedirect", PageContext.REQUEST_SCOPE);
	noRedirect = (noRedirect == null) ? "false" : noRedirect; */
	
	//Cache 설정 해당 페이지를 캐쉬하지 못하도록 response 객체를 사용하여*/
	// Header Setting
	// Set to expire far in the past.
/* 	response.setHeader("Expires", "Mon, 23 Aug 1982 12:00:00 GMT");
	// Set standard HTTP/1.1 no-cache headers.
	response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
	// Set IE extended HTTP/1.1 no-cache headers (use addHeader).
	response.addHeader("Cache-Control", "post-check=0, pre-check=0");
	// Set standard HTTP/1.0 no-cache header.
	response.setHeader("Pragma", "no-cache");  */
	
	pageContext.setAttribute("crlf","\r\n");
	pageContext.setAttribute("crlr","\n");
%>