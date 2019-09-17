package com.pick.hotels.repository;

import com.pick.hotels.entity.SellerCertDto;

public interface SellerCertDao {

	void insert(SellerCertDto sellerCertDto);
	boolean validate(SellerCertDto sellerCertDto);
	void delete(SellerCertDto sellerCertDto);


}
