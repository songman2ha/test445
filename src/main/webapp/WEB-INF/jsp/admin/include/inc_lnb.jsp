<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javaScript" language="javascript" defer="defer">
$(function() {
	console.log('${sessionScope.param4}');
	var num = "${param.menu_2depth }";
// 	console.log(num);
	var no = num.charAt(0);
// 	console.log(no);
	$("#menu_2depth"+num).addClass("current");
	$("#menu_2depth"+no).addClass("open");
	$("#menu_2depth"+no+" a img").attr('src','/images/admin/ico_close_lnb.png');
	$("#mkt_tree").treeview({
		animated: "medium",
		collapsed: true,
		unique: true
	});
});

</script> 
<div class="header">
   <h1><a href="#n" class="logo"><img src="/images/admin/img_logo_bo.png"></a></h1> 
   <a href="#n" class="btn_menu"><img src="/images/admin/ico_hamburger.png"></a>
   <div class="m_right">
      <span class="user_name">
		<strong>${sessionScope.USER_NM}</strong>
		님 (${sessionScope.USER_EMAIL})
      </span>
     <a href="/admin.logout.view.dp/proc.go" class="btn_user">로그아웃</a>
   </div>
</div><!--// header -->
<div class="lnbWrap">
	<h2>프리세일</h2>
	<ul class="lnb">
		<li class="lnb_sbj">
            <c:if test="${param.menu_1depth == '01'}">
                <a href="#n">프리세일</a>
                <ul class="sub_lnbmenu">
                    <c:choose>
                        <c:when test="${param.menu_2depth == '01' }">
                            <li><a href="/admin.cust.list.dp/proc.go" class="current">회원정보조회</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/admin.cust.list.dp/proc.go">회원정보조회</a></li>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${param.menu_2depth == '02' }">
                            <li><a href="#n" class="current">KYC 인증</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="#n">KYC 인증</a></li>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${param.menu_2depth == '03' }">
                            <li><a href="#n" class="current">거래내역</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="#n">거래내역</a></li>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${param.menu_2depth == '04' }">
                            <li><a href="#n" class="current">문의하기</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="#n">문의하기</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </c:if>

            <c:if test="${param.menu_1depth == '07'}">
                <a href="#n">공통관리</a>
                <ul class="sub_lnbmenu">
                    <c:choose>
                        <c:when test="${param.menu_2depth == '01' }">
                            <li><a href="/admin.other.contractList.dp/proc.go" class="current">총판관리</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="/admin.other.contractList.dp/proc.go">총판관리</a></li>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${param.menu_2depth == '02' }">
                            <li><a href="#n" class="current">에이전시관리</a></li>
                        </c:when>
                        <c:otherwise>
                            <li><a href="#n">에이전시관리</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </c:if>

		</li>
	</ul>
</div>