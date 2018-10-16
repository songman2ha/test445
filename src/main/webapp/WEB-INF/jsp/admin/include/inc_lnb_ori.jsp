<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javaScript" language="javascript" defer="defer">
$(function() {
	
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

// function showList(id) {
// 	alert(2);
// 	$("#bbsId").val(id);
// 	$("#pageIndex").val('1');
// 	$("#bbsForm").attr({method:"post", action:"/admin.board.list.dp/proc.go"}).submit();
// 	//loadFrm('로딩중','searchForm','post','/common.dmboard.admin.dmAdmBrdList.dp/dmparse.dm');
// }
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
	<h2>기본설정</h2>
	<ul class="lnb">
		<li class="lnb_sbj">
		 <c:if test="${param.menu_1depth == '01'}">
			<a href="#n">
					회원 관리
					<img src="/images/admin/ico_close_lnb.png" class="btn_lnb">
				</a>
				<ul class="sub_lnbmenu lnb" id="mkt_tree">
					<c:forEach items="${sessionScope.lnbMenuList}" var="lnbMenuList" varStatus="idx">
						<c:if test="${lnbMenuList.menu_up_code == vo.param1 && lnbMenuList.use_yn == 'Y'}">
							<li class="lnb_sbj" id="menu_2depth${idx.index }">
								<a href="#n" id="menu_2depth${vo.param1 }" onclick="goMenu('${lnbMenuList.url_info }','${vo.param1 }');">${lnbMenuList.menu_nm } / ${idx.index }</a>
							</li>
						</c:if>
					</c:forEach>			
				</ul>
			</c:if>
			<c:if test="${param.menu_1depth == '02'}"> 			
				<a href="#n">
					거래내역 관리
					<img src="/images/admin/ico_close_lnb.png" class="btn_lnb">
				</a>
				<ul class="sub_lnbmenu lnb" id="mkt_tree">
					<li class="lnb_sbj" id="menu_2depth0">			
						<a href="/admin.trade.totList.dp/proc.go" id="menu_2depth01">전체 거래내역 조회</a>			
					</li>
					<li class="lnb_sbj" id="menu_2depth1">			
						<a href="/admin.trade.chargeList.dp/proc.go"  id="menu_2depth02">충전 내역</a>
					</li>
					<li class="lnb_sbj" id="menu_2depth2">			
						<a href="/admin.trade.buyList.dp/proc.go"  id="menu_2depth03">구매 내역</a>
					</li>
					<li class="lnb_sbj" id="menu_2depth3">			
						<a href="/admin.trade.salesList.dp/proc.go" id="menu_2depth04">판매 내역</a>
					</li>
					<li class="lnb_sbj" id="menu_2depth4">		
						<a href="/admin.trade.outChashList.dp/proc.go" id="menu_2depth05">출금 내역</a>
					</li>
					<li class="lnb_sbj" id="menu_2depth5">		
						<a href="/admin.trade.sendChashList.dp/proc.go" id="menu_2depth06">송금 내역</a>
					</li>
					<li class="lnb_sbj" id="menu_2depth6">		
						<a href="/admin.trade.inChashList.dp/proc.go" id="menu_2depth07">입금 내역</a>
					</li>
					<li class="lnb_sbj" id="menu_2depth7">		
						<a href="/admin.trade.outherList.dp/proc.go" id="menu_2depth08">기타 내역</a>
					</li>
					<li class="lnb_sbj" id="menu_2depth8">		
						<a href="#n" id="menu_2depth08">미체결주문</a>
					</li>
					<li class="lnb_sbj" id="menu_2depth9">		
						<a href="#n" id="menu_2depth08">미체결주문 상세</a>
					</li>
					<li class="lnb_sbj" id="menu_2depth10">		
						<a href="#n" id="menu_2depth08">거래완료</a>
					</li>
				</ul>
			</c:if>
			<c:if test="${param.menu_1depth == '03'}"> 
				<a href="#n">
					자산 관리
					<img src="/images/admin/ico_close_lnb.png" class="btn_lnb">
				</a>
				<ul class="sub_lnbmenu lnb" id="mkt_tree">
					<li class="lnb_sbj" id="menu_2depth0">				
						<a href="/admin.asset.totAssetList.dp/proc.go" id="menu_2depth01">자산현황</a>			
					</li>
					<li class="lnb_sbj" id="menu_2depth1">			
						<a href="/admin.asset.custAssetList.dp/proc.go" id="menu_2depth02">고객 자산</a>
					</li>
					<li class="lnb_sbj" id="menu_2depth2">	
						<a href="/admin.asset.bitAssetList.dp/proc.go" id="menu_2depth03">거래소 자산</a>	
					</li>
					<li class="lnb_sbj" id="menu_2depth3">	
						<a href="/admin.asset.depositAssetList.dp/proc.go" id="menu_2depth04">예치금 현황</a>	
					</li>
					<li class="lnb_sbj" id="menu_2depth4">	
						<a href="/admin.asset.feeAssetList.dp/proc.go" id="menu_2depth05">수수료 내역 조회</a>	
					</li>
				</ul>
			</c:if>
			<c:if test="${param.menu_1depth == '04'}"> 
				<a href="#n">
					출금 관리
					<img src="/images/admin/ico_close_lnb.png" class="btn_lnb">
				</a>
				<ul class="sub_lnbmenu lnb" id="mkt_tree">
						<li class="lnb_sbj" id="menu_2depth0">			
							<a>
								회원 출금관리
								<img src="/images/admin/ico_open_lnb.png" class="btn_lnb">
							</a>
							<ul class="sl_inmenu">
								<li><a href="/admin.withdraw.custList.dp/proc.go" id="menu_2depth01"><strong>회원 출금관리</strong></a></li>
								<li><a href="/admin.withdraw.custSendList.dp/proc.go" id="menu_2depth02"><strong>회원 송금관리</strong></a></li>
							</ul>
						</li>
						<li class="lnb_sbj" id="menu_2depth1">			
							<a>
								거래소 출금관리
								<img src="/images/admin/ico_open_lnb.png" class="btn_lnb">
							</a>
							<ul class="sl_inmenu">
								<li><a href="/admin.withdraw.bitkrxList.dp/proc.go" id="menu_2depth12"><strong>거래소 출금관리</strong></a></li>
							</ul>
						</li>
					</ul>
			</c:if>	
			
			<c:if test="${param.menu_1depth == '05'}"> 
				<a href="#n">
					부가서비스 관리
					<img src="/images/admin/ico_close_lnb.png" class="btn_lnb">
				</a>
				<ul class="sub_lnbmenu lnb" id="mkt_tree">
						<li class="lnb_sbj" id="menu_2depth0">			
							<a>
								수수료쿠폰
								<img src="/images/admin/ico_open_lnb.png" class="btn_lnb">
							</a>
							<ul class="sl_inmenu">
								<li><a href="/admin.addition.couponManage.dp/proc.go" id="menu_2depth01"><strong>수수료쿠폰 관리</strong></a></li>
								<li><a href="/admin.addition.couponSal.dp/proc.go" id="menu_2depth02"><strong>수수료쿠폰 판매내역</strong></a></li>
								<li><a href="/admin.addition.couponUse.dp/proc.go" id="menu_2depth03"><strong>수수료쿠폰 사용내역</strong></a></li>
							</ul>
						</li>
						<li class="lnb_sbj" id="menu_2depth1">			
							<a>
								시세알림 관리
								<img src="/images/admin/ico_open_lnb.png" class="btn_lnb">
							</a>
							<ul class="sl_inmenu">
								<li><a href="/admin.addition.alarm.dp/proc.go" id="menu_2depth11"><strong>신청 내역</strong></a></li>
							</ul>
						</li>
						<li class="lnb_sbj" id="menu_2depth2">			
							<a>
								자동 거래
								<img src="/images/admin/ico_open_lnb.png" class="btn_lnb">
							</a>
							<ul class="sl_inmenu">
								<li><a href="/admin.addition.Auto.dp/proc.go" id="menu_2depth21"><strong>신청 내역</strong></a></li>
							</ul>
						</li>
					</ul>
			</c:if>	
			<c:if test="${param.menu_1depth == '06'}"> 				
				<a href="#n">
					통계
				</a>
				<ul class="sub_lnbmenu lnb" id="mkt_tree">
					<li class="lnb_sbj" id="menu_2depth0">			
						<a href="#n" id="menu_2depth01">회원통계</a>	
					</li>
					<li class="lnb_sbj" id="menu_2depth1">			
						<a href="#n" id="menu_2depth01">거래내역 통계</a>	
					</li>
					<li class="lnb_sbj" id="menu_2depth2">				
						<a href="#n" id="menu_2depth02">수수료매출 통계</a>
					</li>
					
				</ul>	
			</c:if>
			<c:if test="${param.menu_1depth == '06'}"> 				
				<a href="#n">
					고객지원
					<img src="/images/admin/ico_close_lnb.png" class="btn_lnb">
				</a>
				<ul class="sub_lnbmenu lnb" id="mkt_tree">
					<li class="lnb_sbj" id="menu_2depth0">			
						<a>
							게시판관리
							<img src="/images/admin/ico_open_lnb.png" class="btn_lnb">
						</a>
						<ul class="sl_inmenu">
<!-- 						javascript:showList('DMBOARD_000000000746'); return; -->
                            <li><a href="/admin.board.setting.dp/proc.go" id="menu_2depth00"><strong>게시판 설정</strong></a>
							<li><a href="#n" id="menu_2depth01"><strong>공지사항</strong></a></li>
							<li><a href="#n" id="menu_2depth02"><strong>1:1문의</strong></a></li>
							<li><a href="#n" id="menu_2depth03"><strong>FAQ</strong></a></li>
						</ul>
					</li>
					<li class="lnb_sbj" id="menu_2depth1">			
						<a>
							알림
							<img src="/images/admin/ico_open_lnb.png" class="btn_lnb">
						</a>
						<ul class="sl_inmenu">
							<li><a href="/admin.support.pushList.dp/proc.go" id="menu_2depth11"><strong>푸쉬알림</strong></a></li>
						</ul>
					</li>
					<li class="lnb_sbj" id="menu_2depth2">			
						<a>
							SMS관리
							<img src="/images/admin/ico_open_lnb.png" class="btn_lnb">
						</a>
						<ul class="sl_inmenu">
							<li><a href="/admin.support.smsList.dp/proc.go" id="menu_2depth21"><strong>SMS 발송관리</strong></a></li>
						</ul>
					</li>
					<li class="lnb_sbj" id="menu_2depth3">			
						<a>
							이메일관리
							<img src="/images/admin/ico_open_lnb.png" class="btn_lnb">
						</a>
						<ul class="sl_inmenu">
							<li><a href="/admin.support.emailList.dp/proc.go" id="menu_2depth31"><strong>이메일 발송관리</strong></a></li>
						</ul>
					</li>
				</ul>
			</c:if>	
			<c:if test="${param.menu_1depth == '07'}"> 
				<a href="#n">
					공통관리
					<img src="/images/admin/ico_close_lnb.png" class="btn_lnb">
				</a>
				<ul class="sub_lnbmenu lnb" id="mkt_tree">
					<li class="lnb_sbj" id="menu_2depth0">			
						<a>
							기타관리
							<img src="/images/admin/ico_open_lnb.png" class="btn_lnb">
						</a>
						<ul class="sl_inmenu">
							<li><a href="/admin.other.accountManage.dp/proc.go" id="menu_2depth01"><strong>거래소 계좌번호 관리</strong></a></li>
							<li><a href="/admin.other.commonCodeList.dp/proc.go" id="menu_2depth02"><strong>공통 코드 관리</strong></a></li>
							<li><a href="/admin.other.betaMailList.dp/proc.go" id="menu_2depth03"><strong>베타 메일 관리</strong></a></li>
						</ul>
					</li>
					<li class="lnb_sbj" id="menu_2depth1">			
						<a>
							권한관리
							<img src="/images/admin/ico_open_lnb.png" class="btn_lnb">
						</a>
						<ul class="sl_inmenu">
<!-- 							<li><a href="/admin.other.userManage.dp/proc.go" id="menu_2depth11"><strong>사용자 관리</strong></a></li> -->
							<li><a href="/admin.other.authManage.dp/proc.go" id="menu_2depth12"><strong>업무권한 관리</strong></a></li>
							<li><a href="/admin.other.agreeManage.dp/proc.go" id="menu_2depth13"><strong>승인자 관리</strong></a></li>
							<li><a href="/admin.company.list.dp/proc.go" id="menu_2depth14"><strong>사업자관리</strong></a></li>
							<li><a href="/admin.user.list.dp/proc.go" id="menu_2depth15"><strong>관리자관리</strong></a></li>
							<li><a href="/admin.user.groupList.dp/proc.go" id="menu_2depth16"><strong>관리자그룹관리</strong></a></li>
						</ul>
					</li>
					<li class="lnb_sbj" id="menu_2depth2">
						<a>
							프로그램 , 메뉴 관리
							<img src="/images/admin/ico_open_lnb.png" class="btn_lnb">
						</a>
						<ul class="sl_inmenu">
							<li><a href="/admin.other.programList.dp/proc.go" id="menu_2depth21"><strong>프로그램 관리</strong></a></li>
							<li><a href="/admin.other.menuList.dp/proc.go" id="menu_2depth22"><strong>메뉴 관리</strong></a></li>
						</ul>
					</li>
				</ul>
			</c:if>	
		</li>
	</ul>
</div>