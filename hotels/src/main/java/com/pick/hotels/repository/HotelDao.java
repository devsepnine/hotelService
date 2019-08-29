package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.HotelListVo;

public interface HotelDao {

	public void regist(HotelDto hotelDto);

	List<HotelDto> list(int seller_no);

	List<HotelListVo> get_h_list();

	public int getSequenceNumber();

}
