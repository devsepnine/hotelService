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

import com.pick.hotels.entity.PartnerDto;
import com.pick.hotels.entity.PartnerFileDto;
import com.pick.hotels.entity.RoomFileDto;
import com.pick.hotels.repository.PartnerDao;
import com.pick.hotels.repository.PartnerFileDao;
import com.pick.hotels.service.FileService;

@Controller
@RequestMapping("/partner")
public class PartnerController {
	
	@Autowired
	private PartnerDao partnerDao;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private PartnerFileDao partnerFileDao;
	
	@GetMapping("/regist")
	public String regist() {
		return "partner/regist";
	}
	
	@PostMapping("/regist")
	public String regist(
							@RequestParam int hotel_no,Model model, @ModelAttribute PartnerDto partnerDto,
							@RequestParam MultipartFile file1, @RequestParam MultipartFile file2, 
							@RequestParam MultipartFile file3, @RequestParam MultipartFile file4) throws IllegalStateException, IOException {
		
		partnerDto.setHotel_no(hotel_no);
		
		int no = partnerDao.getSequenceNumber();
		partnerDto.setPartner_no(no);
		
		
		if(!file1.isEmpty()) {
			PartnerFileDto pfdto = PartnerFileDto.builder()
														.partner_no(no)
														.build();
			
			pfdto =  fileService.partner_save(file1, pfdto);
			
			partnerFileDao.regist(pfdto);
		}
		
		if(!file2.isEmpty()) {
			PartnerFileDto pfdto = PartnerFileDto.builder()
														.partner_no(no)
														.build();
			
			pfdto =  fileService.partner_save(file2, pfdto);
			
			partnerFileDao.regist(pfdto);
		}
		
		if(!file3.isEmpty()) {
			PartnerFileDto pfdto = PartnerFileDto.builder()
														.partner_no(no)
														.build();
			
			pfdto =  fileService.partner_save(file3, pfdto);
			
			partnerFileDao.regist(pfdto);
		}
		
		if(!file4.isEmpty()) {
			PartnerFileDto pfdto = PartnerFileDto.builder()
														.partner_no(no)
														.build();
			
			pfdto =  fileService.partner_save(file4, pfdto);
			
			partnerFileDao.regist(pfdto);
		}
		
		partnerDao.regist(partnerDto);
		return "redirect:content";
	}
}
