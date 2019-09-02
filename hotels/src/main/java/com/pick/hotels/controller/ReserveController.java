package com.pick.hotels.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.ReserveDto;
import com.pick.hotels.entity.RoomDto;
import com.pick.hotels.repository.HotelDao;
import com.pick.hotels.repository.ReserveDao;
import com.pick.hotels.repository.RoomDao;

@Controller
@RequestMapping("reserve")
public class ReserveController {

	@Autowired
	private ReserveDao reserveDao;
	
	@Autowired
	private RoomDao roomDao;
	
	@Autowired
	private HotelDao hotelDao;
	
	@GetMapping("/regist")
	public String regist() {
		return "reserve/regist";
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute ReserveDto reserveDto,
						HttpSession session, Model model
						,@ModelAttribute HotelDto hotelDto
						//@ModelAttribute RoomDto roomDto
						) {
		
		String member_id = (String) session.getAttribute("ok");
		boolean result = reserveDao.regist(reserveDto);
		
		
		
		if(result) {
			return "reserve/regist_result";
		}
		else {
			return "reserve/regist_fail";
		}
	}
	
	@GetMapping("/list")
	public String list() {
		return "reserve/list";
	}
	
	@GetMapping("/details")
	public String details(Model model, HttpSession session, 
							@RequestParam int reserve_no) {
		int no = (int) session.getAttribute("no");
		ReserveDto reserveDto = reserveDao.get(reserve_no, no);
//		방정보
		int room_no = reserveDto.getReserve_room_no();
		RoomDto roomDto = roomDao.get(room_no);
		
//		호텔정보
		int hotel_no = reserveDto.getReserve_hotel_no();
		HotelDto hotelDto = hotelDao.get(hotel_no);
		
		model.addAttribute("roomDto", roomDto);
		model.addAttribute("hotelDto", hotelDto);
		model.addAttribute("rdto", reserveDto);
		
		return "reserve/details";
	}
	
//	@GetMapping("/details")
//	public String details() {
//		return "reserve/details";
//	}
	
	
}
