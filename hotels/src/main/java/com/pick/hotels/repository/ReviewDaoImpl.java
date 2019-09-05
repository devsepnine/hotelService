package com.pick.hotels.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.ReserveDto;
import com.pick.hotels.entity.ReviewDto;
import com.pick.hotels.entity.ReviewVO;

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

}
