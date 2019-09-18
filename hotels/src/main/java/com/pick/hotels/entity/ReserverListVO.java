package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ReserverListVO {
	private String room_name, reserve_name, reserve_phone, reserve_when, reserve_in, reserve_out, reserve_ok,
					reserve_pay_type, reserve_coupon_use;
	private int hotel_no, room_price, room_no, reserve_no, room_people, reserve_people, reserve_price;
}
