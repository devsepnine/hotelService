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
	
	
//------------------------------------------------------------------------------------
//	관리자
//------------------------------------------------------------------------------------    
	List<PartnerListVO> waiting_list(String type, String keyword, int start, int end);
	List<PartnerListVO> complete_list(String type, String keyword, int start, int end);
	List<PartnerListVO> refuse_list(String type, String keyword, int start, int end);
	int count(String type, String keyword);
	void edit_partner(PartnerDto partnerDto);
	
}
