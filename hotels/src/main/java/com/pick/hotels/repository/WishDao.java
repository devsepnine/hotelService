package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.WishDto;

public interface WishDao {

	List<WishDto> list(int member_no);

	

}
