package com.pick.hotels.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pick.hotels.entity.AttractionFileDto;
import com.pick.hotels.entity.NoticeDto;
import com.pick.hotels.repository.AttractionDao;
import com.pick.hotels.repository.AttractionFileDao;
import com.pick.hotels.repository.NoticeDao;

@Service
public class FileServiceImpl implements FileService{

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private AttractionDao attractionDao;
	
	@Autowired
	private AttractionFileDao attractionFileDao;
	
	@Override
	public NoticeDto save(MultipartFile file) throws IllegalStateException, IOException {
		
		String savename = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		
		File dir = new File("D:/upload/kh16/notice");
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

		File dir = new File("D:/upload/kh16/notice", delete_file);
		dir.delete();
	}

	@Override
	public AttractionFileDto attraction_save(MultipartFile file, AttractionFileDto afdto) throws IllegalStateException, IOException {
		
		String savename = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		
		File dir = new File("D:/upload/kh16/attraction");
		File target = new File(dir, savename);
		file.transferTo(target);
		
		afdto.setAttraction_file_name(savename);
		afdto.setAttraction_file_type(file.getContentType());
		
		System.out.println(afdto);
		return afdto;
	}
	
	@Override
	public void attraction_delete(int no) {
//		번호로 이름을 구한다
		AttractionFileDto afdto = attractionFileDao.get(no);
		
//		HDD에서 지운다
		File dir = new File("D:/upload/kh16/attraction", afdto.getAttraction_file_name() );
		dir.delete();
		
//		DB에서 지운다
		attractionFileDao.exit(no);
		
		
	}

}
