package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.RoomDto;

public interface RoomDao {

	public void regist(RoomDto roomDto);

	public int getSequenceNumber();

	public List<RoomDto> get_list(int hotel_no);
	
}
