package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ReserveVO {
	private int reserve_no, hotel_no;
	private String reserve_ok, reserve_in, reserve_out,
					reserve_people, hotel_name, hotel_title;
}
