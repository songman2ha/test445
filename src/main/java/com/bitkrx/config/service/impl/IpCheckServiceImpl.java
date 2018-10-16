/**
 * 씨엠이 소프트 자체 프로젝트 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)씨엠이소프트
 * CopyRight 씨엠이소프트 - 2017
 */
package com.bitkrx.config.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitkrx.config.dao.IpCheckDAO;
import com.bitkrx.config.service.IpCheckService;
import com.bitkrx.config.vo.CmeIpInfoVO;

/**
 * @프로젝트명	: com.bitkrx.admin
 * @패키지    	: com.bitkrx.config.service.impl
 * @클래스명  	: com.bitkrx.admin
 * @작성자		:  (주)씨엠이소프트 박상웅
 * @작성일		: 2018. 1. 16.
 */
@Service
public class IpCheckServiceImpl implements IpCheckService{

	@Autowired
	IpCheckDAO ipCheckDAO;

	/**
	 * @Method Name  : getIpPassList
	 * @작성일   : 2018. 1. 16. 
	 * @작성자   :  (주)씨엠이소프트 박상웅
	 * @변경이력  :
	 * @Method 설명 :
	 * @param vo
	 * @return
	 */
	@Override
	public List<CmeIpInfoVO> getIpPassList(CmeIpInfoVO vo) throws Exception {
		return ipCheckDAO.getIpPassList(vo);
	}
}
