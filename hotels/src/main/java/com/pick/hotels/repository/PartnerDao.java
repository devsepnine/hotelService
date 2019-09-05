package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.PartnerDto;
import com.pick.hotels.entity.PartnerListVO;

public interface PartnerDao {

	int getSequenceNumber();

	void regist(PartnerDto partnerDto);

	PartnerDto get(int partner_no);

	boolean delete(int partner_no);

	List<PartnerListVO> list(int hotel_no);


}
