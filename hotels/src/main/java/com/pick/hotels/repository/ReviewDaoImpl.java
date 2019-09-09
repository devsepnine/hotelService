package com.pick.hotels.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	
}
