<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <c:import url="/admin.include.common_admin_head.ds/proc.go" charEncoding="utf-8"/>
</head>
<script type="text/javaScript" language="javascript" defer="defer">

</script>
<body>

<!--// lnb start -->
<c:import url="/admin.include.inc_lnb.ds/proc.go" charEncoding="utf-8">
    <c:param name="menu_1depth" value="07"></c:param>
    <c:param name="menu_2depth" value="01"></c:param>
</c:import>
<!--// lnb end -->
<div class="containerWrap">
    <!--// gnb start -->
    <c:import url="/admin.include.inc_gnb.ds/proc.go" charEncoding="utf-8">
        <c:param name="menu_1depth" value="07"></c:param>
        <c:param name="menu_2depth" value="01"></c:param>
    </c:import>
    <!--// gnb end -->
    <div class="container">
        <div class="top clearfix">
            <ul class="menu_dept clearfix">
                <li>공통관리</li>
                <li>총판관리</li>
            </ul>
        </div><!--// top -->

        <form name="placeFrm" id="placeFrm" method="post">
            <%--<input type="hidden" id="brh_code" name="brh_code">--%>
            <div class="current tabContent" id="tabCn0">
                <div class="cn_wrap">
                    <div class="table_top">
                        <span class="table_sbj">검색</span>
                        <a href="#n" class="btn_user" style="float: right;margin-bottom: 10px;"
                           onclick="insertPlace();">지점등록</a>
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
                            <th>국가</th>
                            <td>
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
                                        <c:when
                                            test="${sessionScope.AUTH_LEVEL_CD == 'L0' or sessionScope.AUTH_LEVEL_CD == 'L1' or sessionScope.AUTH_LEVEL_CD == 'L2'}">
                                            <option value="" label="전체"/>
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
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <a href="javascript:goSearch()" class="btn_c dis_b">검 색</a>
                </div>
                <div class="cn_wrap srch_result">
                    <table>
                        <colgroup>
                            <col width="3%">
                            <col width="8%">
                            <col width="8%">
                            <col width="13%">
                            <col width="14%">
                            <col width="10%">
                            <col width="12%">
                            <col width="14%">
                            <col width="14%">
                            <col width="15%">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>NO</th>
                            <th>국가</th>
                            <th>지점코드</th>
                            <th>지점명</th>
                            <th>영문명</th>
                            <th>담당자</th>
                            <th>전화번호</th>
                            <th>주소</th>
                            <th>등록일</th>
                            <th>사용여부</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${empty list }">
                                <tr>
                                    <td colspan="7">
                                        데이터가 없습니다.
                                    </td>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${list }" var="list" varStatus="idx">
                                    <tr>
                                        <td>
                                                ${(vo.pageIndex - 1) * 10 + idx.count}
                                        </td>
                                        <td>
                                                ${list.natn_nm }
                                        </td>
                                        <td>
                                                ${list.brh_code }
                                        </td>
                                        <td class="tbl_link">
                                            <a href="#n" onclick="fnEdit('${list.brh_code}','${list.natn_code}');">
                                                    ${list.brh_nm }
                                            </a>
                                        </td>
                                        <td>
                                                ${list.brh_nm_en }
                                        </td>
                                        <td>
                                                ${list.mngr_nm }
                                        </td>
                                        <td>
                                                ${list.tel_no }
                                        </td>
                                        <td>
                                                ${list.addr1 }
                                        </td>
                                        <td>
                                                ${list.reg_dt }
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${list.use_yn == 'Y' }">
                                                    사용
                                                </c:when>
                                                <c:otherwise>
                                                    미사용
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                        </tbody>

                    </table>
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

</body>
</html>