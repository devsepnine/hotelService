package com.pick.hotels.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.ReserveDto;
import com.pick.hotels.repository.ReserveDao;

@Controller
@RequestMapping("reserve")
public class ReserveController {

	@Autowired
	private ReserveDao reserveDao;
	
	@GetMapping("regist")
	public String regist() {
		return "reserve/regist";
	}
	
	@PostMapping("regist")
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
	
	
}
