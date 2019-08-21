package com.pick.hotels.repository;

import com.pick.hotels.entity.SellerDto;

public interface SellerDao {

	boolean regist(SellerDto sellerDto);

	SellerDto get(String seller_id);


	void delete(String seller_id);

	void change(SellerDto sellerDto);
	
	SellerDto login(SellerDto sellerDto);


}
