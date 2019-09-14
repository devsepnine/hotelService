package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class View_restaurant {
	private RestaurantDto restaurantDto;
	private RestaurantFileDto restaurantFileDto;
}
