package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class RestaurantFileDto {
	private int restaurant_no, restaurant_file_no;
	private String restaurant_file_name, restaurant_file_type;
}
