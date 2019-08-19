package com.pick.hotels.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/")
	public String main() {
		return "main";
	}
	
	@GetMapping("/join")
	public String join() {

		return "join_select";
	}
}
