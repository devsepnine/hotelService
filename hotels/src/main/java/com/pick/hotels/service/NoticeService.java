package com.pick.hotels.service;

import com.pick.hotels.entity.NoticeDto;

public interface NoticeService {
	NoticeDto read(int no);
	int write(NoticeDto noticeDto);
}
