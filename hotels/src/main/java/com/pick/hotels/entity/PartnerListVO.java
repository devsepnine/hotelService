package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PartnerListVO {
	private int partner_no, p_file_no, hotel_no;
	private float partner_longitude, partner_latitude;
	private String partner_name, partner_content, p_file_name, partner_zip_code, partner_basic_addr,
	partner_detail_addr, partner_tel;
}
