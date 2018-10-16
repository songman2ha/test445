<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javaScript" language="javascript" defer="defer">
$(function () {
// 	console.log('${sessionScope.param1}');
// 	console.log('${sessionScope.param2}');
// 	console.log('${sessionScope.param3}');
// 	console.log('${sessionScope.param4}');
	if ('${sessionScope.isLogin}' != 'true') {
		$(location).attr("href","/admin.login.view.dp/proc.go");
	}
});

function showList(id) {
	$("#bbs_id").val(id);
	$("#bbsForm").attr({method:"post", action:"/admin.board.list.dp/proc.go"}).submit();
}

function goMenu(url_info,menu_code,menu_nm,child_code) {
	var _url = "/common.goMenu.dp/proc.go";
	$("#param1").val(menu_code);
	$("#param2").val(menu_nm);
	$("#param3").val(url_info.trim());
	$("#param4").val(child_code);
// 	$("#bbsForm").attr({method:"post", action:_url}).submit();
	loadFrm("loading", "bbsForm", "post", _url);
}

</script> 
<form id="bbsForm" name="bbsForm" method="post">
	<input type="hidden" id="bbs_id" name="bbs_id"/>
	<input type="hidden" id="param1" name="param1">
	<input type="hidden" id="param2" name="param2">
	<input type="hidden" id="param3" name="param3">
	<input type="hidden" id="param4" name="param4">
<!-- 	<input type="hidden" id="pageIndex" name="pageIndex" value="1"/> -->
</form>
<ul class="gnb">
    <li><a href="/admin.cust.list.dp/proc.go" <c:if test="${param.menu_1depth == '01'}"> class="current" </c:if>>프리세일</a></li>
    <%--
    <li><a href="/admin.trade.totList.dp/proc.go" <c:if test="${param.menu_1depth == '02'}"> class="current" </c:if>>거래내역관리</a></li>
    <li><a href="/admin.asset.totAssetList.dp/proc.go" <c:if test="${param.menu_1depth == '03'}"> class="current" </c:if>>자산관리</a></li>
    <li><a href="/admin.withdraw.custList.dp/proc.go" <c:if test="${param.menu_1depth == '04'}"> class="current" </c:if>>출금관리</a></li>
    <li><a href="/admin.addition.couponManage.dp/proc.go" <c:if test="${param.menu_1depth == '05'}"> class="current" </c:if>>부가서비스관리</a></li>
    <li><a href="/admin.board.setting.dp/proc.go" <c:if test="${param.menu_1depth == '06'}"> class="current"</c:if>>고객지원</a></li>
    --%>
    <li><a href="/admin.other.contractList.dp/proc.go"<c:if test="${param.menu_1depth == '07'}"> class="current" </c:if>>공통관리</a></li>
</ul>
<!--// gnb -->