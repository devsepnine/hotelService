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

import com.pick.hotels.entity.ReviewDto;
import com.pick.hotels.repository.ReviewDao;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewDao reviewDao;
	
	@GetMapping("/write")
	public String write() {
		return "review/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute ReviewDto reviewDto, 
						HttpSession session,
						Model model) {
		int member_no = (int) session.getAttribute("ok");
		reviewDto.setReview_name(member_no);
		
		boolean result = reviewDao.write(reviewDto);
		
		return "redirect:content";
	}
	
	
	
	
	
}
