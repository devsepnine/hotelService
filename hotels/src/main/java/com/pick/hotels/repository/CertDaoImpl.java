package com.pick.hotels.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.CertDto;

@Repository
public class CertDaoImpl implements CertDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(CertDto certDto) {
		sqlSession.insert("cert.insert", certDto);
		
	}
	
	@Override
	public boolean validate(CertDto certDto) {
		CertDto cdto = sqlSession.selectOne("cert.validate", certDto);
		return cdto != null;
	}

	@Override
	public void delete(CertDto certDto) {
		sqlSession.delete("cert.delete", certDto);
	}


}
