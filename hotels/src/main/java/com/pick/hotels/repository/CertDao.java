package com.pick.hotels.repository;

import com.pick.hotels.entity.CertDto;

public interface CertDao {

	void insert(CertDto certDto);
	boolean validate(CertDto certDto);
	void delete(CertDto certDto);
	void clear();


}
