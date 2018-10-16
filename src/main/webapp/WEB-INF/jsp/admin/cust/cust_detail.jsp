<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/admin.include.common_admin_head.ds/proc.go" charEncoding="utf-8"/>
</head>
<style>
    .container .cn_wrap .upTable tr th {
        background: #c8c8c8 !important;
    }
</style>
<script src="https://spi.maps.daum.net/imap/map_js_init/postcode.v2.js"></script>
<script type="text/javaScript" language="javascript" defer="defer">

    $(document).ready(function () {

        var index = '${vo.tab_no}'
        $(".tabContent").hide();
        $("#tabCn" + index).show();
        $(".tabNav li").removeClass("current");

        if (index == 5) {
            index = 3;
        }
        $(".tabNav li:eq(" + index + ")").addClass("current");

        if ('${result.use_yn}' != '') {
            $("#use_yn").val('${result.use_yn}');
        }
        if ('${result.brh_code}' != '') {
            $("#brh_code").val('${result.brh_code}');
        }
        if ('${result.natn_code}' != '') {
            $("#natn_code").val('${result.natn_code}');
        }

        if ('${result.rcmd_code}' != '') {
            $("#rcmd_code").val('${result.rcmd_code}');
        }

        if ('${tradeVO.hisCode}' != '') {
            $("#hisCode").val('${tradeVO.hisCode}');
        }
        if ('${tradeVO.orderState}' != '') {
            $("#orderState").val('${tradeVO.orderState}');
        }

        var funcNm = '';
        if ('${vo.tab_no}' == '1') {
            funcNm = '${tradeVO.funcNm}';
        } else if ('${vo.tab_no}' == '2') {
            funcNm = '${boardVO.funcNm}';
        } else if ('${vo.tab_no}' == '6') {
            funcNm = '${vo.funcNm}';
        }

        if (funcNm == "") {
            if ('${vo.tab_no}' == '1') {
                $("#tradeFrm .dateSet:eq(3)").click();
            } else if ('${vo.tab_no}' == '2') {
                $("#boardFrm .dateSet:eq(3)").click();
            } else if ('${vo.tab_no}' == '6') {
                $("#processFrm .dateSet:eq(3)").click();
            }
        } else if (funcNm == "-1") {
            $(".dateSet").each(function () {
                $(this).css("opacity", "0.5")
            });
        } else {
            if ('${vo.tab_no}' == '1') {
                $("#tradeFrm .dateSet:eq(" + funcNm + ")").click();
            } else if ('${vo.tab_no}' == '2') {
                $("#boardFrm .dateSet:eq(" + funcNm + ")").click();
            }else if ('${vo.tab_no}' == '6') {
                $("#processFrm .dateSet:eq(" + funcNm + ")").click();
            }
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
                //funcNm
                $("#tradeFrm #funcNm").val("-1");
                $("#tradeFrm #searchBgnDe").val(selectedDate);
                $(".dateSet").each(function () {
                    $(this).css("opacity", "0.5")
                });
            }
        });

        $("#sdate2").datepicker({
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
                $("#rdate2").datepicker("option", "minDate", selectedDate);
                //funcNm
                $("#boardFrm #funcNm").val("-1");
                $("#boardFrm #searchBgnDe").val(selectedDate);
                $(".dateSet").each(function () {
                    $(this).css("opacity", "0.5")
                });
            }
        });
        $("#sdate3").datepicker({
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
                $("#rdate3").datepicker("option", "minDate", selectedDate);
                //funcNm
                $("#processFrm #funcNm").val("-1");
                $("#processFrm #searchBgnDe").val(selectedDate);
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
                $("#tradeFrm #funcNm").val("-1");
                $("#tradeFrm #searchEndDe").val(selectedDate);
                $(".dateSet").each(function () {
                    $(this).css("opacity", "0.5")
                });
            }
        });

        $("#rdate2").datepicker({
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
                $("#sdate2").datepicker("option", "maxDate", selectedDate);
                $("#boardFrm #funcNm").val("-1");
                $("#boardFrm #searchEndDe").val(selectedDate);
                $(".dateSet").each(function () {
                    $(this).css("opacity", "0.5")
                });
            }
        });

        $("#rdate3").datepicker({
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
                $("#sdate3").datepicker("option", "maxDate", selectedDate);
                $("#processFrm #funcNm").val("-1");
                $("#processFrm #searchEndDe").val(selectedDate);
                $(".dateSet").each(function () {
                    $(this).css("opacity", "0.5")
                });
            }
        });

    });

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

        $("#tradeFrm #sdate").val(staDate);
        $("#tradeFrm #rdate").val(endDate);
        $("#tradeFrm #searchBgnDe").val(staDate);
        $("#tradeFrm #searchEndDe").val(endDate);

        $("#boardFrm #sdate2").val(staDate);
        $("#boardFrm #rdate2").val(endDate);
        $("#boardFrm #searchBgnDe").val(staDate);
        $("#boardFrm #searchEndDe").val(endDate);

        $("#processFrm #sdate3").val(staDate);
        $("#processFrm #rdate3").val(endDate);
        $("#processFrm #searchBgnDe").val(staDate);
        $("#processFrm #searchEndDe").val(endDate);

        $(".dateSet").each(function () {
            $(this).css("opacity", "0.5")
        });

        $("#tradeFrm .dateSet:eq(" + num + ")").css("opacity", "1");
        $("#tradeFrm #funcNm").val(num);

        $("#boardFrm .dateSet:eq(" + num + ")").css("opacity", "1");
        $("#boardFrm #funcNm").val(num);

        $("#processFrm .dateSet:eq(" + num + ")").css("opacity", "1");
        $("#processFrm #funcNm").val(num);
    }

    /* 탭 클릭 이벤트 바인딩 시작*/
    function fnNext(index) {
// 	$(".tabContent").hide();
// 	$("#tabCn" + index).removeClass("dis_none");
// 	$("#tabCn" + index).show();
// 	$(".tabNav li").removeClass("current");
// 	$(".tabNav li:eq("+index+")").addClass("current");

        if (index == '0') {
            loadFrm("", "assetFrm", "post", "/admin.cust.detail.dp/proc.go");
        } else if (index == '1') {
            $("#tradeFrm #pageIndex").val(1);
            $("#tradeFrm #funcNm").val("");
            $("#tradeFrm #searchBgnDe").val("");
            $("#tradeFrm #searchEndDe").val("");
            loadFrm("", "tradeFrm", "post", "/admin.cust.detail.dp/proc.go");
        } else if (index == '2') {
            $("#boardFrm #pageIndex").val(1);
            $("#boardFrm #funcNm").val("");
            $("#boardFrm #searchBgnDe").val("");
            $("#boardFrm #searchEndDe").val("");
            loadFrm("", "boardFrm", "post", "/admin.cust.detail.dp/proc.go");
        } else if (index == '3') {
            loadFrm("", "joinFrm", "post", "/admin.cust.detail.dp/proc.go");
        } else if (index == '4') {
            loadFrm("", "additionFrm", "post", "/admin.cust.detail.dp/proc.go");
        } else if (index == '5') {
            loadFrm("", "walletFrm", "post", "/admin.cust.detail.dp/proc.go");
        }else if (index == '6') {
            $("#processFrm #pageIndex").val(1);
            $("#processFrm #funcNm").val("");
            $("#processFrm #searchBgnDe").val("");
            $("#processFrm #searchEndDe").val("");
            loadFrm("", "processFrm", "post", "/admin.cust.detail.dp/proc.go");
        }

    }

    /* 탭 클릭 이벤트 바인딩 끝*/

    function goSearch(index) {
        if (index == '1') {
            $("#tradeFrm #pageIndex").val(1);
            loadFrm("", "tradeFrm", "post", "/admin.cust.detail.dp/proc.go");
        }
    }

    function goSch() {
            loadFrm("", "processFrm", "post", "/admin.cust.detail.dp/proc.go");
    }

    //---------------------------------------------------------------
    // daum 주소검색 호출
    //---------------------------------------------------------------
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if (fullRoadAddr !== '') {
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                //document.getElementById('dlvr_zip_cd').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('adrs').value = fullRoadAddr;
                document.getElementById('post_cd').value = data.zonecode;
                document.getElementById('dtl_adrs').value = "";
//             document.getElementById('jibun_addr1').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                //if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                //   var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                //   document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                // } else if(data.autoJibunAddress) {
                //      var expJibunAddr = data.autoJibunAddress;
                //     document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                //  } else {
                //       document.getElementById('guide').innerHTML = '';
                //  }
            }
        }).open();
    }

    function updateCust() {
        if ($("#cust_mobile").val() == '') {
            alert("전화번호를 입력해 주세요.");
            return;
        }

        if ($("#natn_code").val() == '') {

            alert("국가를 선택해 주세요.");
            return;
        }
        if ($("#brh_code").val() == '') {

            alert("지점을 선택해 주세요.");
            return;
        }

        if ($("#rcmd_code").val() == '') {
            alert("추천인을 선택해 주세요.");
            return;
        }
// 	if ($("#post_cd").val() == '' || $("#adrs").val() == '') {
// 		alert("주소를 입력해 주세요.");
// 		return;
// 	}

        var data = $("#custForm").serialize();

        var _url = "/admin.cust.update.dp/proc.go";

        postLoadigAjax(_url, data, afterUpdate, true, "");
    }

    function afterUpdate(data) {
        if (data.resultCode > 0) {
            alert(data.resultMsg);
            //해당 값들 초기화
            $("#natn_code").val('');
            $("#brh_code").val('');
            $("#rcmd_code").val('');
            loadFrm("", "custForm", "post", "/admin.cust.list.dp/proc.go");
        } else {
            alert(data.resultMsg);
        }
    }

    function cancel() {
        //해당 값들 초기화
        $("#natn_code").val('');
        $("#brh_code").val('');
        $("#rcmd_code").val('');
        loadFrm("", "custForm", "post", "/admin.cust.list.dp/proc.go");
    }

    function linkPage(idx) {

        if ('${vo.tab_no}' == '1') {
            if (idx <= 0 || idx > '${tradePageSize }') {
                return;
            }
            if ('${tradeVO.pageIndex}' != idx) {
                $("#tradeFrm #pageIndex").val(idx);
                loadFrm("", "tradeFrm", "post", "/admin.cust.detail.dp/proc.go");
            }
        } else if ('${vo.tab_no}' == '2') {
            if (idx <= 0 || idx > '${boardPageSize }') {
                return;
            }
            if ('${boardVO.pageIndex}' != idx) {
                $("#boardFrm #pageIndex").val(idx);
                loadFrm("", "boardFrm", "post", "/admin.cust.detail.dp/proc.go");
            }
        }

    }

    function chkCoin(user_email) {
        var data = {
            "user_email": user_email
        }

        var _url = "/admin.cust.chkCoin.dp/proc.go";
        postLoadigAjax(_url, data, afterChkCoin, true, "");
    }

    function afterChkCoin(data) {
        alert("조회되었습니다.");
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
        var html2 = "";
        var selecter = '${result.brh_code}';
        if (data.chgSelList.length > 0) {
            html += '<option value="" label ="" selected> =전체= </option>'; // =전체= 추가
            data.chgSelList.forEach(function (node, index) {
                if (selecter != '' && node.brh_code == selecter) {
                    html += '<option value="' + node.brh_code + '" selected>' + node.brh_nm + '</option>';
                    chgPlace2(node.brh_code);
                } else {
                    html += '<option value="' + node.brh_code + '">' + node.brh_nm + '</option>';
                }
            });
        } else {
            html += '<option value="" label="=전체="/>';
            html2 += '<option value="" label="=전체="/>';
            $("#rcmd_code").html(html);
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

    // 지점 변경 함수 시작
    function chgPlace2(brh_code) {
        var data = {
            "brh_code": brh_code
        }
        var _url = "/admin.cust.chgBrhCode.dp/proc.go"
        postLoadigAjax(_url, data, afterChgBrhCode, true, "");
    }

    function afterChgBrhCode(data) {
        var list = data.result;
        var html = "";
        var selecter = '${result.rcmd_code}';

        if (data.resultCode > 0) {
            html += '<option value="" label ="" selected> =전체= </option>'; // =전체= 추가
            list.forEach(function (node) {
                //html += '<option value="' + node.rcmd_code + '" label="' + node.rcmd_nm + '"/>'
                if (selecter != '' && node.rcmd_code == selecter) {
                    html += '<option value="' + node.rcmd_code + '" selected>' + node.rcmd_nm + '</option>';
                } else {
                    html += '<option value="' + node.rcmd_code + '">' + node.rcmd_nm + '</option>';
                }
            });
        } else {
            if ('${vo.brh_code}' == '') {
                alert(data.resultMsg);
                html += '<option value="" label="=전체="/>';
            } else {
                html += '<option value="" label="=전체="/>';
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
    <%-- <c:param name="menu_1depth" value="01"></c:param> --%>
    <%-- <c:param name="menu_2depth" value="01"></c:param> --%>
</c:import>
<!--// lnb end -->

<div class="containerWrap">
    <!--// gnb start -->
    <c:import url="/admin.include.inc_gnb.ds/proc.go" charEncoding="utf-8">
        <%-- 	<c:param name="menu_1depth" value="01"></c:param> --%>
    </c:import>
    <!--// gnb end -->
    <div class="container">
        <div class="top clearfix">
            <ul class="menu_dept clearfix">
                <li>회원관리</li>
                <li>회원정보 조회</li>
            </ul>
        </div><!--// top -->

        <div class="cn_wrap">
            <form id="custForm" name="custForm" method="post">
                <input type="hidden" id="user_email" name="user_email" value="${result.user_email }">
                <input type="hidden" id="upt_email" name="upt_email" value="${sessionScope.USER_EMAIL }">
                <div class="table_top">
                    &nbsp;&nbsp;
                    <a href="#n" class="btn_user" style="float: right;margin:0 0 10px 2px;" onclick="updateCust();">저장</a>
                    <a href="#n" class="btn_user" style="float: right;margin-bottom: 10px; background: #1d2b36;" onclick="cancel();">취소</a>
                </div>
                <table>
                    <colgroup>
                        <col width="15%">
                        <col width="35%">
                        <col width="15%">
                        <col width="35%">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>이름</th>
                        <td>
                            ${result.user_nm }
                            <c:choose>
                                <c:when test="${result.kyc_cert_yn == '1'}">
                                    (인증:KYC인증)
                                </c:when>
                                <c:when test="${result.otp_serial != '' }">
                                    (인증:OTP인증)
                                </c:when>
                                <c:when test="${result.cert_yn == 'Y'}">
                                    (인증:계좌인증)
                                </c:when>
                                <c:when test="${result.sms_cert_yn == 'Y'}">
                                    (인증:실명인증)
                                </c:when>
                                <c:when test="${result.email_cert_yn == 'Y'}">
                                    (인증:이메일인증)
                                </c:when>
                                <c:otherwise>
                                    (인증:미인증)
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <th>ID</th>
                        <td>
                            ${result.user_email }
                            <!-- 								<a href="#n" class="btn_r_navy" onclick="" style="float: right;">비밀번호초기화</a> -->
                        </td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>
                            <input type="text" id="user_mobile" name="user_mobile" value="${result.user_mobile }">
                        </td>
                        <th>사용여부</th>
                        <td>
                            <select id="use_yn" name="use_yn">
                                <option value="Y">사용</option>
                                <option value="N">사용안함</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th>환급계좌</th>
                        <c:choose>
                            <c:when test="${result.bank_nm  != ''}">
                                <td>${result.bank_nm }&nbsp;${result.bank_acc_no }(${result.accnt_nm })</td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                        <th>생년월일</th>
                        <td>${result.birth_day }</td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td colspan="3">
                            우편주소 &nbsp; <input type="text" readonly="readonly" value="${result.post_cd }" id="post_cd" name="post_cd"/>
                            <a onclick="javascript:sample4_execDaumPostcode();" class="btn_r_navy">검색</a>
                            <br/><br/>
                            도로명주소 &nbsp;<input type="text" readonly="readonly" id="adrs" name="adrs" class="input_w01" value="${result.adrs }"/><br/><br/>
                            <!-- 							지번주소 &nbsp;&nbsp; <input type="text" readonly="readonly" id="jibun_addr1" name="jibun_addr1" class="input_w01"/><br/><br/> -->
                            나머지주소 &nbsp;<input type="text" id="dtl_adrs" name="dtl_adrs" class="input_w01" value="${result.dtl_adrs }"/><br/><br/>
                        </td>
                    </tr>
                    <tr>
                        <th>가입일</th>
                        <td>${result.reg_dt }</td>
                        <th>수정일(수정자)</th>
                        <c:choose>
                            <c:when test="${result.upt_dt  != ''}">
                                <td>${result.upt_dt }(${result.upt_email })</td>
                            </c:when>
                            <c:otherwise>
                                <td></td>
                            </c:otherwise>
                        </c:choose>
                    </tr>
                    <tr>
                        <th>지점</th>
                        <td>
                            <!--국가-->
                            <select id="natn_code" name="natn_code" style="width:100px" onchange="chgSel();">
                                <c:choose>
                                    <c:when
                                        test="${sessionScope.AUTH_LEVEL_CD == 'L0' or sessionScope.AUTH_LEVEL_CD == 'L1'}">
                                        <option value="" label="=전체="/>
                                        <c:forEach items="${nationList }" var="nationList">
                                            <option value="${nationList.natn_code }" label="${nationList.natn_nm }"/>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${sessionScope.NATN_CODE }" label="${sessionScope.NATN_NM }"/>
                                        <!-- L2, L3, L4 -->
                                    </c:otherwise>
                                </c:choose>
                            </select>
                            <!--지점-->
                            <select id="brh_code" name="brh_code" style="width:100px" onchange="chgPlace();" >
                                <c:choose>
                                    <c:when
                                        test="${sessionScope.AUTH_LEVEL_CD == 'L0' or sessionScope.AUTH_LEVEL_CD == 'L1' or sessionScope.AUTH_LEVEL_CD == 'L2'}">
                                        <option value="" label="=전체="/>
                                        <script>
                                            chgSel();
                                        </script>
                                        <c:forEach items="${placeList }" var="placeList">
                                            <option value="${placeList.brh_code }" label="${placeList.brh_nm }"/>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <option value="${sessionScope.BRH_CODE }" label="${sessionScope.BRH_NM }"/>
                                    </c:otherwise>
                                </c:choose>
                            </select>
                            <select id="rcmd_code" name="rcmd_code" style="width:100px">
                                <option value="" label="=전체="/>
                                <c:forEach items="${recoUserList }" var="recoUserList">
                                    <option value="${recoUserList.rcmd_code }" label="${recoUserList.rcmd_nm }"/>
                                </c:forEach>
                            </select>
                        </td>
                        <th>추천인</th>
                        <td>
                            ${result.rcmd_nm }
                        </td>
                    </tr>
                    <tr>

                        <th>보조이메일</th>
                        <td colspan="3">
                            <input type="text" id="sub_user_email" name="sub_user_email"
                                   value="${result.sub_user_email}"/>
                        </td>
                    </tr>

                    </tbody>

                </table>
            </form>

            <div class="tabWrap">
                <ul class="tabNav clearfix">
                    <li class="current"><a href="#n" onClick="fnNext(0)">자산현황</a></li>
                    <li><a href="#n" onClick="fnNext(1)">거래내역</a></li>
                    <li><a href="#n" onClick="fnNext(2)">1:1문의</a></li>
                    <!-- 					<li><a href="#n" onClick="fnNext(3)">접속 정보</a></li> -->
                    <!-- 					<li><a href="#n" onClick="fnNext(4)">부가서비스</a></li>						 -->
                    <li><a href="#n" onClick="fnNext(5)">전자지갑 주소</a></li>
                   <%-- <li><a href="#n" onClick="fnNext(6)">처리 내역</a></li>--%>
                </ul>
                <div class="tabCnWrap pb20">
                    <form id="assetFrm" name="assetFrm" method="post">
                        <input type="hidden" id="tab_no" name="tab_no" value="0">
                        <input type="hidden" id="user_email" name="user_email" value="${result.user_email }">
                        <!-- tabCn0 -->
                        <div class="current tabContent" id="tabCn0">
                            <div class="cn_wrap">
                                <div class="table_top" style="margin-top:20px;">
                                    <span class="table_sbj">자산현황</span>
                                </div>
                                <div class="asset_status table_list clearfix">
                                    <table>
                                        <thead>
                                        <tr>
                                            <td style="background-color: #e9e9e9;"></td>
                                            <td class="th" style="background-color: #e9e9e9;">출금가능</td>
                                            <td class="th" style="background-color: #e9e9e9;">거래중</td>
                                            <td class="th" style="background-color: #e9e9e9;">합계</td>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${assetList }" var="list" varStatus="idx">
                                            <tr>
                                                <td class="th" style="background-color: #e9e9e9;">
                                                   <%--
                                                    <c:choose>
                                                        <c:when test="${list.curcyCd == 'CMMC00000000204' }">
                                                            USD
                                                        </c:when>
                                                        <c:when test="${list.curcyCd == 'CMMC00000000205' }">
                                                            BTC
                                                        </c:when>
                                                        <c:when test="${list.curcyCd == 'CMMC00000000206' }">
                                                            ETH
                                                        </c:when>
                                                        <c:when test="${list.curcyCd == 'CMMC00000000207' }">
                                                            BCH
                                                        </c:when>
                                                        <c:when test="${list.curcyCd == 'CMMC00000000208' }">
                                                            XRP
                                                        </c:when>
                                                        <c:when test="${list.curcyCd == 'CMMC00000000685' }">
                                                            SGC
                                                        </c:when>
                                                    </c:choose>
                                                   --%>
                                                     ${list.curcyNm }
                                                </td>
                                                <td class="th">
                                                    <c:choose>
                                                        <c:when test="${list.curcyCd == 'CMMC00000000204' }">
                                                            <fmt:formatNumber value="${list.posCnPrc }" pattern="#,###"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${list.posCnAmt }
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="th">
                                                    <c:choose>
                                                        <c:when test="${list.curcyCd == 'CMMC00000000204' }">
                                                            <fmt:formatNumber value="${list.impCnPrc }" pattern="#,###"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${list.impCnAmt }
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="th">
                                                    <c:choose>
                                                        <c:when test="${list.curcyCd == 'CMMC00000000204' }">
                                                            <fmt:formatNumber value="${list.kwdPrc }" pattern="#,###"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            ${list.totCoinAmt }
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div><!-- //tabCn0 -->
                    </form>

                    <form id="tradeFrm" name="tradeFrm" method="post">
                        <input type="hidden" id="tab_no" name="tab_no" value="1">
                        <input type="hidden" id="user_email" name="user_email" value="${result.user_email }">
                        <div id="tabCn1" class="tabContent"><!-- tabCn1 -->
                            <div class="cn_wrap">
                                <div class="table_top" style="margin-top:20px;">
                                    <span class="table_sbj">거래내역</span>
                                </div>
                                <table class="horizon_tbl">
                                    <colgroup>
                                        <col width="15%"></col>
                                        <col width="40%"></col>
                                        <col width="15%"></col>
                                        <col width="30%"></col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th>등록일</th>
                                        <td colspan="3">
												<span class="input_cal">
													<input type="text" id="sdate" name="sdate" readonly value="${tradeVO.searchBgnDe}">
												</span>~
                                            <span class="input_cal">
													<input type="text" id="rdate" name="rdate" readonly value="${tradeVO.searchEndDe}">
												</span>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(0, 0, 0)">오늘</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(0, 7, 1)">7일</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(0, 15, 2)">15일</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(1, 0, 3)">1개월</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(3, 0, 4)">3개월</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate('all', 0, 5)">전체</a>
                                            <input type="hidden" id="searchBgnDe" name="searchBgnDe" value="${tradeVO.searchBgnDe}"/>
                                            <input type="hidden" id="searchEndDe" name="searchEndDe" value="${tradeVO.searchEndDe}"/>
                                            <input type="hidden" id="funcNm" name="funcNm" value=""/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>구분</th>
                                        <td>
                                            <select id="hisCode" name="hisCode">
                                                <option value="" label="=전체="/>
                                                <option value="CMMC00000000196" label="충전"/>
                                                <option value="CMMC00000000200" label="송금"/>
                                                <option value="CMMC00000000201" label="입금"/>
                                                <option value="CMMC00000000199" label="출금"/>
                                                <option value="CMMC00000000197" label="구매"/>
                                                <option value="CMMC00000000198" label="판매"/>
                                                <option value="CMMC00000000202" label="기타"/>
                                            </select>
                                        </td>
                                        <th>상태</th>
                                        <td>
                                            <select id="orderState" name="orderState">
                                                <option value="CMMC00000000213" label="완료"/>
                                                <option value="CMMC00000000214" label="처리중"/>
                                            </select>
                                            <a href="#n" class="btn_c dis_b mt0" style="float: right;"
                                               onclick="goSearch(1);">검 색</a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="cn_wrap srch_result">
                                    <table style="margin-top:20px;">
                                        <c:choose>
                                            <c:when test="${tradeVO.orderState == 'CMMC00000000213' }">
                                                <colgroup>
                                                    <col width="5%"></col>
                                                    <col width="5%"></col>
                                                    <col width="13%"></col>
                                                    <col width="11%"></col>
                                                    <col width="5%"></col>
                                                    <col width="15%"></col>
                                                    <col width="11%"></col>
                                                    <col width="13%"></col>
                                                    <col width="13%"></col>
                                                    <col width="15%"></col>
                                                </colgroup>
                                                <thead>
                                                <tr>
                                                    <th>NO</th>
                                                    <th>구분</th>
                                                    <th>완료일시</th>
                                                    <th>내용</th>
                                                    <th>통화</th>
                                                    <th>수량</th>
                                                    <th>거래가</th>
                                                    <th>금액</th>
                                                    <th>수수료</th>
                                                    <th>거래내용</th>
                                                </tr>
                                                </thead>
                                            </c:when>
                                        </c:choose>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty tradeList }">
                                                <tr>
                                                    <td colspan="10">데이터가 없습니다.</td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${tradeVO.orderState == 'CMMC00000000213' }">
                                                        <c:forEach items="${tradeList }" var="list" varStatus="idx">
                                                            <tr>
                                                                <td>${(tradeVO.pageIndex - 1) * tradeVO.pageUnit + idx.count}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${list.exFlag == 'B' }">
                                                                            구매
                                                                        </c:when>
                                                                        <c:when test="${list.exFlag == 'S' }">
                                                                            판매
                                                                        </c:when>
                                                                        <c:when test="${list.exFlag == 'C' }">
                                                                            충전
                                                                        </c:when>
                                                                    </c:choose>
                                                                </td>
                                                                <td>${list.regDate }</td>
                                                                <td>
                                                                        ${list.orderDesc }
                                                                    <c:if test="${list.exFlag == 'C' }">
                                                                        (${list.payKndNm })
                                                                    </c:if>
                                                                </td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${list.curcyCd == 'CMMC00000000205' }">
                                                                            BTC
                                                                        </c:when>
                                                                        <c:when test="${list.curcyCd == 'CMMC00000000206' }">
                                                                            ETH
                                                                        </c:when>
                                                                        <c:when test="${list.curcyCd == 'CMMC00000000207' }">
                                                                            BCH
                                                                        </c:when>
                                                                        <c:when test="${list.curcyCd == 'CMMC00000000208' }">
                                                                            XRP
                                                                        </c:when>
                                                                        <c:when test="${list.curcyCd == 'CMMC00000000204' }">
                                                                            USD
                                                                        </c:when>
                                                                        <c:when test="${list.curcyCd == 'CMMC00000000685' }">
                                                                            SGC
                                                                        </c:when>
                                                                        <c:when test="${list.curcyCd == 'CMMC00000000926' }">
                                                                            BTG
                                                                        </c:when>
                                                                        <c:when test="${list.curcyCd == 'CMMC00000000451' }">
                                                                            QTUM
                                                                        </c:when>
                                                                        <c:when test="${list.curcyCd == 'CMMC00000000928' }">
                                                                            LTC
                                                                        </c:when>
                                                                        <c:when test="${list.curcyCd == 'CMMC00000000927' }">
                                                                            DASH
                                                                        </c:when>

                                                                    </c:choose>
                                                                </td>
                                                                <td>${list.cnAmt }</td>
                                                                <td>
                                                                    <fmt:formatNumber value="${list.tradePrc }" pattern="#,###"/>
                                                                </td>
                                                                <td>
                                                                    <fmt:formatNumber value="${list.totPrc }" pattern="#,###"/>
                                                                </td>
                                                                <td>${list.fee }</td>
                                                                <td></td>
                                                            </tr>
                                                        </c:forEach>
                                                    </c:when>
                                                </c:choose>
                                            </c:otherwise>
                                        </c:choose>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- 페이징처리 -->
                                <fmt:parseNumber var="firstPage" value="${(tradeVO.pageIndex -1) / 10}"
                                                 integerOnly="true"/>
                                <fmt:parseNumber var="firstPage" value="${firstPage * 10 + 1}" integerOnly="true"/>
                                <fmt:parseNumber var="lastPage" value="${firstPage + tradeVO.pageSize - 1}"
                                                 integerOnly="true"/>
                                <c:if test="${lastPage > tradePageSize}">
                                    <c:set var="lastPage" value="${tradePageSize}"/>
                                </c:if>
                                <div class="pagingWrap">
                                    <a href="n" class="page first" onclick="linkPage(${firstPage});return false;">first</a>&nbsp;
                                    <a href="n" class="page prev" onclick="linkPage(${tradeVO.pageIndex - 1});return false;">first</a>&nbsp;
                                    <c:forEach var="i" begin="${firstPage }" end="${lastPage}" varStatus="idx">
                                        <a onclick="linkPage(${idx.index});return false;"><span class="page <c:if test='${idx.index eq tradeVO.pageIndex}'>active</c:if>">${idx.index }</span></a>&nbsp;
                                    </c:forEach>
                                    <a href="n" class="page next" onclick="linkPage(${tradeVO.pageIndex + 1});return false;">last</a>&nbsp;
                                    <a href="n" class="page last" onclick="linkPage(${lastPage});return false;">last</a>&nbsp;
                                </div>
                                <input type="hidden" name="pageIndex" id="pageIndex" value="${tradeVO.pageIndex }">
                            </div>
                        </div><!-- //tabCn1 -->
                    </form>

                    <form id="boardFrm" name="boardFrm" method="post">
                        <input type="hidden" id="tab_no" name="tab_no" value="2">
                        <input type="hidden" id="user_email" name="user_email" value="${result.user_email }">
                        <!-- tabCn2 -->
                        <div id="tabCn2" class="tabContent">
                            <div class="cn_wrap">
                                <div class="table_top" style="margin-top:20px;">
                                    <span class="table_sbj">1:1문의</span>
                                </div>
                                <table class="horizon_tbl">
                                    <colgroup>
                                        <col width="15%"></col>
                                        <col width="40%"></col>
                                        <col width="15%"></col>
                                        <col width="30%"></col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th>등록일</th>
                                        <td>
                                            <span class="input_cal">
                                                <input type="text" id="sdate2" name="sdate2" readonly value="${boardVO.searchBgnDe}">
                                            </span>~
                                            <span class="input_cal">
                                                <input type="text" id="rdate2" name="rdate2" readonly value="${boardVO.searchEndDe}">
                                            </span>
                                            <br/>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(0, 0, 0)">오늘</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(0, 7, 1)">7일</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(0, 15, 2)">15일</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(1, 0, 3)">1개월</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(3, 0, 4)">3개월</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate('all', 0, 5)">전체</a>
                                            <input type="hidden" id="searchBgnDe" name="searchBgnDe" value="${boardVO.searchBgnDe }"/>
                                            <input type="hidden" id="searchEndDe" name="searchEndDe" value="${boardVO.searchEndDe }"/>
                                            <input type="hidden" id="funcNm" name="funcNm" value=""/>
                                        </td>
                                        <th>
                                            답변상태
                                        </th>
                                        <td>
                                            <select>
                                                <option value="" label="=전체="/>
                                                <option value="" label="답변대기"/>
                                                <option value="" label="답변완료"/>
                                            </select>
                                            <a href="#n" class="btn_c dis_b mt0" style="float: right;">검 색</a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="cn_wrap srch_result">
                                    <table style="margin-top:20px;">
                                        <colgroup>
                                            <col width="5%"></col>
                                            <col width="30%"></col>
                                            <col width="20%"></col>
                                            <col width="20%"></col>
                                            <col width="15%"></col>
                                            <col width="10%"></col>
                                        </colgroup>
                                        <thead>
                                        <tr>
                                            <th>NO</th>
                                            <th>제목</th>
                                            <th>작성일</th>
                                            <th>작성자</th>
                                            <th>답변상태</th>
                                            <th>삭제여부</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                            <c:when test="${empty boardList }">
                                                <tr>
                                                    <td colspan="6">
                                                        데이터가 없습니다.
                                                    </td>
                                                </tr>
                                            </c:when>
                                            <c:otherwise>
                                                <c:forEach items="${boardList }" var="list" varStatus="idx">
                                                    <tr>
                                                        <td>${(vo.pageIndex - 1) * vo.pageUnit + idx.count}</td>
                                                        <td>${list.board_title }</td>
                                                        <td>${list.reg_dt }</td>
                                                        <td>${list.reg_user }</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${list.reply_yn == 'Y' }">
                                                                    답변완료
                                                                </c:when>
                                                                <c:when test="${list.reply_yn == 'N' }">
                                                                    답변대기
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${list.use_yn == 'Y' }">

                                                                </c:when>
                                                                <c:when test="${list.use_yn == 'N' }">
                                                                    삭제
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:otherwise>
                                        </c:choose>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- 페이징처리 -->
                                <fmt:parseNumber var="firstPage" value="${(boardVO.pageIndex -1) / 10}" integerOnly="true"/>
                                <fmt:parseNumber var="firstPage" value="${firstPage * 10 + 1}" integerOnly="true"/>
                                <fmt:parseNumber var="lastPage" value="${firstPage + boardVO.pageSize - 1}" integerOnly="true"/>
                                <c:if test="${lastPage > boardPageSize}">
                                    <c:set var="lastPage" value="${boardPageSize}"/>
                                </c:if>
                                <div class="pagingWrap">
                                    <a href="n" class="page first" onclick="linkPage(${firstPage});return false;">first</a>&nbsp;
                                    <a href="n" class="page prev" onclick="linkPage(${boardVO.pageIndex - 1});return false;">first</a>&nbsp;
                                    <c:forEach var="i" begin="${firstPage }" end="${lastPage}" varStatus="idx">
                                        <a onclick="linkPage(${idx.index});return false;"><span
                                            class="page <c:if test='${idx.index eq boardVO.pageIndex}'>active</c:if>">${idx.index }</span></a>&nbsp;
                                    </c:forEach>
                                    <a href="n" class="page next" onclick="linkPage(${boardVO.pageIndex + 1});return false;">last</a>&nbsp;
                                    <a href="n" class="page last" onclick="linkPage(${lastPage});return false;">last</a>&nbsp;
                                </div>
                                <input type="hidden" name="pageIndex" id="pageIndex" value="${boardVO.pageIndex }">
                            </div>
                        </div>
                        <!-- //tabCn2	 -->
                    </form>

                    <form id="joinFrm" name="joinFrm" method="post">
                        <input type="hidden" id="tab_no" name="tab_no" value="3">
                        <input type="hidden" id="user_email" name="user_email" value="${result.user_email }">
                        <!-- tabCn3 -->
                        <div id="tabCn3" class="tabContent">
                            <div class="cn_wrap">
                                <div class="table_top" style="margin-top:20px;">
                                    <span class="table_sbj">접속정보</span>
                                </div>
                                <table class="horizon_tbl">
                                    <colgroup>
                                        <col width="15%"></col>
                                        <col width="80%"></col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th>기간</th>
                                        <td>
                                            <span class="input_cal">
                                                <input type="text" id="sdate" name="sdate" readonly value="${searchVO.searchBgnDe}">
                                            </span>~
                                            <span class="input_cal">
                                                <input type="text" id="rdate" name="rdate" readonly value="${searchVO.searchEndDe}">
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
                                            <a href="#n" class="btn_c dis_b mt0" style="float: right;">검 색</a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>

                                <table class="horizon_tbl" style="margin-top:20px;">
                                    <colgroup>
                                        <col width="5%"></col>
                                        <col width="15%"></col>
                                        <col width="15%"></col>
                                        <col width="15%"></col>
                                        <col width="15%"></col>
                                        <col width="15%"></col>
                                        <col width="15%"></col>
                                        <col width="5%"></col>
                                    </colgroup>
                                    <thead>
                                    <th>NO</th>
                                    <th>일시</th>
                                    <th>기종</th>
                                    <th>브라우저</th>
                                    <th>서비스 이용</th>
                                    <th>IP</th>
                                    <th>위치</th>
                                    <th>결과</th>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>2017-07-25 09:50:31</td>
                                        <td>Unknown Windows OS</td>
                                        <td>Chrome 59.0.3071.115</td>
                                        <td>로그아웃</td>
                                        <td>1.223.21.114</td>
                                        <td>Korea, Republic of</td>
                                        <td>성공
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>2017-07-25 09:48:31</td>
                                        <td>Unknown Windows OS</td>
                                        <td>Chrome 59.0.3071.115</td>
                                        <td>로그인</td>
                                        <td>1.223.21.114</td>
                                        <td>Korea, Republic of</td>
                                        <td>성공
                                        </th>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="pagingWrap">
                                    <a href="#" class="page first" onclick="linkPage(1);return false;">first</a>&nbsp;
                                    <span class="page active">1</span>&nbsp;
                                    <a href="#" class="page last" onclick="linkPage(1);return false;">last</a>&nbsp;
                                </div>
                            </div>
                        </div>
                        <!-- //tabCn3 -->
                    </form>

                    <form id="additionFrm" name="additionFrm" method="post">
                        <input type="hidden" id="tab_no" name="tab_no" value="4">
                        <input type="hidden" id="user_email" name="user_email" value="${result.user_email }">
                        <!-- tabCn4 -->
                        <div id="tabCn4" class="tabContent">
                            <div class="cn_wrap">
                                <div class="table_top" style="margin-top:20px;">
                                    <span class="table_sbj">부가서비스</span>
                                </div>
                                <table class="horizon_tbl">
                                    <colgroup>
                                        <col width="15%"></col>
                                        <col width="40%"></col>
                                        <col width="15%"></col>
                                        <col width="30%"></col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th>가입일</th>
                                        <td>
                                            <span class="input_cal">
                                                <input type="text" id="sdate" name="sdate" readonly value="${searchVO.searchBgnDe}">
                                            </span>~
                                            <span class="input_cal">
                                                <input type="text" id="rdate" name="rdate" readonly value="${searchVO.searchEndDe}">
                                            </span>
                                            <br/>
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
                                        <th>
                                            부가서비스명
                                        </th>
                                        <td>
                                            <select>
                                                <option value="" label="=전체="/>
                                                <option/>
                                                자동거래</option>
                                                <option/>
                                                시세알림</option>
                                                <option/>
                                                수수료쿠폰</option>
                                            </select>
                                            <a href="#n" class="btn_c dis_b mt0" style="float: right;">검 색</a>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>

                                <table class="horizon_tbl" style="margin-top:20px;">
                                    <colgroup>
                                        <col width="5%"></col>
                                        <col width="30%"></col>
                                        <col width="20%"></col>
                                        <col width="20%"></col>
                                        <col width="15%"></col>
                                        <col width="10%"></col>
                                    </colgroup>
                                    <thead>
                                    <th>NO</th>
                                    <th>부가서비스명</th>
                                    <th>이용료</th>
                                    <th>가입일</th>
                                    <th>해지일</th>
                                    <th>상태</th>
                                    </thead>
                                    <tbody>
                                    <td>1</td>
                                    <td>자동거래</td>
                                    <td>10,000USD</td>
                                    <td>2017-07-24 11:11:11</td>
                                    <td></td>
                                    <td>사용</td>
                                    </tbody>
                                </table>
                                <div class="pagingWrap">
                                    <a href="#" class="page first" onclick="linkPage(1);return false;">first</a>&nbsp;
                                    <span class="page active">1</span>&nbsp;
                                    <a href="#" class="page last" onclick="linkPage(1);return false;">last</a>&nbsp;
                                </div>
                            </div>
                        </div>
                        <!-- //tabCn4 -->
                    </form>

                    <form id="walletFrm" name="walletFrm" method="post">
                        <input type="hidden" id="tab_no" name="tab_no" value="5">
                        <input type="hidden" id="user_email" name="user_email" value="${result.user_email }">
                        <!-- tabCn5 -->
                        <div id="tabCn5" class="tabContent">
                            <div class="cn_wrap">
                                <div class="table_top" style="margin-top:20px;">
                                    <span class="table_sbj">전자지갑 주소</span>
                                </div>
                                <div class="cn_wrap srch_result">
                                    <table>
                                        <%--<thead>
                                        <tr>
                                            <th colspan="${fn:length(coreData.list)}" class="tc">전자지갑주소</th>
                                        </tr>
                                        <tr>
                                            <c:forEach var="coreData" items="${coreData.list}">
                                                <th>${coreData.curcyCd}</th>
                                            </c:forEach>
                                        </tr>
                                        </thead>
                                        <col width="20%">
                                        <tbody>
                                        <tr>
                                            <c:forEach var="coreData" items="${coreData.list}">
                                                <td>${coreData.accNo}</td>
                                            </c:forEach>
                                        </tr>
                                        </tbody>
--%>
                                        <colgroup>
                                            <col width="5%">
                                            <col width="20%">
                                            <col width="35%">
                                            <col width="20%">
                                        </colgroup>
                                        <tr>
                                            <th>NO</th>
                                            <th>코인명</th>
                                            <th>주소</th>
                                            <th>생성일</th>
                                            <th>코인확인</th>
                                        </tr>
                                        </thead>
                                         <tbody>
                                         <c:forEach items="${walletList }" var="list" varStatus="idx">
                                             <tr>
                                                 <td>${idx.count }</td>
                                                 <td>
                                                     <%--
                                                     <c:choose>
                                                         <c:when test="${list.curcyCd == 'CMMC00000000205' }">
                                                             비트코인(BTC)
                                                         </c:when>
                                                         <c:when test="${list.curcyCd == 'CMMC00000000206' }">
                                                             이더리움(ETH)
                                                         </c:when>
                                                         <c:when test="${list.curcyCd == 'CMMC00000000207' }">
                                                             비트코인캐시(BCH)
                                                         </c:when>
                                                         <c:when test="${list.curcyCd == 'CMMC00000000208' }">
                                                             리플(XRP)
                                                         </c:when>
                                                         <c:when test="${list.curcyCd == 'CMMC00000000685' }">
                                                             스타그램(SGC)
                                                         </c:when>
                                                     </c:choose>
                                                     --%>
                                                         ${list.curcyNm }
                                                 </td>
                                                 <td>${list.wlet_adr }<br/>${list.desti_tag }</td>
                                                 <td>${list.reg_dt }</td>
                                                 <td>
                                                     <a href="#n" class="btn_r_navy" onclick="chkCoin('${result.user_email}');">코인확인</a>
                                                 </td>
                                             </tr>
                                         </c:forEach>
                                         </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- //tabCn5 -->
                    </form>
                    <form id="processFrm" name="processFrm" method="post">
                        <input type="hidden" id="tab_no" name="tab_no" value="6">
                        <input type="hidden" id="user_email" name="user_email" value="${result.user_email }">
                        <!-- tabCn6 -->
                        <div id="tabCn6" class="tabContent">
                            <div class="cn_wrap">
                                <div class="table_top" style="margin-top:20px;">
                                    <span class="table_sbj">처리 내역</span>
                                </div>
                                <table class="horizon_tbl">

                                    <tbody>
                                    <tr>
                                        <th>처리일</th>
                                        <td >
                                            <span class="input_cal">
                                                <input type="text" id="sdate3" name="sdate3" readonly value="${vo.searchBgnDe}">
                                            </span>~
                                            <span class="input_cal">
                                                <input type="text" id="rdate3" name="rdate3" readonly value="${vo.searchEndDe}">
                                            </span>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(0, 0, 0)">오늘</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(0, 7, 1)">7일</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(0, 15, 2)">15일</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(1, 0, 3)">1개월</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate(3, 0, 4)">3개월</a>
                                            <a class="btn_r_navy dateSet" onclick="fnsetDate('all', 0, 5)">전체</a>
                                            <input type="hidden" id="searchBgnDe" name="searchBgnDe" value="${vo.searchBgnDe}"/>
                                            <input type="hidden" id="searchEndDe" name="searchEndDe" value="${vo.searchEndDe}"/>
                                            <input type="hidden" id="funcNm" name="funcNm" value=""/>
                                        </td>
                                        <th>검색어</th>
                                        <td>
                                            <select id="schKey" name="schKey">
                                                <option value="" label="=전체="/>
                                                <option value="01" label="처리자"/>
                                            </select>
                                            <input type="text" id="schWrd" name="schWrd" style="width: 300px;" value="${vo.searchWrd }">
                                            <a href="javascript:goSch()" class="btn_c dis_b" style="float: right" >검 색</a>
                                        </td>
                                    </tr>
                                    </tbody>

                                </table>
                                <div class="cn_wrap srch_result">
                                    <table>
                                        <colgroup>
                                            <col width="5%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="20%">
                                            <col width="35%">
                                        <thead>
                                        <tr>
                                            <th>NO</th>
                                            <th>처리일</th>
                                            <th>처리자</th>
                                            <th>처리이력</th>
                                            <th>처리사유</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:choose>
                                        <c:when test="${empty ProcessList }">
                                            <tr>
                                                <td colspan="5">
                                                    데이터가 없습니다.
                                                </td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                        <c:forEach items="${ProcessList }" var="ProcessList" varStatus="idx">
                                            <tr>
                                                <td>${(vo.pageIndex - 1) * vo.pageUnit + idx.count}</td>
                                                <td>${ProcessList.user_ctl_dt }</td>
                                                <td>${ProcessList.upt_email }</td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${ProcessList.user_ctl_code == '01' }">
                                                            계정잠금
                                                        </c:when>
                                                        <c:when test="${ProcessList.user_ctl_code == '02' }">
                                                            계정잠금해제
                                                        </c:when>
                                                        <c:when test="${ProcessList.user_ctl_code == '03' }">
                                                            사용안함
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td>${ProcessList.ctl_msg }</td>
                                            </tr>
                                        </c:forEach>
                                        </c:otherwise>
                                        </c:choose>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- 페이징처리 -->
                            <fmt:parseNumber var="firstPage" value="${(vo.pageIndex -1) / 10}" integerOnly="true"/>
                            <fmt:parseNumber var="firstPage" value="${firstPage * 10 + 1}" integerOnly="true"/>
                            <fmt:parseNumber var="lastPage" value="${firstPage + vo.pageSize - 1}" integerOnly="true"/>
                            <c:if test="${lastPage > processPageSize}">
                                <c:set var="lastPage" value="${processPageSize}"/>
                            </c:if>
                            <div class="pagingWrap">
                                <a href="n" class="page first" onclick="linkPage(${firstPage});return false;">first</a>&nbsp;
                                <a href="n" class="page prev" onclick="linkPage(${vo.pageIndex - 1});return false;">first</a>&nbsp;
                                <c:forEach var="i" begin="${firstPage }" end="${lastPage}" varStatus="idx">
                                    <a onclick="linkPage(${idx.index});return false;">
                                        <span class="page <c:if test='${idx.index eq vo.pageIndex}'>active</c:if>">${idx.index }</span>
                                    </a>&nbsp;
                                </c:forEach>
                                <a href="n" class="page next" onclick="linkPage(${vo.pageIndex + 1});return false;">last</a>&nbsp;
                                <a href="n" class="page last" onclick="linkPage(${lastPage});return false;">last</a>&nbsp;
                            </div>
                            <input type="hidden" name="pageIndex" id="pageIndex" value="${vo.pageIndex }">
                        </div>
                </div>
                <!-- //tabCn6 -->
                </form>
            </div><!--// tabCnWrap -->
        </div><!-- //tabWrap -->
    </div><!-- //cn_wrap -->
</div>

</div><!--// containerWrap -->

</body>
</html>