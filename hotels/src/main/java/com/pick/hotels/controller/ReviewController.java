package com.pick.hotels.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.ReserveDto;
import com.pick.hotels.entity.ReserveVO;
import com.pick.hotels.entity.ReviewDto;
import com.pick.hotels.entity.ReviewVO;
import com.pick.hotels.entity.RoomDto;
import com.pick.hotels.repository.ReserveDao;
import com.pick.hotels.repository.ReviewDao;
import com.pick.hotels.repository.RoomDao;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private ReserveDao reserveDao;
	
	@Autowired
	private RoomDao roomDao;
	
	@GetMapping("/write")
	public String write(Model model, @RequestParam int reserve_no, HttpSession session) {
		int member_no = (int) session.getAttribute("no");
		
//		방정보
		ReserveDto reserveDto = reserveDao.get(reserve_no, member_no);
		int room_no = reserveDto.getReserve_room_no();
		RoomDto roomDto = roomDao.get(room_no);
		ReserveVO rvo = reserveDao.one_review(reserve_no,member_no);
		
		
		model.addAttribute("roomDto", roomDto);
		model.addAttribute("rvo",rvo);
		model.addAttribute("reserve_no", reserve_no);
		
		return "review/write";
	}
	
	@PostMapping("/write")
	public String write(@ModelAttribute ReviewDto reviewDto, 
						HttpSession session,
						Model model) throws IOException {
		
			int member_no = (int) session.getAttribute("no");
			reviewDto.setReview_member_no(member_no);
			
			model.addAttribute("reserve_no", reviewDto.getReview_reserve());
			reviewDao.write(reviewDto);
			
			return "redirect:/reserve/details";
	}
	
	@GetMapping("/review_list")
	public String review_list(Model model, HttpSession session) {
		int member_no = (int) session.getAttribute("no");
		
		List<ReviewVO> list = reviewDao.list(member_no);
		
		model.addAttribute("reviewVO", list);
		return "review/review_list";
	}
	
	@GetMapping("/review_delete")
	public void review_delete(@RequestParam int review_no, @ModelAttribute ReviewDto reviewDto , HttpSession session, HttpServletResponse resp) throws IOException {
		int member_no = (int) session.getAttribute("no");
		reviewDto.setReview_member_no(member_no);
		reviewDto.setReview_no(review_no);
		boolean result = reviewDao.change(reviewDto);
		
		if(result) {
			resp.getWriter().print("Y");
		}
		else {
			resp.getWriter().print("N");
		}
	}
	
	
	
	
	
	
}
