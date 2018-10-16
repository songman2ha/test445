/**
 * 씨엠이 소프트 자체 프로젝트 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)씨엠이소프트
 * CopyRight 씨엠이소프트 - 2017
 */
package com.bitkrx.admin.main.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @프로젝트명	: com.bitkrx.admin
 * @패키지    	: com.bitkrx.admin.main.control
 * @클래스명  	: com.bitkrx.admin
 * @작성자		:  (주)씨엠이소프트 박상웅
 * @작성일		: 2017. 12. 23.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminMainController {

	@RequestMapping(value = "/main.dm")
	public ModelAndView main(HttpServletRequest request , HttpServletResponse response) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv = new ModelAndView("/admin/main/main");
		return mv;
	}
}
