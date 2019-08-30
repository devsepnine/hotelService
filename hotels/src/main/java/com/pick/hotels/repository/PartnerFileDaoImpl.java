package com.pick.hotels.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.PartnerFileDto;

@Repository
public class PartnerFileDaoImpl implements PartnerFileDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void regist(PartnerFileDto pfdto) {
		sqlSession.insert("partnerFile.regist", pfdto);
		
	}

}
