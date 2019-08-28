package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class WishDto {
	private int wish_no, wish_member_no, wish_hotel_no;
	private String wish_when;

}
