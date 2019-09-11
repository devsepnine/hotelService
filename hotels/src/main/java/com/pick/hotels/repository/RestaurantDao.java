package com.pick.hotels.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.RestaurantDto;
import com.pick.hotels.entity.RestaurantListVO;

@Repository
public interface RestaurantDao {

	void regist(RestaurantDto restaurantDto);
	RestaurantDto get(int no);
	void exit(int no);
	int count(String type, String keyword);
	int getSequenceNumber();
	void edit(RestaurantDto restaurantDto);
	List<RestaurantListVO> listVO(String type, String keyword, int start, int end);
}
