package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class RestaurantDto {
	private int restaurant_no, restaurant_addr;
	private String restaurant_name,restaurant_info;
	private float restaurant_lat,restaurant_lng;
}
