package com.pick.hotels.repository;

import com.pick.hotels.entity.SellerDto;

public interface SellerDao {

	boolean regist(SellerDto sellerDto);
	SellerDto getId(String seller_id);
	void delete(String seller_id);
	void change(SellerDto sellerDto);
	SellerDto login(SellerDto sellerDto);
	SellerDto getLisence(String seller_lisence);
	SellerDto findPassword(SellerDto sellerDto);
	void changePw(SellerDto sellerDto);
	SellerDto findId(SellerDto sellerDto);
	SellerDto get(int seller_no);
}
