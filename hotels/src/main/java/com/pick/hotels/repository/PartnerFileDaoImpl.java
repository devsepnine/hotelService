package com.pick.hotels.repository;

import java.util.List;

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

	@Override
	public PartnerFileDto get(int no) {
		return sqlSession.selectOne("partnerFile.get", no);
	}

	@Override
	public List<PartnerFileDto> getlist(int partner_no) {
		return sqlSession.selectList("partnerFile.getlist", partner_no);
	}

	@Override
	public void delete(int no) {
		sqlSession.delete("partnerFile.delete", no);
	}

}
