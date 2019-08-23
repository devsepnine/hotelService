package com.pick.hotels.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.repository.HotelDao;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	
	@Autowired
	private HotelDao hotelDao;
	
	@GetMapping("search")
	public String search() {
		return "hotel/search";
	}
	
	@GetMapping("/regist")
	public String regist() {
		return "hotel/regist";
	}
	@PostMapping("/regist")
	public String regist(@ModelAttribute HotelDto hotelDto, HttpSession session) {
		String seller_id = (String) session.getAttribute("s_ok");
		hotelDto.setSeller_id(seller_id);
		boolean result = hotelDao.regist(hotelDto);
		if(result)
			return "seller/regist_result";
		else
			return "seller/regist_fail";
	}

}
