package com.pick.hotels.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmailCertDaoImpl implements EmailCertDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(String emailcert) {
		sqlSession.insert("emailcert.insert",emailcert);
	}


	


}
