package com.pick.hotels.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.PartnerDto;

@Repository
public class PartnerDaoImpl implements PartnerDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getSequenceNumber() {
		return sqlSession.selectOne("partner.seq");
	}

	@Override
	public void regist(PartnerDto partnerDto) {
		sqlSession.insert("partner.regist",partnerDto);
		
	}

}
