/**
 * 씨엠이 소프트 자체 프로젝트 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)씨엠이소프트
 * CopyRight 씨엠이소프트 - 2017
 */
package com.bitkrx.admin.cust.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitkrx.admin.cust.dao.AdminCustDAO;
import com.bitkrx.admin.cust.service.AdminCustService;
import com.bitkrx.admin.cust.vo.AdminCustVO;

/**
 * @프로젝트명 : com.bitkrx.admin
 * @패키지 : com.bitkrx.admin.cust.service.impl
 * @클래스명 : com.bitkrx.admin
 * @작성자 : (주)씨엠이소프트 박상웅
 * @작성일 : 2017. 11. 23.
 */
@Service
public class AdminCustServiceImpl implements AdminCustService {

    @Autowired
    AdminCustDAO adminCustDAO;


}
