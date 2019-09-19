package com.pick.hotels.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/err")
@Controller
public class ErrorController {

	@RequestMapping("/reserve")
	public String err_reserve(){
		return "err/hotel_no_find";
	}
	
	@GetMapping("/400")
	public String error_400() {
		
		return "err/400";
	}
	
	@GetMapping("/403")
	public String error_403() {
		
		return "err/403";
	}
	
	@GetMapping("/404")
	public String error_404() {
		
		return "err/404";
	}
	
	@GetMapping("/405")
	public String error_405() {
		
		return "err/405";
	}
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@ExceptionHandler(Exception.class)
	public String handler1(Exception ex) {
		logger.error("error 발생", ex);
		return "err/500";
	}
}
