package com.pick.hotels.controller;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
		System.out.println(sellerDto);
		
		boolean result = sellerDao.regist(sellerDto);
		session.removeAttribute("sellerDto");
		System.out.println(sellerDto);
		if(result)
			return "seller/regist_result";
		else
			return "seller/regist_fail";
	}
	
	@GetMapping("/id_check")
	public void id_check(@RequestParam String seller_id, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		SellerDto sdto = sellerDao.getId(seller_id);
		if(sdto==null) {
			resp.getWriter().print("Y");
		}
		else {
			resp.getWriter().print("N");
		}
			
		
	}
	
	@GetMapping("/lisence_check")
	public void lisence_check(@RequestParam String seller_lisence, HttpServletResponse resp) throws IOException {
		System.out.println(seller_lisence);
		resp.setContentType("text/plain");
		SellerDto sdto = sellerDao.getLisence(seller_lisence);
		System.out.println(sdto);
		if(sdto==null) {
			resp.getWriter().print("Y");
		}
		else {
			resp.getWriter().print("N");
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("ok");
		session.removeAttribute("no");
		session.removeAttribute("auth");
		return"redirect:/";
	}
	@GetMapping("/login")
	public String login() {
		return "seller/login";
	}
	
	@PostMapping("/login")
	public String login(
			@ModelAttribute SellerDto sellerDto,
			@RequestParam(required=false) String remember,
			HttpSession session,
			HttpServletResponse response) {
//		암호화 적용 전
//		MemberDto result = memberDao.login(memberDto);
//		if(result != null) {
		
//		암호화 적용 후
//		1. DB에서 회원정보를 불러온다
		SellerDto result = sellerDao.getId(sellerDto.getSeller_id());
		System.out.println(result);
//		2. BCrypt의 비교 명령을 이용하여 비교 후 처리
		if(result!=null) {
			if(BCrypt.checkpw(sellerDto.getSeller_pw(), result.getSeller_pw())) {
				session.setAttribute("ok", result.getSeller_id());
				
				System.out.println("로그인 성공");
				
				return "redirect:/";
			}else {
				return "seller/login_fail";
			}
		}
		else {
			return "seller/login_fail";
		}
	}
	
	@GetMapping("/info")
	public String info(HttpSession session, Model model) {
		String seller_id = (String) session.getAttribute("ok");
		SellerDto sellerDto = sellerDao.getId(seller_id);
		System.out.println(sellerDto);
		model.addAttribute("sdto", sellerDto);
		return "seller/info";
	}
	
	@GetMapping("/delete")
	public String delete(HttpSession session) {
		String seller_id = (String) session.getAttribute("ok");
		sellerDao.delete(seller_id);
		session.removeAttribute("ok");
		session.removeAttribute("auth");
		return "seller/goodbye";
	}
	
	@GetMapping("/change")
	public String change(HttpSession session, Model model) {
		String seller_id = (String) session.getAttribute("ok");
		SellerDto sellerDto = sellerDao.getId(seller_id);
		model.addAttribute("sdto", sellerDto);
		return "seller/change_info";
	}
	
	@PostMapping("/change")
	public String change(@ModelAttribute SellerDto sellerDto, HttpSession session) {
		sellerDto.setSeller_id((String) session.getAttribute("ok"));
		System.out.println(sellerDto);
		sellerDao.change(sellerDto);
		return "redirect:info";
	}
}
