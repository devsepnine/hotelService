package com.pick.hotels.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.RestaurantFileDto;

@Repository
public interface RestaurantFileDao {

	void regist(RestaurantFileDto rfdto);
	RestaurantFileDto get(int no);
	void exit(int no);
	List<RestaurantFileDto> getlist(int no);
	RestaurantFileDto one_view(int no);
}
