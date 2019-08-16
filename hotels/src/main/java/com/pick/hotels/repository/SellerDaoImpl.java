package com.pick.hotels.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.SellerDto;

@Repository
public class SellerDaoImpl implements SellerDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean regist(SellerDto sellerDto) {
		try {
			sqlSession.insert("seller.regist", sellerDto);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
