package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.RoomDto;
import com.pick.hotels.entity.RoomListVO;
import com.pick.hotels.entity.HotelSalesVO;
import com.pick.hotels.entity.Payment_VO;

public interface RoomDao {

	public void regist(RoomDto roomDto);

	public int getSequenceNumber();

	public RoomDto get(int room_no);

	public List<RoomDto> get_list(int hotel_no, String check_in, String check_out, int people);

	public List<RoomListVO> list(int hotel_no);

	public void edit(RoomDto roomDto);

	public boolean delete(int room_no);

	//예약없는 방인지 확인
	public int room_check(Payment_VO payment_VO);

	
	
}
