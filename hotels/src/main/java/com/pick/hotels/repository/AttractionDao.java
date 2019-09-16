package com.pick.hotels.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.AttractionDto;
import com.pick.hotels.entity.AttractionListVO;
import com.pick.hotels.entity.HotelDto;

@Repository
public interface AttractionDao {

	void regist(AttractionDto attractionDto);
	AttractionDto get(int no);
	void exit(int no);
	int count(String type, String keyword);
	int getSequenceNumber();
	void edit(AttractionDto attractionDto);
	List<AttractionListVO> listVO(String type, String keyword, int start, int end);
	List<AttractionDto> near_by(HotelDto hdto);
}
