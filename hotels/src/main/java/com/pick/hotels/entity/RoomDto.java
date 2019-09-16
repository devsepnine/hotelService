package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
@ToString(exclude = {"room_content"})
public class RoomDto {
	private String room_name, room_content, room_breakfast, room_bed, room_spa, room_conditioner, 
				   room_tv, room_refrigerator, room_shower_room, room_bath, room_hair, room_cookoo,
				   room_smoking, room_cooking;
	private int    hotel_no, room_no, room_price, room_people;
}
