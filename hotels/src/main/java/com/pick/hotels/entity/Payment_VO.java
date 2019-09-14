package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class Payment_VO {
	private String reserve_name, reserve_phone,reserve_in, reserve_out;
	private int reserve_people, reserve_pay_type, reserve_hotel_no, reserve_room_no, reserve_price, coupon_history, coupon_no;
}
