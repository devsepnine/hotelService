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

	@Override
	public SellerDto getId(String seller_id) {
		return sqlSession.selectOne("seller.id_ckeck", seller_id);
	}


	@Override
	public void delete(String seller_id) {
		sqlSession.delete("seller.delete", seller_id);
		
	}

	@Override
	public void change(SellerDto sellerDto) {
		sqlSession.update("seller.change", sellerDto);
		
	}

	@Override
	public SellerDto login(SellerDto sellerDto) {
		SellerDto result = sqlSession.selectOne("seller,login", sellerDto);
		return result;
	}

	@Override
	public SellerDto getLisence(String seller_lisence) {
		return sqlSession.selectOne("seller.lisence_ckeck", seller_lisence);
	}

	@Override
	public SellerDto findPassword(SellerDto sellerDto) {
		return sqlSession.selectOne("seller.find_pw", sellerDto);
	}


	@Override
	public void changePw(SellerDto sellerDto) {
		sqlSession.update("seller.changePw", sellerDto);
	}

	@Override
	public SellerDto findId(SellerDto sellerDto) {
		return sqlSession.selectOne("seller.find_id", sellerDto);
	}

	@Override
	public SellerDto get(int seller_no) {
		return sqlSession.selectOne("seller.get",seller_no);
	}

}
