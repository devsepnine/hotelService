package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.H_search_vo;
import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.HotelListVo;

public interface HotelDao {

	public void regist(HotelDto hotelDto);

	List<HotelDto> list(int seller_no);

	List<HotelListVo> get_h_list(H_search_vo s_vo);

	public int getSequenceNumber();

	public boolean delete(int hotel_no);

	HotelDto get(int hotel_no);

	public void edit(HotelDto hotelDto);

}
