package com.pick.hotels.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.CertDto;
import com.pick.hotels.entity.SellerCertDto;

@Repository
public class SellerCertDaoImpl implements SellerCertDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(SellerCertDto sellerCertDto) {
		sqlSession.insert("sellerCert.insert", sellerCertDto);
		
	}
	
	@Override
	public boolean validate(SellerCertDto sellerCertDto) {
		CertDto cdto = sqlSession.selectOne("sellerCert.validate", sellerCertDto);
		return cdto != null;
	}

	@Override
	public void delete(SellerCertDto sellerCertDto) {
		sqlSession.delete("sellerCert.delete", sellerCertDto);
	}


}
