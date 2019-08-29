package com.pick.hotels.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.WishDto;
import com.pick.hotels.entity.WishListVO;

@Repository
public class WishDaoImpl implements WishDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<WishListVO> list(int member_no) {
		return sqlSession.selectList("wish.list",member_no);
	}

	@Override
	public boolean regist(int member_no) {
		try {
			sqlSession.insert("wish.regist", member_no);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

}
