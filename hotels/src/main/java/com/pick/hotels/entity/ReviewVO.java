package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ReviewVO {
		private String hotel_name, room_name, reserve_in,
						reserve_out,review_content, review_when, review_state;
		private int review_score, review_no;
}
