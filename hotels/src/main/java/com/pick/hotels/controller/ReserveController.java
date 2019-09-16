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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pick.hotels.entity.CouponVO;
import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.MemberDto;
import com.pick.hotels.entity.ReserveDto;
import com.pick.hotels.entity.ReserveVO;
import com.pick.hotels.entity.RoomDto;
import com.pick.hotels.repository.CouponDao;
import com.pick.hotels.repository.HotelDao;
import com.pick.hotels.repository.MemberDao;
import com.pick.hotels.repository.ReserveDao;
import com.pick.hotels.repository.ReviewDao;
import com.pick.hotels.repository.RoomDao;

@Controller
@RequestMapping("reserve")
public class ReserveController {

	@Autowired
	private ReserveDao reserveDao;
	
	@Autowired
	private RoomDao roomDao;
	
	@Autowired
	private HotelDao hotelDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Autowired
	private CouponDao couponDao;
	
	
	@GetMapping("/regist/{room_no}")
	public String regist(@PathVariable int room_no,
							Model model,
							HttpSession session,
							String check_in,
							String check_out) {
		RoomDto rdto = roomDao.get(room_no);
		if(rdto == null) {
			return "err/hotel_no_find";
		}
		int hotel_no = rdto.getHotel_no();
		HotelDto hdto = hotelDao.get(hotel_no);
		MemberDto mdto = memberDao.get((String) session.getAttribute("ok"));
		List<CouponVO> couponList = couponDao.payment_coupon_list((int)session.getAttribute("no"));
		
		model.addAttribute("cplist", couponList);
		model.addAttribute("check_in", check_in);
		model.addAttribute("check_out", check_out);
		model.addAttribute("mdto", mdto);
		model.addAttribute("hdto", hdto);
		model.addAttribute("rdto", rdto);
		return "reserve/regist";
	}
	
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute ReserveDto reserveDto,
						HttpSession session, Model model
						,@ModelAttribute HotelDto hotelDto
						//@ModelAttribute RoomDto roomDto
						) {
		
		String member_id = (String) session.getAttribute("ok");
		boolean result = reserveDao.regist(reserveDto);
		
		
		
		if(result) {
			return "reserve/regist_result";
		}
		else {
			return "reserve/regist_fail";
		}
	}
	
	@GetMapping("/list")
	public String list(Model model, HttpSession session) {

		int member_no = (int) session.getAttribute("no");
		
		List<ReserveVO> list = reserveDao.list(member_no);
		
		model.addAttribute("reserveVO", list);
		
		return "reserve/list";
	}
	
	@GetMapping("/cancel_list")
	public String cancel_list(Model model, HttpSession session) {
		int member_no = (int) session.getAttribute("no");
		 List<ReserveVO> cancel_list = reserveDao.cancel_list(member_no);
		 
		 model.addAttribute("reserveVO", cancel_list);
		return "reserve/cancel_list";
	}
	
	@GetMapping("/details")
	public String details(Model model, HttpSession session, 
							@RequestParam int reserve_no
							) {
		int member_no = (int) session.getAttribute("no");
		ReserveDto reserveDto = reserveDao.get(reserve_no, member_no);
//		방정보
		int room_no = reserveDto.getReserve_room_no();
		RoomDto roomDto = roomDao.get(room_no);
		
//		호텔정보
		int hotel_no = reserveDto.getReserve_hotel_no();
		HotelDto hotelDto = hotelDao.get(hotel_no);
		
//		회원정보
		MemberDto memberDto = memberDao.get(member_no);
		
//		날짜계산
		int count = reserveDao.timeCnt(reserveDto);
		
		
//		리뷰작성 확인
		boolean check = reviewDao.check(reserve_no);
		
		model.addAttribute("memberDto", memberDto);
		model.addAttribute("roomDto", roomDto);
		model.addAttribute("hotelDto", hotelDto);
		model.addAttribute("rdto", reserveDto);
		model.addAttribute("time", count);
		model.addAttribute("check", check);
		return "reserve/details";
	}
	
	@GetMapping("/reserve_delete")
	public void reserve_delete(@RequestParam int reserve_no, @ModelAttribute ReserveDto reserveDto, HttpSession session, HttpServletResponse resp) throws IOException {
		int member_no = (int) session.getAttribute("no");
		reserveDto.setReserve_member_no(member_no);
		reserveDto.setReserve_no(reserve_no);
		boolean result = reserveDao.change(reserveDto);
		
		if(result) {
			resp.getWriter().print("Y");
		}
		else {
			resp.getWriter().print("N");
		}
		
	}
	
	
	
}
