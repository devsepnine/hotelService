package com.pick.hotels.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean write(ReviewDto reviewDto) {
		sqlSession.insert("review.write", reviewDto);
		return true;
	}

}
