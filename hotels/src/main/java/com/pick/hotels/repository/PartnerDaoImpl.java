package com.pick.hotels.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.PartnerDto;
import com.pick.hotels.entity.PartnerListVO;

@Repository
public class PartnerDaoImpl implements PartnerDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getSequenceNumber() {
		return sqlSession.selectOne("partner.seq");
	}

	@Override
	public void regist(PartnerDto partnerDto) {
		sqlSession.insert("partner.regist",partnerDto);
		
	}

	@Override
	public PartnerDto get(int partner_no) {
		return sqlSession.selectOne("partner.get",partner_no);
	}

	@Override
	public boolean delete(int partner_no) {
		try {
			sqlSession.insert("partner.delete", partner_no);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<PartnerListVO> list(int hotel_no) {
		return sqlSession.selectList("partner.list",hotel_no);
	}

	
//------------------------------------------------------------------------------------
//	관리자
//------------------------------------------------------------------------------------  
	
//	제휴 승인 대기 목록
	@Override
	public List<PartnerListVO> waiting_list(String type, String keyword, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		
//		검색일 떄 검색어를 mybatis에 전달
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);			
		}
		
//		검색이든 목록이든 페이징 구간 전달
		param.put("start", start);
		param.put("end", end);
		
		return sqlSession.selectList("partner.waiting_list", param);
	}
	
//	제휴 승인 완료 목록
	@Override
	public List<PartnerListVO> complete_list(String type, String keyword, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		
//		검색일 떄 검색어를 mybatis에 전달
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);			
		}
		
//		검색이든 목록이든 페이징 구간 전달
		param.put("start", start);
		param.put("end", end);
		
		return sqlSession.selectList("partner.complete_list", param);
	}
	
//	제휴 승인 거절 목록
	@Override
	public List<PartnerListVO> refuse_list(String type, String keyword, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		
//		검색일 떄 검색어를 mybatis에 전달
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);			
		}
		
//		검색이든 목록이든 페이징 구간 전달
		param.put("start", start);
		param.put("end", end);
		
		return sqlSession.selectList("partner.refuse_list", param);
	}

//	제휴 리스트 수 카운트
	@Override
	public int count(String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		
		return sqlSession.selectOne("partner.count", param);
	}

//	제휴 정보 수정
	@Override
	public void edit_partner(PartnerDto partnerDto) {
		sqlSession.update("partner.edit_partner", partnerDto);
	}



}
