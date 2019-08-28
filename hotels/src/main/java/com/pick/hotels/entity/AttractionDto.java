package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class AttractionDto {
	private int attraction_no, attraction_postcode;
	private String attraction_name,attraction_info, attraction_addr1, attraction_addr2;
	private float attraction_lat, attraction_lng;
}
