package com.pick.hotels.service;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pick.hotels.entity.AttractionFileDto;
import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.HotelFileDto;
import com.pick.hotels.entity.NoticeDto;
import com.pick.hotels.entity.PartnerFileDto;
import com.pick.hotels.entity.RestaurantFileDto;
import com.pick.hotels.entity.RoomFileDto;
import com.pick.hotels.repository.AttractionDao;
import com.pick.hotels.repository.AttractionFileDao;
import com.pick.hotels.repository.NoticeDao;
import com.pick.hotels.repository.RestaurantDao;
import com.pick.hotels.repository.RestaurantFileDao;

@Service
public class FileServiceImpl implements FileService{

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private AttractionDao attractionDao;
	
	@Autowired
	private AttractionFileDao attractionFileDao;
	
	@Autowired
	private RestaurantDao restaurantDao;
	
	@Autowired
	private RestaurantFileDao restaurantFileDao;
	
	
//	공지사항 파일 저장
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

	
//	공지사항 파일 삭제
	@Override
	public void delete(String delete_file) {

		File dir = new File("D:/upload/kh16/notice", delete_file);
		dir.delete();
	}

	
//	관광지 파일 저장
	@Override
	public AttractionFileDto attraction_save(MultipartFile file, AttractionFileDto afdto) throws IllegalStateException, IOException {
		
		String savename = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		
		File dir = new File("D:/upload/kh16/attraction");
		File target = new File(dir, savename);
		file.transferTo(target);
		
		afdto.setAttraction_file_name(savename);
		afdto.setAttraction_file_type(file.getContentType());
		
		return afdto;
	}
	
	
//	관광지 파일,DB 삭제
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
	
	
//	레스토랑 파일 저장
	@Override
	public RestaurantFileDto restaurant_save(MultipartFile file, RestaurantFileDto rfdto) throws IllegalStateException, IOException {
		String savename = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		
		File dir = new File("D:/upload/kh16/restaurant");
		File target = new File(dir, savename);
		file.transferTo(target);
		
		rfdto.setRestaurant_file_name(savename);
		rfdto.setRestaurant_file_type(file.getContentType());
		
		return rfdto;
	}

	
//	레스토랑 파일, DB 삭제
	@Override
	public void restaurant_delete(int no) {
//		번호로 이름을 구한다
		RestaurantFileDto afdto = restaurantFileDao.get(no);
		
//		HDD에서 지운다
		File dir = new File("D:/upload/kh16/restaurant", afdto.getRestaurant_file_name() );
		dir.delete();
		
//		DB에서 지운다
		restaurantFileDao.exit(no);
	}

	
	
	@Override
	public HotelFileDto hotel_save(MultipartFile file, HotelFileDto hfdto) throws IllegalStateException, IOException {
		
		String savename = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		
		File dir = new File("D:/upload/kh16/hotel");
		File target = new File(dir, savename);
		file.transferTo(target);
		
		hfdto.setH_file_name(savename);
		hfdto.setH_file_type(file.getContentType());
		
		return hfdto;
	}


	@Override
	public RoomFileDto room_save(MultipartFile file, RoomFileDto rfdto) throws IllegalStateException, IOException {
		
		String savename = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		
		File dir = new File("D:/upload/kh16/room");
		File target = new File(dir, savename);
		file.transferTo(target);
		
		rfdto.setR_file_name(savename);
		rfdto.setR_file_type(file.getContentType());
		
		return rfdto;
	}


	@Override
	public HotelDto hotel_title_save(MultipartFile file) throws IllegalStateException, IOException {
		
		String savename = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		
		File dir = new File("D:/upload/kh16/hotel");
		File target = new File(dir, savename);
		file.transferTo(target);
		return HotelDto.builder().hotel_title(savename).build();
	}


	@Override
	public PartnerFileDto partner_save(MultipartFile file, PartnerFileDto pfdto) throws IllegalStateException, IOException {

		String savename = file.getOriginalFilename() + "-" + System.currentTimeMillis();
		
		File dir = new File("D:/upload/kh16/partner");
		File target = new File(dir, savename);
		file.transferTo(target);
		
		pfdto.setP_file_name(savename);
		pfdto.setP_file_type(file.getContentType());
		
		return pfdto;
	}

}
