package com.pick.hotels.repository;

import com.pick.hotels.entity.MemberDto;

public interface MemberDao {

	boolean regist(MemberDto memberDto);
	MemberDto get(String member_id);
	
//	나연이가 만든거	
	MemberDto get(int notice_writer);
}
