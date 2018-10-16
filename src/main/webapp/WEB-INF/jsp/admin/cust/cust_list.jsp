<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/admin.include.common_admin_head.ds/proc.go" charEncoding="utf-8"/>
</head>
<script type="text/javaScript" language="javascript" defer="defer">

    $(document).ready(function () {

            if ('${vo.use_yn}' != '') {
                $("#use_yn").val('${vo.use_yn}');
            }

            if ('${vo.searchWrd}' != '') {
                $("#searchKey").val('${vo.searchKey}');
                $("#searchWrd").val('${vo.searchWrd}');
            }

            if ('${vo.auth}' != '') {
                $("#auth").val('${vo.auth}');
            }

            if ('${vo.country_cd}' != '') {
                $("#country_cd").val('${vo.country_cd}');
            }

            if ('${vo.pageUnit}' != '') {
                $("#pageUnit").val('${vo.pageUnit}');
            }

            //검색할때
            if ('${vo.natn_code}' != '') {
                $("#natn_code").val('${vo.natn_code}');
            }

            if ('${vo.brh_code}' != '') {
                $("#brh_code").val('${vo.brh_code}');
            }


            if ('${vo.rcmd_code}' != '') {
                $("#rcmd_code").val('${vo.rcmd_code}');
            }


            var userEmail = "";
            <c:forEach items="${list}" var="list" varStatus="idx">
            userEmail = "${list.user_email}";
            $("#_user_email${idx.count}").html(masking(userEmail));
            </c:forEach>

            var funcNm = '${vo.funcNm}';
            if (funcNm == "") {
                $(".dateSet:eq(3)").click();
                //fnsetDate(1, 0, 3);
            } else if (funcNm == "-1") {
                $(".dateSet").each(function () {
                    $(this).css("opacity", "0.5")
                });
                $("#funcNm").val(funcNm);
            } else {
                $(".dateSet:eq(" + funcNm + ")").click();
                //fnsetDate(1, 0, searchCnd);
            }
            $("#sdate").datepicker({
                showOn: "button",
                changeYear: true,
                changeMonth: true,
                buttonImage: "/images/admin/ico_cal.gif",
                buttonImageOnly: true,
                showButtonPanel: true,
                dateFormat: "yy.mm.dd",
                numberOfMonths: 1,
                maxDate: "+0m +0w",
                onClose: function (selectedDate) {
                    $("#rdate").datepicker("option", "minDate", selectedDate);
                    $("#searchBgnDe").val(selectedDate);
                    //funcNm
                    $("#funcNm").val("-1");
                    $(".dateSet").each(function () {
                        $(this).css("opacity", "0.5")
                    });
                }
            });

            $("#rdate").datepicker({
                showOn: "button",
                changeYear: true,
                changeMonth: true,
                buttonImage: "/images/admin/ico_cal.gif",
                buttonImageOnly: true,
                showButtonPanel: true,
                dateFormat: "yy.mm.dd",
                maxDate: "+0m +0w",
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $("#sdate").datepicker("option", "maxDate", selectedDate);
                    $("#searchEndDe").val(selectedDate);
                    $("#funcNm").val("-1");
                    $(".dateSet").each(function () {
                        $(this).css("opacity", "0.5")
                    });
                }
            });
        }
    );

    function fnsetDate(MM, dd, num) {
        var today = new Date();
        if (MM == 'all') {
            var staDate = "2017.01.01";
            var endDate = today.format('yyyy.MM.dd');
        } else {
            var endDate = today.format('yyyy.MM.dd');
            today.setMonth(today.getMonth() - MM);
            today = getCalDate(today, -dd);
            var staDate = today.format('yyyy.MM.dd');
        }
        $("#sdate").val(staDate);
        $("#searchBgnDe").val(staDate);
        $("#rdate").val(endDate);
        $("#searchEndDe").val(endDate);

        $(".dateSet").each(function () {
            $(this).css("opacity", "0.5")
        });
        $(".dateSet:eq(" + num + ")").css("opacity", "1");
        $("#funcNm").val(num);
    }

    function masking(email) {
        const len = email.split('@')[0].length - 3;
        return email.replace(new RegExp('.(?=.{0,' + len + '}@)', 'g'), '*');

    }

    function linkPage(idx) {

        if (idx <= 0 || idx > '${pageSize }') {
            return;
        }
        if ('${vo.pageIndex}' != idx) {
            $("#pageIndex").val(idx);
// 		var url = "/admin.cust.list.dp/proc.go";
// 		var frm = "custForm";
// 		var methodtype = "post";
// 		$('#'+frm).attr({method:methodtype,action:url, target:"_self"}).submit();
            loadFrm("", "custForm", "post", "/admin.cust.list.dp/proc.go");
        }

    }

    function goSearch() {
        $("#pageIndex").val(1);
        loadFrm("", "custForm", "post", "/admin.cust.list.dp/proc.go");

    }

    function chgPageUnit() {
        $("#pageIndex").val(1);
        loadFrm("", "custForm", "post", "/admin.cust.list.dp/proc.go");
    }

    // function fnEdit(user_email) {
    // 	$("#user_email").val(user_email);
    // 	$("#searchBgnDe").val("");
    // 	$("#searchEndDe").val("");
    // 	loadFrm("","custForm","post","/admin.cust.detail.dp/proc.go");
    // }

    function fnEdit(user_email, natn_code) {
        $(".pop_bg").show();
        $(".searchCust").show();
        $("#user_email").val(user_email);
        $("#natn_code").val(natn_code);
    }

    function success_log() {
        if ($("#tmp_pwd").val() == '') {
            alert("비밀번호를 입력해 주세요.");
            return;
        }

        var data = {
            "user_email": '${sessionScope.USER_EMAIL}',
            "tmp_pwd": $("#tmp_pwd").val(),
            "cust_email": $("#user_email").val()
        }
        var _url = "/admin.cust.chkAdmin.dp/proc.go";
        postLoadigAjax(_url, data, afterChkAdmin, true, "");
    }

    function afterChkAdmin(data) {
        if (data.resultCode > 0) {

            $("#searchBgnDe").val("");
            $("#searchEndDe").val("");
            loadFrm("", "custForm", "post", "/admin.cust.detail.dp/proc.go");
        } else {
            alert(data.resultMsg);
        }
    }

    function cancel_log() {
        $(".pop_bg").hide();
        $(".searchCust").hide();
        $(".custInfo").hide();
        $("#tmp_pwd").val("");
    }

    function custSend(mode, user_email, lang_cd) {

        $("#mode").val(mode);
        $("#user_email").val(user_email);
        $("#lang_cd").val(lang_cd);

        if (mode == 'sms') {
            window.open("SMS발송", 'send_pop', 'top=200,left=500,width=600,height=600,scrollbars=no');
        } else if (mode == 'mail') {
            window.open("MAIL발송", 'send_pop', 'top=200,left=500,width=600,height=600,scrollbars=no');
        }

        var frm = document.custForm;
        frm.method = "post";
        frm.target = "send_pop";
        frm.action = "/admin.cust.cust_send_pop.dp/proc.go";
        frm.submit();
    }

    function chkDel() {

        if ($("input[name=checkField]:checked").length < 1) {
            alert("회원을 선택해 주세요.");
            return;
        }

        if ($("input[name=checkField]:checked").length > 1) {
            alert("1개이상 선택할수 없습니다.");
            return;
        }

        var val = "";
        var len = $("input[name=checkField]").length;
        var i = 0;

        $(".checkField").each(function (index) {

            if ($(this).is(":checked")) {
                val = val + $(this).val();
// 			if(i < len-1){
// 				val = val+",";
// 			}
// 			i++;
            }
        });
        $("#user_email").val(val);

        var data = {
            "user_email": $("#user_email").val()
        }

        var _url = "/admin.cust.delChk.dp/proc.go";
        postLoadigAjax(_url, data, afterDel, true, "");
    }

    function afterDel(data) {
        if (data.resultCode > 0) {
            if (confirm(data.resultMsg)) {
                var data = {
                    "user_email": $("#user_email").val()
                }

                var _url = "/admin.cust.delete.dp/proc.go";
                postLoadigAjax(_url, data, afterDel2, true, "");
            }
        } else {
            if (confirm(data.resultMsg)) {
                var data = {
                    "user_email": $("#user_email").val()
                }

                var _url = "/admin.cust.delete.dp/proc.go";
                postLoadigAjax(_url, data, afterDel2, true, "");
            }
        }
    }

    function afterDel2(data) {
        if (data.resultCode > 0) {
            alert(data.resultMsg);
            location.reload();
        } else {
            alert(data.resultMsg);
        }
    }

    function accUnlock(user_email) {
        var data = {
            "user_email": user_email
        }

        var _url = "/admin.cust.unLock.dp/proc.go";

        postLoadigAjax(_url, data, afterUnlock, true, "");
    }

    function afterUnlock(data) {
        if (data.resultCode > 0) {
            alert(data.resultMsg);
            location.reload();
        } else {
            alert(data.resultMsg);
        }
    }

    function noEnter(e) {
        if (e.keyCode == 13)
            return false;
    }

    function authSuccess() {
        alert("개발중입니다.");
    }

    function depositUnlock() {
        alert("개발중입니다.");
    }

    function fnExcelDwon() {
        $('#custForm').attr({
            method: "post",
            action: "/admin.cust.custListExcelDown.dp/proc.go",
            target: "_self"
        }).submit();
    }

    <!-- chgSel 함수 시작-->
    function chgSel() {
        var data = {
            "natn_code": $("#natn_code").val().trim()
        }

        var _url = "/admin.cust.chgSelect.dp/proc.go";
        postLoadigAjax(_url, data, afterChgSelect, true, "");
    }

    function afterChgSelect(data) {
        var html = "";
        var selecter = '${result.brh_code}';
        if (data.chgSelList.length > 0) {
            html += '<option value="" label ="" selected> =전체= </option>'; // =전체= 추가
            data.chgSelList.forEach(function (node, index) {
                if (selecter != '' && node.brh_code == selecter) {
                    html += '<option value="' + node.brh_code + '" selected>' + node.brh_nm + '</option>';
                } else {
                    html += '<option value="' + node.brh_code + '">' + node.brh_nm + '</option>';
                }
            });
        } else {
            html += '<option value="" label="지점이 없습니다."/>';
        }

        $("#brh_code").html(html);

        //검색 해서 새로고침 된 페이지 이면
        if ('${vo.brh_code}' != '') { //지점도 검색했으면
            $("#brh_code").val('${vo.brh_code}'); // 검색한 지점을 set하고
        }

    }

    <!-- chgSel 함수 끝-->


    // 지점 변경 함수 시작
    function chgPlace() {
        var data = {
            "brh_code": $("#brh_code").val()
        }
        var _url = "/admin.cust.chgBrhCode.dp/proc.go"
        postLoadigAjax(_url, data, afterChgBrhCode, true, "");
    }

    function afterChgBrhCode(data) {
        var list = data.result;
        var html = "";

        if (data.resultCode > 0) {
            html += '<option value="" label ="" selected> =전체= </option>'; // =전체= 추가
            list.forEach(function (node) {
                html += '<option value="' + node.rcmd_code + '" label="' + node.rcmd_nm + '"/>'
            });
        } else {
            if ('${vo.brh_code}' == '') {
                alert(data.resultMsg);
                html += '<option value="" label="추천인이 없습니다."/>';
            } else {
                html += '<option value="" label="추천인이 없습니다."/>';
            }
        }

        $("#rcmd_code").html(html);

        //추천인이 null이 아니면
        if ('${vo.rcmd_code}' != '') {
            $("#rcmd_code").val('${vo.rcmd_code}'); // 검색한 추천인을 set함
        }

    }

    //지점 변경 함수 끝

</script>
<body>

<!--// lnb start -->
<c:import url="/admin.include.inc_lnb.ds/proc.go" charEncoding="utf-8">
     <c:param name="menu_1depth" value="01"></c:param>
     <c:param name="menu_2depth" value="01"></c:param>
</c:import>
<!--// lnb end -->
<div class="containerWrap">
    <!--// gnb start -->
    <c:import url="/admin.include.inc_gnb.ds/proc.go" charEncoding="utf-8">
        <c:param name="menu_1depth" value="01"></c:param>
        <c:param name="menu_2depth" value="01"></c:param>
    </c:import>
    <!--// gnb end -->
    <div class="container">
        <div class="top clearfix">
            <ul class="menu_dept clearfix">
                <li>회원관리</li>
                <li>회원정보 조회</li>
            </ul>
        </div><!--// top -->

        <form name="custForm" id="custForm" method="post">
            <input type="hidden" id="user_email" name="user_email">
            <input type="hidden" id="mode" name="mode">
            <input type="hidden" id="lang_cd" name="lang_cd">
            <div class="current tabContent" id="tabCn0">
                <div class="cn_wrap">
                    <div class="table_top">
                        <span class="table_sbj">검색</span>
                        <!-- 					<a href="javascript:insertCust();" class="btn_user" style="float: right;margin-bottom: 10px;">회원등록</a> -->
                    </div><!--// table_top -->
                    <table class="horizon_tbl">
                        <colgroup>
                            <col width="10%">
                            <col width="*">
                            <col width="10%">
                            <col width="*">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>일시</th>
                            <td style="width: 65%" ;>
								<span class="input_cal">
									<input type="text" id="sdate" name="sdate" readonly value="${vo.searchBgnDe}">
								</span>~
                                <span class="input_cal">
									<input type="text" id="rdate" name="rdate" readonly value="${vo.searchEndDe}">
								</span>
                                <a class="btn_r_navy dateSet" onclick="fnsetDate(0, 0, 0)">오늘</a>
                                <a class="btn_r_navy dateSet" onclick="fnsetDate(0, 7, 1)">7일</a>
                                <a class="btn_r_navy dateSet" onclick="fnsetDate(0, 15, 2)">15일</a>
                                <a class="btn_r_navy dateSet" onclick="fnsetDate(1, 0, 3)">1개월</a>
                                <a class="btn_r_navy dateSet" onclick="fnsetDate(3, 0, 4)">3개월</a>
                                <a class="btn_r_navy dateSet" onclick="fnsetDate('all', 0, 5)">전체</a>
                                <input type="hidden" id="searchBgnDe" name="searchBgnDe"/>
                                <input type="hidden" id="searchEndDe" name="searchEndDe"/>
                                <input type="hidden" id="funcNm" name="funcNm" value=""/>
                            </td>

                            <th>지점</th>
                            <td>
                                <!--국가-->
                                <select id="natn_code" name="natn_code" onchange="chgSel();">
                                    <c:choose>
                                        <c:when
                                            test="${sessionScope.AUTH_LEVEL_CD == 'L0' or sessionScope.AUTH_LEVEL_CD == 'L1'}">
                                            <option value="" label="=전체="/>
                                            <c:forEach items="${nationList }" var="nationList">
                                                <option value="${nationList.natn_code }"
                                                        label="${nationList.natn_nm }"/>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${sessionScope.NATN_CODE }"
                                                    label="${sessionScope.NATN_NM }"/>
                                            <!-- L2, L3, L4 -->
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                                <!--지점-->
                                <select id="brh_code" name="brh_code" onchange="chgPlace();">
                                    <c:choose>
                                        <c:when test="${sessionScope.AUTH_LEVEL_CD == 'L0' or sessionScope.AUTH_LEVEL_CD == 'L1' or sessionScope.AUTH_LEVEL_CD == 'L2'}">
                                            <option value="" label="=전체="/>
                                            <c:forEach items="${placeList }" var="placeList">
                                                <option value="${placeList.brh_code }" label="${placeList.brh_nm }"/>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${sessionScope.BRH_CODE }" label="${sessionScope.BRH_NM }"/>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </td>
                        <tr>
                            <th>검색어</th>
                            <td>
                                <select id="searchKey" name="searchKey">
                                    <option value="name" label="이름"/>
                                    <option value="email" label="이메일"/>
                                    <option value="phone" label="전화번호"/>
                                    <option value="uptemail" label="처리자"/>
                                </select>
                                <input type="text" id="searchWrd" name="searchWrd" onkeydown="return noEnter(event);">
                            </td>
                            <%--<th>사용여부</th>--%>
                            <%--<td>--%>
                            <%--<select id="use_yn" name="use_yn">--%>
                            <%--<option value="" label="=전체="/>--%>
                            <%--<option value="Y" label="사용="/>--%>
                            <%--<option value="N" label="사용안함"/>--%>
                            <%--</select>--%>
                            <%--</td>--%>
                            <th>추천인</th>
                            <td>
                                <select id="rcmd_code" name="rcmd_code">
                                    <option value="" label="=전체="/>
                                    <c:forEach items="${recoUserList }" var="recoUserList">
                                        <option value="${recoUserList.rcmd_code }" label="${recoUserList.rcmd_nm }"/>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>인증여부</th>
                            <td>
                                <select id="auth" name="auth">
                                    <option value="" label="=전체="/>
                                    <option value="01" label="미인증"/>
                                    <option value="02" label="이메일인증"/>
                                    <option value="03" label="OTP인증"/>
                                    <option value="04" label="KYC인증"/>

                                </select>
                            </td>
                            <th>국적</th>
                            <td>
                                <select id="country_cd" name="country_cd">
                                    <option value="" label="=전체="/>
                                    <c:forEach items="${countryList }" var="countryList">
                                        <option value="${countryList.country_cd }" label="${countryList.country_nm }"/>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <%--<tr>--%>
                        <%--<th>추천인</th>--%>
                        <%--<td>--%>
                        <%--<select id="rcmd_code" name="rcmd_code">--%>
                        <%--<option value="" label="=전체="/>--%>
                        <%--<c:forEach items="${recoUserList }" var="recoUserList">--%>
                        <%--<option value="${recoUserList.rcmd_code }" label="${recoUserList.rcmd_nm }"/>--%>
                        <%--</c:forEach>--%>
                        <%--</select>--%>
                        <%--</td>--%>
                        <%--</tr>--%>
                        </tbody>
                    </table>
                    <a href="javascript:goSearch()" class="btn_c dis_b">검 색</a>
                </div>
                <div class="cn_wrap srch_result">
                    <div class="table_top clearfix">
                        <p class="count">
                            전체회원수 :
                            <span class="c_red">${listCnt4 }</span>명 &nbsp;&nbsp;
                            전일 가입 회원수 :
                            <span class="c_red">${listCnt2 }</span>건
                            당일 가입 회원수 :
                            <span class="c_red">${listCnt3 }</span>건
                        </p>
                    </div>
                    <div class="table_selected clearfix mb7">
                        <p>
                            선택한 항목을
                            <a href="#n" class="btn_r_navy" onClick="chkDel();">사용안함</a>
                            <!-- 						<a href="#n" class="btn_r_navy" onClick="authSuccess();">인증완료</a> -->
                        </p>
                        <p class="fl_right">
                            <select id="pageUnit" name="pageUnit" onchange="chgPageUnit();">
                                <option value="10" label="10개"/>
                                <option value="30" label="30개"/>
                                <option value="50" label="50개"/>
                                <option value="100" label="100개"/>
                                <option value="200" label="200개"/>
                                <option value="300" label="300개"/>
                            </select>
                        </p>
                    </div>


                    <table>
                        <colgroup>
                            <col width="2%">
                            <col width="3%">
                            <col width="6%">
                            <col width="6%">
                            <col width="5%">
                            <col width="7%">
                            <col width="8%">
                            <col width="8%">
                            <col width="7%">
                            <col width="7%">
                            <col width="7%">
                            <col width="7%">
                            <col width="7%">
                            <col width="6%">
                            <col width="6%">
                           <%-- <col width="11%">--%>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>
                                <!-- 								<input type="checkbox" id="checkAll" name="checkAll" onclick="javascript:fncheckAll('checkAll', 'checkField');"> -->
                            </th>
                            <th>NO</th>
                            <th>국가</th>
                            <th>지점</th>
                            <th>추천인</th>
                            <th>이름</th>
                            <th>전화번호</th>
                            <th>ID</th>
                            <th>국적</th>
                            <th>가입일</th>
                            <th>인증여부</th>
                            <th>계정잠금</th>
                            <th>출금잠금</th>
                            <th>사용여부</th>
                            <th>Email/SMS</th>
                           <%-- <th>처리자</th>--%>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty list }">
                                <tr>
                                    <td colspan="16">
                                        데이터가 없습니다.
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${list }" var="list" varStatus="idx">
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkField" name="checkField" title="선택"
                                                   value="${list.user_email }">
                                        </td>
                                        <td>
                                                ${(vo.pageIndex - 1) * vo.pageUnit + idx.count}
                                        </td>
                                        <td>
                                                ${list.natn_nm}
                                        </td>
                                        <td>
                                                ${list.brh_nm }
                                        </td>
                                        <td>
                                                ${list.rcmd_nm }
                                        </td>
                                        <td class="tbl_link">
                                            <a href="#n" onclick="fnEdit('${list.user_email}','${list.natn_code}');">
                                                    ${list.user_nm }
                                            </a>
                                        </td>
                                        <td class="tbl_link">
                                            <a href="#n" onclick="fnEdit('${list.user_email}','${list.natn_code}');">
                                                    ${list.user_mobile }
                                            </a>
                                        </td>
                                        <td class="tbl_link">
                                            <a href="#n" id="_user_email${idx.count }"
                                               onclick="fnEdit('${list.user_email}','${list.natn_code}');">
                                                    <%-- 												${list.user_email } --%>
                                            </a>
                                        </td>
                                        <td>
                                                ${list.country_nm }

                                                <%--&lt;%&ndash;<c:choose>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<c:when test="${list.country_cd eq '996'}">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;키르키즈스탄&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<c:when test="${list.country_cd eq '92'}">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;파키스탄&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<c:when test="${list.country_cd eq '971'}">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;두바이&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<c:when test="${list.country_cd eq '7'}">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;카자흐스탄&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;<c:when test="${list.country_cd eq '82'}">&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;한국&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</c:when>&ndash;%&gt;--%>
                                                <%--&lt;%&ndash;</c:choose>&ndash;%&gt;--%>
                                        </td>
                                        <td>
                                                ${list.reg_dt }
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${list.kyc_cert_yn == '1'}">
                                                    KYC인증
                                                </c:when>
                                                <c:when test="${list.otp_serial != '' }">
                                                    OTP인증
                                                </c:when>
                                                <c:when test="${list.email_cert_yn == 'Y'}">
                                                    이메일인증
                                                </c:when>
                                                <c:otherwise>
                                                    미인증
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a href="#n" class="btn_r_navy"
                                               onclick="accUnlock('${list.user_email}');">잠금해제</a>
                                        </td>
                                        <td>
                                            <!-- 											<a href="#n" class="btn_r_navy" onclick="depositUnlock();">잠금해제</a> -->
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${list.use_yn == 'Y' }">
                                                    사용
                                                </c:when>
                                                <c:otherwise>
                                                    사용안함
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <a class="btn_r_navy"
                                               onclick="javascript:custSend('mail','${list.user_email}', '${list.lang_cd}');">Email</a>
                                                <%-- 											<a class="btn_r_navy" onclick="javascript:custSend('sms','${list.user_email}' , '${list.lang_cd}');">SMS</a> --%>
                                        </td>
                                       <%-- <td>
                                                ${list.upt_email} <br>&lt;%&ndash;처리자&ndash;%&gt;
                                                ${list.upt_dt} &lt;%&ndash;처리일시&ndash;%&gt;
                                        </td>--%>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                    <a href="#n" class="btn_r02_green" style="margin-top: 5px; float: right;" onclick="fnExcelDwon();">엑셀
                        다운로드</a>
                    <!-- 페이징처리 -->
                    <fmt:parseNumber var="firstPage" value="${(vo.pageIndex -1) / 10}" integerOnly="true"/>
                    <fmt:parseNumber var="firstPage" value="${firstPage * 10 + 1}" integerOnly="true"/>
                    <fmt:parseNumber var="lastPage" value="${firstPage + vo.pageSize - 1}" integerOnly="true"/>
                    <c:if test="${lastPage > pageSize}">
                        <c:set var="lastPage" value="${pageSize}"/>
                    </c:if>
                    <div class="pagingWrap">
                        <a href="n" class="page first" onclick="linkPage(${firstPage});return false;">first</a>&nbsp;
                        <a href="n" class="page prev" onclick="linkPage(${vo.pageIndex - 1});return false;">first</a>&nbsp;
                        <c:forEach var="i" begin="${firstPage }" end="${lastPage}" varStatus="idx">
                            <a onclick="linkPage(${idx.index});return false;"><span
                                class="page <c:if test='${idx.index eq vo.pageIndex}'>active</c:if>">${idx.index }</span></a>&nbsp;
                        </c:forEach>
                        <a href="n" class="page next" onclick="linkPage(${vo.pageIndex + 1});return false;">last</a>&nbsp;
                        <a href="n" class="page last" onclick="linkPage(${lastPage});return false;">last</a>&nbsp;
                    </div>
                    <input type="hidden" name="pageIndex" id="pageIndex" value="${vo.pageIndex }">

                </div>
            </div>
        </form>
    </div>

</div><!--// containerWrap -->
<div class="pop_bg" style="display: none;"></div>
<div class="lp_box searchCust" style="display: none;">
    <a href="#n" class="btn_close" onclick="cancel_log();"><img src="/images/admin/ico_close_lp.png" alt="팝업창 닫기"></a>
    <h3>개인정보조회</h3>
    <p>
        비밀번호입력시 조회됩니다.<br>
        개인정보 조회를 하시겠습니까?<br>
        <input type="password" id="tmp_pwd" name="tmp_pwd">
    </p>
    <a href="#n" class="btn_lp_r" onclick="success_log();"
       style="width: 50%; float: left; border-bottom-right-radius: 0;">확인</a>
    <a href="#n" class="btn_lp_c" onclick="cancel_log();"
       style="width: 50%; float: left; border-bottom-left-radius: 0;">취소</a>
</div>
<div class="lp_box custInfo" style="display: none;">
    <a href="#n" class="btn_close" onclick="cancel_log();"><img src="/images/admin/ico_close_lp.png" alt="팝업창 닫기"></a>
    <h3>개인정보조회</h3>
    <p class="custInfoHtml"></p>
</div>
</body>
</html>