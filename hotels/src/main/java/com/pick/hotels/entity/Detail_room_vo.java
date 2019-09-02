package com.pick.hotels.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class Detail_room_vo {
	private RoomDto rdto;
	
	private List<RoomFileDto> room_file_list;
}
