package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class RoomListVO {
	private int room_no, r_file_no, room_price, hotel_no;
	private String room_name, room_content, r_file_name;
}
