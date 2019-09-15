package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PartnerDto {
	private String partner_name, partner_tel, partner_content, partner_type, partner_zip_code, 
					partner_basic_addr, partner_detail_addr, partner_response ;
	private int hotel_no, partner_no;
	private float partner_longitude, partner_latitude;
}
