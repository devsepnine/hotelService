package com.pick.hotels.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.WishDto;

@Repository
public class WishDaoImpl implements WishDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<WishDto> list(int member_no) {
		return sqlSession.selectList("wish.list",member_no);
	}

}
