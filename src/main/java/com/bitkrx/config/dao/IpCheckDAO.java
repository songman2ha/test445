/**
 * 씨엠이 소프트 자체 프로젝트 입니다. 허가 없이 복제 및 배포 할 수 없습니다.
 * 개발사 : (주)씨엠이소프트
 * CopyRight 씨엠이소프트 - 2017
 */
package com.bitkrx.config.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bitkrx.config.vo.CmeIpInfoVO;

/**
 * @프로젝트명	: com.bitkrx.admin
 * @패키지    	: com.bitkrx.config.dao
 * @클래스명  	: com.bitkrx.admin
 * @작성자		:  (주)씨엠이소프트 박상웅
 * @작성일		: 2018. 1. 16.
 */
@Repository
public class IpCheckDAO extends CmeComAbstractDAO{

	/**
	 * @Method Name  : getIpPassList
	 * @작성일   : 2018. 1. 16. 
	 * @작성자   :  (주)씨엠이소프트 박상웅
	 * @변경이력  :
	 * @Method 설명 :
	 * @param vo
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<CmeIpInfoVO> getIpPassList(CmeIpInfoVO vo) throws Exception{
		return list("IpCheckDAO.getIpPassList", vo);
	}

}
