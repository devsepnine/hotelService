package com.pick.hotels.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("/admin")
public class AdminController {

//	관광지 추가("/attraction/regist")
	@GetMapping("/attraction/regist")
	public String regist() {
		return "attraction/regist";
	}
	
	@PostMapping("/attraction/regist")
	public String regist(@RequestParam MultipartFile file
			) {
		
		return "redirect:attraction/list";
	}
//	광광지 수정("/attraction/edit")
//	관광지 삭제("/attraction/exit")
//	관광지 전체리스트  + 검색("/attraction/list")
	
	
//	레스토랑 추가("/restaurant/regist")
//	레스토랑 수정("/restaurant/edit")
//	레스토랑 삭제("/restaurant/exit")
//	레스토랑 전체 리스트 +검색("/restaurant/list")
	
	
//	쿠폰 추가("/coupon/regist")
//	쿠폰 수정("/coupon/edit")
//	쿠폰 만료 처리(사용불가 상태)("/coupon/exit")
//	쿠폰 전체 리스트 + 검색("/coupon/list")
	
	
//	회원 정보 상세보기("/member/detail")
//	회원 정보 수정("/member/edit")
//	회원 탈퇴("/member/exit")
//	전체 회원 리스트  + 검색("/member/list")

	
//	판매자 정보 상세보기("/seller/detail")
//	판매자 정보 수정("/seller/edit")
//	판매자 탈퇴("/seller/exit")
//	전체 판매자 리스트 + 검색("/seller/list")
}
