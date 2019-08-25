package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CouponHistoryDto {
	private int coupon_history_no, coupon_no, member_no;
	private String coupon_get_date;
}
