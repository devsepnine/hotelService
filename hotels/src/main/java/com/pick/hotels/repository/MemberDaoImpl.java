package com.pick.hotels.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.MemberDto;
import com.pick.hotels.entity.NoticeDto;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean regist(MemberDto memberDto) {
		try {
			sqlSession.insert("member.regist", memberDto);
			return true;
		}
		catch(Exception e){
			return false;
			
		}
	}

	@Override
	public MemberDto get(String member_id) {
		
		return sqlSession.selectOne("member.id_ckeck", member_id);
	}

	
	@Override
	public MemberDto get(int notice_writer) {
		return sqlSession.selectOne("member.get", notice_writer);
	}

	
	
	
	
}
