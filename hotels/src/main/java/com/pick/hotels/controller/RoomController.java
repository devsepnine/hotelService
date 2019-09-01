package com.pick.hotels.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pick.hotels.entity.RoomDto;
import com.pick.hotels.entity.RoomFileDto;
import com.pick.hotels.repository.RoomDao;
import com.pick.hotels.repository.RoomFileDao;
import com.pick.hotels.service.FileService;

@Controller
@RequestMapping("/room")
public class RoomController {
	
	@Autowired
	private RoomDao roomDao;
	
	@Autowired
	private RoomFileDao roomFileDao;
	
	@Autowired
	private FileService fileService;
	
	@GetMapping("/regist")
	public String regist(@RequestParam int hotel_no) {
		return "room/regist";
	}
	
	@PostMapping("/regist")
	public String regist(
			@ModelAttribute RoomDto roomDto,@RequestParam int hotel_no, Model model,
			@RequestParam MultipartFile file1, @RequestParam MultipartFile file2, 
			@RequestParam MultipartFile file3, @RequestParam MultipartFile file4) throws IllegalStateException, IOException {
		
		roomDto.setHotel_no(hotel_no);
		if(roomDto.getRoom_breakfast()==null) roomDto.setRoom_breakfast("N");
		if(roomDto.getRoom_spa()==null) roomDto.setRoom_spa("N");
		if(roomDto.getRoom_conditioner()==null) roomDto.setRoom_conditioner("N");
		if(roomDto.getRoom_tv()==null) roomDto.setRoom_tv("N");
		if(roomDto.getRoom_refrigerator()==null) roomDto.setRoom_refrigerator("N");
		if(roomDto.getRoom_shower_room()==null) roomDto.setRoom_shower_room("N");
		if(roomDto.getRoom_bath()==null) roomDto.setRoom_bath("N");
		if(roomDto.getRoom_hair()==null) roomDto.setRoom_hair("N");
		if(roomDto.getRoom_cookoo()==null) roomDto.setRoom_cookoo("N");
		if(roomDto.getRoom_smoking()==null) roomDto.setRoom_smoking("N");
		if(roomDto.getRoom_cooking()==null) roomDto.setRoom_cooking("N");
		
		int no = roomDao.getSequenceNumber();
		roomDto.setRoom_no(no);
		roomDao.regist(roomDto);
		
		
		if(!file1.isEmpty()) {
			RoomFileDto rfdto = RoomFileDto.builder()
														.room_no(no)
														.build();
			
			rfdto =  fileService.room_save(file1, rfdto);
			
			roomFileDao.regist(rfdto);
		}
		
		if(!file2.isEmpty()) {
			RoomFileDto rfdto = RoomFileDto.builder()
														.room_no(no)
														.build();
			
			rfdto =  fileService.room_save(file2, rfdto);
			
			roomFileDao.regist(rfdto);
		}
		
		if(!file3.isEmpty()) {
			RoomFileDto rfdto = RoomFileDto.builder()
														.room_no(no)
														.build();
			
			rfdto =  fileService.room_save(file3, rfdto);
			
			roomFileDao.regist(rfdto);
		}
		
		if(!file4.isEmpty()) {
			RoomFileDto rfdto = RoomFileDto.builder()
														.room_no(no)
														.build();
			
			rfdto =  fileService.room_save(file4, rfdto);
			
			roomFileDao.regist(rfdto);
		}
		
		model.addAttribute("room_no",roomDto.getRoom_no());
		model.addAttribute("hotel_no",hotel_no);
		return "redirect:content";
	}
}
