package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class PartnerFileDto {
	private int		room_no, r_file_no;
	private String	r_file_name, r_file_type;
}
