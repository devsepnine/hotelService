package com.pick.hotels.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	
	@GetMapping("search")
	public String search() {
		return "hotel/search";
	}

}
