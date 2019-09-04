package com.pick.hotels.repository;

import com.pick.hotels.entity.ReviewDto;

public interface ReviewDao {

	boolean write(ReviewDto reviewDto);

	boolean check(int reserve_no);

}
