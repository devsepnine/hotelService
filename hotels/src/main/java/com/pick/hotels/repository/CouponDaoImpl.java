package com.pick.hotels.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.CouponDto;
import com.pick.hotels.entity.CouponVO;

@Repository
public class CouponDaoImpl implements CouponDao{

	@Autowired
	private SqlSession sqlSession;
	
//	쿠폰 등록
	@Override
	public void regist(CouponDto cdto) {
		sqlSession.insert("coupon.regist", cdto);		
	}

//	쿠폰 정보
	@Override
	public CouponDto get(int no) {
		return sqlSession.selectOne("coupon.get", no);
	}
	
//	쿠폰 상태 변경
	@Override
	public void edit(CouponDto cdto) {
		sqlSession.update("coupon.edit", cdto);
	}

//	쿠폰 리스트
	@Override
	public List<CouponDto> list(String type, String keyword, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		
//		검색일 떄 검색어를 mybatis에 전달
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);			
		}
		
//		검색이든 목록이든 페이징 구간 전달
		param.put("start", start);
		param.put("end", end);
		
		return sqlSession.selectList("coupon.list", param);
	}
	
//	사용만료 쿠폰 리스트
	@Override
	public List<CouponDto> blacklist(String type, String keyword, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		
//		검색일 떄 검색어를 mybatis에 전달
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);			
		}
		
//		검색이든 목록이든 페이징 구간 전달
		param.put("start", start);
		param.put("end", end);
		
		return sqlSession.selectList("coupon.blacklist", param);
	}


	
//	쿠폰 수 세기
	@Override
	public int count(String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		
		return sqlSession.selectOne("coupon.count", param);
	}
	
//	시퀀스 번호 구하기
	@Override
	public int getSequenceNumber() {
		return sqlSession.selectOne("coupon.seq");
	}

//	회원 내쿠폰 리스트
	
	@Override
	public List<CouponVO> coupon_list(int member_no) {
		return sqlSession.selectList("coupon.coupon_list",member_no);
	}

	@Override
	public List<CouponVO> coupon_down_list(int member_no) {
		return sqlSession.selectList("coupon.coupon_down",member_no);
	}


}
