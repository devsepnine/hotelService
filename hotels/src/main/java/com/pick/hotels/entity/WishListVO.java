package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class WishListVO {
	
	private int wish_no, member_no, hotel_no;
	private String wish_when, hotel_name, hotel_title;
}
