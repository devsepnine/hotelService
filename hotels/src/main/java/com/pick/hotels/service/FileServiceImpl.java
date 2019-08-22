package com.pick.hotels.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pick.hotels.entity.NoticeDto;
import com.pick.hotels.repository.NoticeDao;

@Service
public class FileServiceImpl implements FileService{

	@Autowired
	private NoticeDao noticeDao;
	
	@Override
	public NoticeDto save(MultipartFile file) throws IllegalStateException, IOException {
		
		String savename = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		
		File dir = new File("D:/upload/notice");
		File target = new File(dir, savename);
		file.transferTo(target);
		
		NoticeDto ndto = NoticeDto.builder()
									.notice_file_name(savename)
									.notice_file_type(file.getContentType())
									.build();
		return ndto;
	}

	@Override
	public void delete(String delete_file) {

		File dir = new File("D:/upload/notice", delete_file);
	}

}
