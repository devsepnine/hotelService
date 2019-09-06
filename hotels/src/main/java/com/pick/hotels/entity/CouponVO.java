package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class CouponVO {
		
		private int coupon_no,coupon_price, coupon_minimum, coupon_history_no;
		private String coupon_name, coupon_date1, coupon_date2, coupon_get_date;
}
