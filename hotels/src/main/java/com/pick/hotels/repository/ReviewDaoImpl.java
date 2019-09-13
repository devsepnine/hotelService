package com.pick.hotels.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.AttractionListVO;
import com.pick.hotels.entity.ReserveDto;
import com.pick.hotels.entity.ReviewDto;
import com.pick.hotels.entity.ReviewVO;
import com.pick.hotels.entity.Review_list_vo;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean write(ReviewDto reviewDto) {
		sqlSession.insert("review.write", reviewDto);
		return true;
	}

	@Override
	public boolean check(int reserve_no) {
		ReviewDto rdto = sqlSession.selectOne("review.check",reserve_no);
		return  null != rdto;

	}

	@Override
	public List<ReviewVO> list(int member_no) {
		return sqlSession.selectList("review.list", member_no);
	}

	@Override
	public boolean change(ReviewDto reviewDto) {

		return sqlSession.update("review.change", reviewDto) > 0;
	}

	@Override
	public int count(String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		return sqlSession.selectOne("review.count", param);
	}

	@Override
	public Float get_avg_star(int hotel_no) {
		return sqlSession.selectOne("review.getavgstar", hotel_no);
	}

	@Override
	public List<Review_list_vo> get_list(int hotel_no) {
		
		return sqlSession.selectList("review.h_get_list", hotel_no);
	}
	
	
	
//------------------------------------------------------------------------------------
// 관리자
//------------------------------------------------------------------------------------	

//	리뷰 목록
	@Override
	public List<ReviewVO> admin_review_list(String type, String keyword, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		
//		검색일 떄 검색어를 mybatis에 전달
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);			
		}
		
//		검색이든 목록이든 페이징 구간 전달
		param.put("start", start);
		param.put("end", end);
		
		List<ReviewVO> list = sqlSession.selectList("review.admin_review_list", param);
		
		return list;
	}
	
//	리뷰 리스트 수 카운트
	@Override
	public int count_review_list(String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		
		return sqlSession.selectOne("review.count_review_list", param);
	}
	
	
//	블랙 리뷰 목록
	@Override
	public List<ReviewVO> admin_review_blacklist(String type, String keyword, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		
//		검색일 떄 검색어를 mybatis에 전달
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);			
		}
		
//		검색이든 목록이든 페이징 구간 전달
		param.put("start", start);
		param.put("end", end);
		
		List<ReviewVO> blacklist = sqlSession.selectList("review.admin_review_blacklist", param);
		
		return blacklist;
	}
	
//	리뷰 블랙리스트 수 카운트
	@Override
	public int count_review_blacklist(String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		
		return sqlSession.selectOne("review.count_review_blacklist", param);
	}

	
}
