package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.HotelDto;

public interface HotelDao {

	public void regist(HotelDto hotelDto);

	List<HotelDto> list(String seller_id);

}
