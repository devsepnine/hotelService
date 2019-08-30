package com.pick.hotels.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.RestaurantDto;

@Repository
public interface RestaurantDao {

	void regist(RestaurantDto restaurantDto);
	RestaurantDto get(int no);
	void exit(int no);
	List<RestaurantDto> list(String type, String keyword, int start, int end);
	int count(String type, String keyword);
	int getSequenceNumber();
	void edit(RestaurantDto restaurantDto);
	boolean delete(int restaurant_no);
}
