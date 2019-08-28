package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.HotelListVo;

public interface HotelDao {

	public void regist(HotelDto hotelDto);

	List<HotelDto> list(String seller_id);

	List<HotelListVo> get_h_list();

}
