package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class V_reserve {

	private int reserve_no,
				reserve_member_no,
				reserve_hotel_no,
				reserve_people,
				reserve_price;
	private String reserve_name,
					reserve_phone,
					reserve_when,
					reserve_cancel,
					reserve_in,
					reserve_out,
					reserve_ok,
					reserve_pay_type,
					reserve_coupon_use,
					hotel_name,
					hotel_basic_addr,
					hotel_detail_addr,
					hotel_tel,
					room_name;
}
