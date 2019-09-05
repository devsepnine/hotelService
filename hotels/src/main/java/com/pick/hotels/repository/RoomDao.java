package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.RoomDto;
import com.pick.hotels.entity.RoomListVO;

public interface RoomDao {

	public void regist(RoomDto roomDto);

	public int getSequenceNumber();

	public RoomDto get(int room_no);

	public List<RoomDto> get_list(int hotel_no);

	public List<RoomListVO> list(int hotel_no);

	public void edit(RoomDto roomDto);
	
}
