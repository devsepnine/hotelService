package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.MemberCountVO;
import com.pick.hotels.entity.MemberDto;

public interface MemberDao {

	boolean regist(MemberDto memberDto);
	MemberDto get(String member_id);
	MemberDto login(MemberDto memberDto);
	void delete(String member_id);
	void lasttime(String member_id);
	void change(MemberDto memberDto);
	MemberDto findPassword(MemberDto memberDto);
	void changePw(MemberDto memberDto);
	MemberDto findId(MemberDto memberDto);
	MemberDto checkPw(MemberDto memberDto);
	
	
//------------------------------------------------------------------------------------
//	관리자
//------------------------------------------------------------------------------------    
	MemberDto get(int notice_writer);
	List<MemberDto> list(String type, String keyword, int start, int end);
	int count(String type, String keyword);
	void edit_member(MemberDto memberDto);
	int total_count();
	int recent_count();
	List<MemberCountVO> monthly_count();
	
}
