package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.HotelFileDto;

public interface HotelFileDao {

	void regist(HotelFileDto hfdto);

	List<HotelFileDto> getlist(int hotel_no);

	HotelFileDto get(int no);

	void delete(int no);

	HotelFileDto get(String hotel_file);

	void delete(String hotel_file);

}
