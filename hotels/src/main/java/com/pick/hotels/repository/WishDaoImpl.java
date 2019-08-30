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
	public boolean regist(WishDto wishDto) {
		try {
			sqlSession.insert("wish.regist", wishDto);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(WishDto wishDto) {
		try {
			sqlSession.delete("wish.delete", wishDto);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public WishDto get(WishDto wishDto) {
		return sqlSession.selectOne("wish.wish_ckeck", wishDto);
	}

}
