package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.PartnerFileDto;

public interface PartnerFileDao {

	void regist(PartnerFileDto pfdto);

	PartnerFileDto get(int no);

	List<PartnerFileDto> getlist(int partner_no);

	void delete(int no);

}
