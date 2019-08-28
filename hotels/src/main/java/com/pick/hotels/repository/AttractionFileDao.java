package com.pick.hotels.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.AttractionFileDto;

@Repository
public interface AttractionFileDao {

	void regist(AttractionFileDto afdto);
	AttractionFileDto get(int no);
	void exit(int no);
	List<AttractionFileDto> getlist(int no);
}
