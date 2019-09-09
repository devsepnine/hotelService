package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.ReviewDto;
import com.pick.hotels.entity.ReviewVO;
import com.pick.hotels.entity.Review_list_vo;

public interface ReviewDao {

	boolean write(ReviewDto reviewDto);

	boolean check(int reserve_no);

	List<ReviewVO> list(int member_no);

	boolean change(ReviewDto reviewDto);

	int count(String type, String keyword);

	Float get_avg_star(int hotel_no);

	List<Review_list_vo> get_list(int hotel_no);

}
