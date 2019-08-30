package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.WishDto;
import com.pick.hotels.entity.WishListVO;

public interface WishDao {

	List<WishListVO> list(int member_no);

	boolean regist(WishDto wishDto);

	boolean delete(WishDto wishDto);

	WishDto get(WishDto wishDto);

	

}
