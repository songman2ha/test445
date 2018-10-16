<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<%-- <c:import url="/bitkrx.front.include.common_front_head.ds/proc.go" charEncoding="utf-8" /> --%>

<style type="text/css">
    body {background: #f8f8f8;}

    .errorWrap {position: absolute; width: 600px; height: 211px; top: 50%; left: 50%; margin: -105px 0 0 -300px;}

    .leftSec_top {float: left; font-size: 26px; font-weight: bold;}
    .leftSec_top img {display: block; margin: 0 0 15px 0;}
    .txt_mo {display: none;}

    .rightSec_top {float: right;}
    .errorNum {font-size: 74px; font-weight: bold;}
    .errorTxt {text-align: right; letter-spacing: 10px; font-size: 19px; font-weight: bold; color: #adadad;}

    .bttmSec {clear: both; border-top: 2px solid #c6c6c6; margin-top: 20px; padding-top: 20px;}
    
    .leftSec_bttm {float: left; box-sizing: border-box; width: 60%; padding-right: 10px;}
    .leftSec_bttm p {width: 100%; font-size: 15px;}

    .rightSec_bttm {float: right; box-sizing: border-box; width: 40%; padding-left: 10px;}
    .rightSec_bttm a {display: block; width: 100%; height: 50px; line-height: 50px; text-align: center; border-radius: 10px; color: #fff; font-size: 18px; background: #fc553a;}

    /*
    @DATE : 2017-07-05
    @WRITER : yejin.choi
    @COMMNET: 반응형으로 제작
    */
    /* Tablet */
    @media all and (min-width:768px) and (max-width:1024px) {
    
    }

    /* Mobile */
    @media all and (max-width: 650px){
        .errorWrap {position: relative; box-sizing: border-box; width: 100%; height: auto; top: 0; left: 0; padding: 20% 20px 0; margin: 0;}

        .topSec {text-align: center;}
        .leftSec_top {float: none; font-size: 15px;}
        .leftSec_top img {display: none;}
        .txt_mo {display: block; border-top: 2px solid #c6c6c6; margin-top: 20px; padding-top: 20px;}
        .txt_pc {display: none;}

        .rightSec_top {float: none;}
        .errorNum {font-size: 74px; font-weight: bold;}
        .errorTxt {text-align: center; letter-spacing: 10px; font-size: 19px; font-weight: bold; color: #adadad;}

        .bttmSec {clear: both; border: none; padding-top: 0; margin-top: 0}
        
        .leftSec_bttm {float: none; box-sizing: border-box; width: 100%; padding-right: 0;}
        .leftSec_bttm p {width: 100%; padding: 10px 0; font-size: 13px; color: #999;}

        .rightSec_bttm {float: none; box-sizing: border-box; width: 100%; padding-left: 0;}
        .rightSec_bttm a {display: block; width: 100%; height: 50px; line-height: 50px; text-align: center; border-radius: 10px; color: #fff; font-size: 18px; background: #fc553a;}
    }
    
</style>
</head>
<body>
<div class="errorWrap clearfix">
    <div class="topSec clearfix">
        <div class="rightSec_top">
            <p class="errorNum">${exceptionVO.errorStatusCode }</p>
            <p class="errorTxt">ERROR</p>
        </div>
        <div class="leftSec_top">
            <img src="/images/admin/img_caution.png">
            <span class="txt_pc">
                        요청하신 페이지는<br/>
                         존재하지 않는 페이지입니다.
            </span>
            <span class="txt_mo">요청하신 페이지는 존재하지 않는 페이지입니다.</span>
        </div>
    </div>

    <div class="bttmSec clearfix">
        <div class="leftSec_bttm">
            <p>
                페이지의 주소가 잘못 입력되었거나,
                주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다.
                입력하신 주소가 정확한지 다시 한번 확인해주시기 바랍니다.
            </p>
        </div>
        <div class="rightSec_bttm">
            <a href="javascript:fncGoAfterErrorPage();">이전 페이지 돌아가기</a>
        </div>
    </div>
</div>
</body>
</html>