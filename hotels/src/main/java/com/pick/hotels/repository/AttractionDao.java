package com.pick.hotels.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.AttractionDto;

@Repository
public interface AttractionDao {

	void regist(AttractionDto attractionDto);
	AttractionDto get(int no);
	void exit(int no);
	List<AttractionDto> list(String type, String keyword, int start, int end);
	int count(String type, String keyword);
	int getSequenceNumber();
	void edit(AttractionDto attractionDto);
	public boolean delete(int attraction_no);
}
