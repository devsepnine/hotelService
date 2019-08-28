package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class AttractionDto {
	private int attraction_no, attraction_addr;
	private String attraction_name,attraction_info;
	private double attraction_lat, attraction_lng;
}
