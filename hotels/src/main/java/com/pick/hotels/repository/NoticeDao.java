package com.pick.hotels.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.NoticeDto;

@Repository
public interface NoticeDao {

	void write(NoticeDto noticeDto);
	NoticeDto get(int no);
	void delete(int no);
	List<NoticeDto> list(String type, String keyword);
	void read(int no);
	int count(String type, String keyword);
	int getSequenceNumber();
	void edit(NoticeDto noticeDto);
}
