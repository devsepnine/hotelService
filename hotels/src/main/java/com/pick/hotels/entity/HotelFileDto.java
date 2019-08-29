package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class HotelFileDto {
	private int		hotel_no, h_file_no;
	private String	h_file_name, h_file_type;
}
