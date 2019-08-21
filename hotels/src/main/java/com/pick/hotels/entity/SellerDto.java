package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class SellerDto {
	private int seller_no;
	private String seller_id;
	private String seller_pw;
	private String seller_phone;
	private String seller_name;
	private String seller_lisence;
	private String seller_zip_code;
	private String seller_basic_addr;
	private String seller_detail_addr;
	private String seller_birth;
	private String seller_email_id;
	private String seller_email_addr;
	private String seller_regist;
}
