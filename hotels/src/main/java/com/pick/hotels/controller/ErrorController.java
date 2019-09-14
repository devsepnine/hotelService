package com.pick.hotels.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/err")
@Controller
public class ErrorController {

	@RequestMapping("/reserve")
	public String err_reserve(){
		return "err/hotel_no_find";
	}
}
