/**
 * 씨엠이 소프트 자체 프로젝트 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)씨엠이소프트
 * CopyRight 씨엠이소프트 - 2017
 */
package com.bitkrx.admin.cust.control;

import com.bitkrx.admin.cust.service.AdminCustService;
import com.bitkrx.admin.cust.vo.AdminCustVO;
import com.bitkrx.admin.other.vo.AdminPlaceVO;

import com.bitkrx.config.control.CmeDefaultExtendController;
import com.bitkrx.config.mail.MailSenderImpl;
import com.bitkrx.config.util.BizSender;
import com.bitkrx.config.util.SessionUtil;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;



/**
 * @프로젝트명 : com.web.devmkadsp
 * @패키지 : com.web.exbeone.admin.cust.control
 * @클래스명 : com.web.devmkadsp
 * @작성자 : (주)씨엠이소프트 임승연
 * @작성일 : 2017. 8. 18.
 */
@Controller
@RequestMapping(value = "/admin")

public class AdminCustController extends CmeDefaultExtendController {

    protected SessionUtil sUtil = SessionUtil.getinstance();
    protected BizSender bizSender = BizSender.getinstance();
    public static final String BITKRX_MAIL_MAIL_FROM = "no-reply@planbit.io";    // 보내는 주소

    @Autowired
    MailSenderImpl mailSender;

    @Autowired
    AdminCustService adminCustService;

    @Autowired
    ServletContext servletContext;



    public JSONObject apiParser(String str) throws Exception {
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(str);

        JSONObject dataobj = (JSONObject) obj;

        return dataobj;
    }

    /**
     * @param request
     * @param response
     * @param model
     * @return
     * @throws Exception
     * @Method Name  : custList
     * @작성일 :  2017. 9. 19.
     * @작성자 : (주)씨엠이소프트 임승연
     * @변경이력 :
     * @Method 설명 : 회원리스트 화면
     */
    @RequestMapping(value = "/cust/list.dm")
    public ModelAndView custList(@ModelAttribute AdminCustVO vo, HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session) throws Exception {
        ModelAndView mv = new ModelAndView();

        String auth_level_cd = (String) session.getAttribute("AUTH_LEVEL_CD");
        String natn_code = (String) session.getAttribute("NATN_CODE");
        String brh_code = (String) session.getAttribute("BRH_CODE");

        AdminPlaceVO placeVO = new AdminPlaceVO();

        String searchWrd = new String(vo.getSearchWrd().getBytes("iso-8859-1"), "UTF-8");
        vo.setSearchWrd(searchWrd.trim());

        SimpleDateFormat DateFormat = new SimpleDateFormat("yyyy.MM.dd");
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MONTH, -1);
        String strDt = DateFormat.format(cal.getTime());

        if (vo.getSearchBgnDe().equals("")) {
            vo.setSearchBgnDe(strDt);//1달전
            vo.setSearchEndDe((String) DateFormat.format(new Date())); // 현재날짜
        }

        //회원리스트
        vo.setFirstIndex((vo.getPageIndex() - 1) * vo.getPageUnit());
        vo.setRecordCountPerPage(vo.getPageUnit());
        List<AdminCustVO> list = new ArrayList<AdminCustVO>();

        int listCnt = 0;

        //전체회원수
        AdminCustVO vo2 = new AdminCustVO();
        //조회 쿼리랑 같이 쓰기 때문에 조회되는 데이터양을 조절하기 위하여
        vo2.setFirstIndex(0);
        vo2.setRecordCountPerPage(999999999);
        int listCnt4 = 0;


        //당일가입회원수
        AdminCustVO rvo = new AdminCustVO();
        cal.add(Calendar.MONTH, 1);
        strDt = DateFormat.format(cal.getTime());
        rvo.setSearchBgnDe((String) DateFormat.format(new Date()));
        rvo.setSearchEndDe((String) DateFormat.format(new Date())); // 현재날짜
        int listCnt3 = 0;
        //전일가입회원수
        AdminCustVO svo = new AdminCustVO();
        String strDt2 = DateFormat.format(cal.getTime());
        cal.add(Calendar.DATE, -1);
        strDt2 = DateFormat.format(cal.getTime());
        svo.setSearchBgnDe(strDt2);//1달전
        svo.setSearchEndDe(strDt2); // 현재날짜
        int listCnt2 = 0;

        //지점명리스트
        placeVO.setFirstIndex(0);
        placeVO.setRecordCountPerPage(999999999);
        List<AdminPlaceVO> placeList = new ArrayList<AdminPlaceVO>();

        //국가명리스트 추가 (select)
        List nationList = new ArrayList<String>();

        model.addAttribute("list", list); // custList
        model.addAttribute("listCnt", listCnt);
        model.addAttribute("listCnt2", listCnt2);
        model.addAttribute("listCnt3", listCnt3);
        model.addAttribute("listCnt4", listCnt4);
        model.addAttribute("pageSize", (listCnt - 1) / vo.getPageUnit() + 1);
        model.addAttribute("vo", vo);

        //지점리스트
        model.addAttribute("placeList", placeList);
        //국가리스트
        model.addAttribute("nationList", nationList);

        mv = new ModelAndView("/admin/cust/cust_list");
        return mv;
    }


}
