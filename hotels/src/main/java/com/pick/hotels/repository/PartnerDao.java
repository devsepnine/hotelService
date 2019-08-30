package com.pick.hotels.repository;

import com.pick.hotels.entity.PartnerDto;

public interface PartnerDao {

	int getSequenceNumber();

	void regist(PartnerDto partnerDto);

}
