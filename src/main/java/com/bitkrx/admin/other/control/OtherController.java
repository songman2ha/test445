/**
 * 씨엠이 소프트 자체 프로젝트 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)씨엠이소프트
 * CopyRight 씨엠이소프트 - 2017
 */
package com.bitkrx.admin.other.control;

import com.bitkrx.admin.other.vo.*;
import com.bitkrx.config.control.CmeDefaultExtendController;
import com.bitkrx.config.mail.MailSenderImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;


/**
 * @프로젝트명 : cme.web.adexbeone
 * @패키지 : com.web.exbeone.admin.other.control
 * @클래스명 : cme.web.adexbeone
 * @작성자 : (주)씨엠이소프트 임승연
 * @작성일 : 2017. 9. 21.
 */
@Controller
@RequestMapping(value = "/admin")
public class OtherController extends CmeDefaultExtendController {

    @Autowired
    MailSenderImpl mailSender;

    /**
     * @param vo
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     * @Method Name  : placeList
     * @작성일 : 2018. 3. 12.
     * @작성자 :  (주)씨엠이소프트 박상웅
     * @변경이력 :
     * @Method 설명 : 지점관리리스트
     */
    @RequestMapping("/other/contractList.dm")
    public ModelAndView contractList(@ModelAttribute AdminPlaceVO vo, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView();

        String auth_level_cd = (String) session.getAttribute("AUTH_LEVEL_CD");
        String natn_code = (String) session.getAttribute("NATN_CODE");
        String brh_code = (String) session.getAttribute("BRH_CODE");

        AdminPlaceVO placeVO = new AdminPlaceVO();

        if ("L2".equals(auth_level_cd)) {
            vo.setNatn_code(natn_code);
            placeVO.setNatn_code(natn_code);
        } else if ("L3".equals(auth_level_cd)) {
            vo.setBrh_code(brh_code);
            vo.setNatn_code(natn_code);
            placeVO.setBrh_code(brh_code);
            placeVO.setNatn_code(natn_code);
        } else if ("L4".equals(auth_level_cd)) {
            vo.setBrh_code(brh_code);
            vo.setNatn_code(natn_code);
            placeVO.setBrh_code(brh_code);
            placeVO.setNatn_code(natn_code);
        }


        String brh_nm = new String(vo.getBrh_nm().getBytes("iso-8859-1"), "UTF-8");
        vo.setBrh_nm(brh_nm);

        vo.setFirstIndex((vo.getPageIndex() - 1) * vo.getPageUnit());
        vo.setRecordCountPerPage(vo.getPageUnit());

        List<AdminPlaceVO> list = new ArrayList<>();

        //지점명리스트 (select)
        placeVO.setFirstIndex(0);
        placeVO.setRecordCountPerPage(999999999);
        placeVO.setUse_yn("Y");
        List<AdminPlaceVO> placeList = new ArrayList<>();

        int listCnt = 0;

        model.addAttribute("list", list);
        model.addAttribute("listCnt", listCnt);
        model.addAttribute("pageSize", (listCnt - 1) / vo.getPageUnit() + 1);
        model.addAttribute("vo", vo);
        model.addAttribute("placeList", placeList);  //지점리스트

        mv = new ModelAndView("/admin/other/contract_list");
        return mv;
    }





}
