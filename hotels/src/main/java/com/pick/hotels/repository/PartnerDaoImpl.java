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

	@Override
	public PartnerDto get(int partner_no) {
		return sqlSession.selectOne("partner.get",partner_no);
	}

	@Override
	public boolean delete(int partner_no) {
		try {
			sqlSession.insert("partner.delete", partner_no);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}



}
