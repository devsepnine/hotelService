package com.pick.hotels.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pick.hotels.entity.SellerDto;
import com.pick.hotels.repository.SellerDao;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Autowired
	private SellerDao sellerDao;
	
	@GetMapping("/lisence")
	public String lisence() {
		return "seller/lisence";
	}
	
	@PostMapping("/lisence")
	public String lisence(@ModelAttribute SellerDto sellerDto, HttpSession session) {
		session.setAttribute("sellerDto", sellerDto);
		return "seller/regist";
	}
	
	@GetMapping("/regist")
	public String regist() {
		return "seller/regist";
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute SellerDto sellerDto, HttpSession session) {
		SellerDto sdto = (SellerDto) session.getAttribute("sellerDto");
		String origin = sellerDto.getSeller_pw();
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		
		sellerDto.setSeller_lisence(sdto.getSeller_lisence());
		sellerDto.setSeller_name(sdto.getSeller_name());
		sellerDto.setSeller_pw(encrypt);
		
		boolean result = sellerDao.regist(sellerDto);
		session.removeAttribute("sellerDto");
		System.out.println(sellerDto);
		if(result)
			return "seller/regist_result";
		else
			return "seller/regist_fail";
	}
}
