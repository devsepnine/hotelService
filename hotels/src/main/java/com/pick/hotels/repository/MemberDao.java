package com.pick.hotels.repository;

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
	
	
//	나연이가 만든거	      
	MemberDto get(int notice_writer);
}
