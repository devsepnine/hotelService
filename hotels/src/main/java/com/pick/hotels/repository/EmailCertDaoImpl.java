package com.pick.hotels.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.EmailCertDto;

@Repository
public class EmailCertDaoImpl implements EmailCertDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(String emailcert) {
		sqlSession.insert("emailcert.insert",emailcert);
	}

	@Override
	public EmailCertDto get(String seller_email_cert) {
		return sqlSession.selectOne("emailcert.get",seller_email_cert);
	}


	


}
