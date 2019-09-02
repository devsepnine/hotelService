package com.pick.hotels.service;

import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pick.hotels.entity.AttractionFileDto;
import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.HotelFileDto;
import com.pick.hotels.entity.NoticeDto;
import com.pick.hotels.entity.PartnerFileDto;
import com.pick.hotels.entity.RestaurantFileDto;
import com.pick.hotels.entity.RoomFileDto;

@Service
public interface FileService {
	NoticeDto save(MultipartFile file) throws IllegalStateException, IOException;

	void delete(String delete_file);
	
	AttractionFileDto attraction_save(MultipartFile file, AttractionFileDto afdto) throws IllegalStateException, IOException;

	void attraction_delete(int no);
	
	RestaurantFileDto restaurant_save(MultipartFile file, RestaurantFileDto afdto) throws IllegalStateException, IOException;

	void restaurant_delete(int no);

	HotelFileDto hotel_save(MultipartFile file, HotelFileDto hfdto) throws IllegalStateException, IOException;

	RoomFileDto room_save(MultipartFile file, RoomFileDto rfdto) throws IllegalStateException, IOException;

	HotelDto hotel_title_save(MultipartFile file) throws IllegalStateException, IOException;

	PartnerFileDto partner_save(MultipartFile file, PartnerFileDto pfdto) throws IllegalStateException, IOException;

	void hotel_delete(int no);


	
}
