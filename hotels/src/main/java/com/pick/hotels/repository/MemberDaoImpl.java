package com.pick.hotels.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.AttractionDto;
import com.pick.hotels.entity.MemberCountVO;
import com.pick.hotels.entity.MemberDto;

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
			e.printStackTrace();
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

	@Override
	public MemberDto login(MemberDto memberDto) {
		MemberDto result = sqlSession.selectOne("member,login", memberDto);
		return result;
	}

	@Override
	public void lasttime(String member_id) {
		sqlSession.update("member.lasttime", member_id);
		
	}

	@Override
	public void delete(String member_id) {
		sqlSession.delete("member.delete", member_id);
		
	}

	@Override
	public void change(MemberDto memberDto) {
		sqlSession.update("member.change", memberDto);
		
	}

	@Override
	public MemberDto findPassword(MemberDto memberDto) {
		return sqlSession.selectOne("member.find_pw", memberDto);
	}

	@Override
	public void changePw(MemberDto memberDto) {
		sqlSession.update("member.changePw", memberDto);
		
	}

	@Override
	public MemberDto findId(MemberDto memberDto) {
		return sqlSession.selectOne("member.find_id", memberDto);
	}

	@Override
	public MemberDto checkPw(MemberDto memberDto) {
		return sqlSession.selectOne("member.check_pw", memberDto);
	}
	
	
//------------------------------------------------------------------------------------
//	관리자
//------------------------------------------------------------------------------------
	
//	회원 목록
	@Override
	public List<MemberDto> list(String type, String keyword, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		
//		검색일 떄 검색어를 mybatis에 전달
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);			
		}
		
//		검색이든 목록이든 페이징 구간 전달
		param.put("start", start);
		param.put("end", end);
		
		return sqlSession.selectList("member.list", param);
	}

//	회원리스트 구하기
	@Override
	public int count(String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		
		return sqlSession.selectOne("member.count", param);
	}

	
//	관리자 회원 정보 수정
	@Override
	public void edit_member(MemberDto memberDto) {
		sqlSession.update("member.edit_member", memberDto);
	}

//	전체 회원 수
	@Override
	public int total_count() {
		return sqlSession.selectOne("member.total_count");
	}

//	최근 7일 가입 회원 수
	@Override
	public int recent_count() {
		return sqlSession.selectOne("member.recent_count");
	}

//	월별 가입 회원 수
	@Override
	public List<MemberCountVO> monthly_count() {
		return sqlSession.selectList("member.monthly_count");
	}

}
