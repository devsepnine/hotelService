package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CouponDto {
	private int coupon_no, coupon_price, coupon_condition;
	private String coupon_name, coupon_date1, coupon_date2;
}
