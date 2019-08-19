package com.pick.hotels.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pick.hotels.entity.NoticeDto;
import com.pick.hotels.repository.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public NoticeDto read(int no) {
		noticeDao.read(no);
		return noticeDao.get(no);
	}

	@Override
	public int write(NoticeDto noticeDto) {
		int no = noticeDao.getSequenceNumber();
		noticeDto.setNotice_no(no);
		
		noticeDao.write(noticeDto);
		return no;
	}
	
}
