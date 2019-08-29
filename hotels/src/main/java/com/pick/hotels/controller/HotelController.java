package com.pick.hotels.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.HotelFileDto;
import com.pick.hotels.entity.HotelListVo;
import com.pick.hotels.repository.HotelDao;
import com.pick.hotels.repository.RoomFileDao;
import com.pick.hotels.service.FileService;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	
	@Autowired
	private HotelDao hotelDao;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private RoomFileDao roomFileDao;
	
	@GetMapping("/search")
	public String search(Model model) {
		List<HotelListVo> h_list = hotelDao.get_h_list();
		model.addAttribute("h_list",h_list);
		return "hotel/search";
	}
	
	@GetMapping("/regist")
	public String regist() {
		return "hotel/regist";
	}
	@PostMapping("/regist")
	public String regist(@ModelAttribute HotelDto hotelDto,HttpSession session,Model model,
			@RequestParam MultipartFile file1, @RequestParam MultipartFile file2, @RequestParam MultipartFile file3) throws IllegalStateException, IOException {
		int seller_no = (int)session.getAttribute("s_no");
		hotelDto.setSeller_no(seller_no);
		if(hotelDto.getHotel_bbq()==null) hotelDto.setHotel_bbq("N");
		if(hotelDto.getHotel_cafe()==null) hotelDto.setHotel_cafe("N");
		if(hotelDto.getHotel_convenience_store()==null) hotelDto.setHotel_convenience_store("N");
		if(hotelDto.getHotel_fitness()==null) hotelDto.setHotel_fitness("N");
		if(hotelDto.getHotel_internet()==null) hotelDto.setHotel_internet("N");
		if(hotelDto.getHotel_karaoke()==null) hotelDto.setHotel_karaoke("N");
		if(hotelDto.getHotel_lounge()==null) hotelDto.setHotel_lounge("N");
		if(hotelDto.getHotel_parking()==null) hotelDto.setHotel_parking("N");
		if(hotelDto.getHotel_pool()==null) hotelDto.setHotel_pool("N");
		if(hotelDto.getHotel_sauna()==null) hotelDto.setHotel_sauna("N");
		hotelDao.regist(hotelDto);
		
		if(!file1.isEmpty()) {
			HotelFileDto hfdto = HotelFileDto.builder()
														.hotel_no(hotelDto.getHotel_no())
														.build();
			
			hfdto =  fileService.hotel_save(file1, hfdto);
			
			roomFileDao.regist(hfdto);
		}
		
		if(!file2.isEmpty()) {
			HotelFileDto hfdto = HotelFileDto.builder()
														.hotel_no(hotelDto.getHotel_no())
														.build();
			
			hfdto =  fileService.hotel_save(file2, hfdto);
			
			roomFileDao.regist(hfdto);
		}
		
		if(!file3.isEmpty()) {
			HotelFileDto hfdto = HotelFileDto.builder()
														.hotel_no(hotelDto.getHotel_no())
														.build();
			
			hfdto =  fileService.hotel_save(file3, hfdto);
			
			roomFileDao.regist(hfdto);
		}
		model.addAttribute("hotel_no",hotelDto.getHotel_no());
		

		return "redirect:hotel/content";

	}
	
	
	@GetMapping("/list")
	public String list(@ModelAttribute HotelDto hotelDto, Model model, HttpSession session) {
		int seller_no = (int) session.getAttribute("s_no");
		List<HotelDto> list = hotelDao.list(seller_no);
		model.addAttribute("list",list);
		return "hotel/list";
	}

}
