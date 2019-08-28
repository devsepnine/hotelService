package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class HotelListVo {

	private int hotel_no, room_cnt, max_price;
	
	private String hotel_name, hotel_tel, hotel_zip_code, hotel_basic_addr, hotel_title,
	hotel_star,hotel_parking, hotel_fitness,hotel_pool,hotel_sauna,hotel_lounge,hotel_bbq,hotel_cafe,hotel_convenience_store,hotel_karaoke,hotel_internet;
}
