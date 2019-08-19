package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class MemberDto {
	private int member_no;
	private String member_name,member_phone, member_zip_code,
					member_basic_addr, member_detail_addr,
					member_class, member_when, member_email1,
					member_email2, member_id, member_pw, member_birthday;
	

}
