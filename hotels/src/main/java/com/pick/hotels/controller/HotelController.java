package com.pick.hotels.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pick.hotels.entity.AttractionDto;
import com.pick.hotels.entity.AttractionFileDto;
import com.pick.hotels.entity.Detail_room_vo;
import com.pick.hotels.entity.H_search_vo;
import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.HotelFileDto;
import com.pick.hotels.entity.HotelListVo;
import com.pick.hotels.entity.RestaurantDto;
import com.pick.hotels.entity.RestaurantFileDto;
import com.pick.hotels.entity.Review_list_vo;
import com.pick.hotels.entity.RoomDto;
import com.pick.hotels.entity.RoomFileDto;
import com.pick.hotels.entity.View_attraction;
import com.pick.hotels.entity.View_restaurant;
import com.pick.hotels.repository.AttractionDao;
import com.pick.hotels.repository.AttractionFileDao;
import com.pick.hotels.repository.HotelDao;
import com.pick.hotels.repository.HotelFileDao;
import com.pick.hotels.repository.RestaurantDao;
import com.pick.hotels.repository.RestaurantFileDao;
import com.pick.hotels.repository.ReviewDao;
import com.pick.hotels.repository.RoomDao;
import com.pick.hotels.repository.RoomFileDao;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	private @Autowired HotelDao hotelDao;
	
	private @Autowired HotelFileDao hotelFileDao;
	
	private @Autowired RoomDao roomDao;
	
	private @Autowired RoomFileDao roomFileDao;
	
	private @Autowired ReviewDao reviewDao;
	
	private @Autowired AttractionDao attractionDao;
	
	private @Autowired RestaurantDao restaurantDao;
	
	private @Autowired AttractionFileDao attractionFileDao;
	
	private @Autowired RestaurantFileDao restaurantFileDao;
	
	@GetMapping("/search")
	public String search(Model model,
						 @ModelAttribute H_search_vo s_vo) throws UnsupportedEncodingException {
		if(s_vo.getRegion() != null) {
			List<HotelListVo> h_list = hotelDao.get_h_list(s_vo);
			model.addAttribute("h_list",h_list);
		}
		return "hotel/search";
	}
	
	@GetMapping("/view/{hotel_no}")
	public String view(HttpSession session,
						@PathVariable int hotel_no,
						Model model,
						@RequestParam String check_in,
						@RequestParam String check_out,
						@RequestParam int people) {
		HotelDto hdto = hotelDao.get(hotel_no);
		if(ObjectUtils.isEmpty(hdto)) {
			return "err/hotel_no_find";
		}
		List<HotelFileDto> hflist = hotelFileDao.getlist(hotel_no);
		//detail vo 리스트 생성
		List<Detail_room_vo> detail_list = new ArrayList<Detail_room_vo>();
		// room 리스트 받아옴
		List<RoomDto> rdto_list = roomDao.get_list(hotel_no,check_in,check_out,people);
		//room 리스트 for문
		for(RoomDto rdto : rdto_list) {
			// room 번호로 파일 구함
			int no = rdto.getRoom_no();
			//room file 리스트 생성
			List<RoomFileDto> rfdto_list = roomFileDao.get_list(no);
			//detail room vo 하나 생성
			Detail_room_vo drv = Detail_room_vo.builder().rdto(rdto).room_file_list(rfdto_list).build();
			//list에 추가
			detail_list.add(drv);
		}
		Float hotel_score = reviewDao.get_avg_star(hotel_no);
		List<Review_list_vo> review = reviewDao.get_list(hotel_no);
		List<AttractionDto> attraction_list = attractionDao.near_by(hdto);
		List<RestaurantDto> restaurant_list = restaurantDao.near_by(hdto);
		List<View_attraction> v_at = new ArrayList<View_attraction>();
		for(AttractionDto at : attraction_list) {
			int no = at.getAttraction_no();
			AttractionFileDto atf = attractionFileDao.one_view(no);
			View_attraction va = View_attraction.builder().attractionDto(at).attractionFileDto(atf).build();
			v_at.add(va);
		}
		List<View_restaurant> v_rt = new ArrayList<View_restaurant>();
		for(RestaurantDto rt : restaurant_list) {
			int no = rt.getRestaurant_no();
			RestaurantFileDto rtf = restaurantFileDao.one_view(no);
			View_restaurant vr = View_restaurant.builder().restaurantDto(rt).restaurantFileDto(rtf).build();
			v_rt.add(vr);
		}
		
		model.addAttribute("v_at", v_at);
		model.addAttribute("v_rt", v_rt);
		model.addAttribute("review_list", review);
		model.addAttribute("hotel_score", hotel_score);
		model.addAttribute("detail_list", detail_list);
		model.addAttribute("hdto", hdto);
		model.addAttribute("hflist", hflist);
		return "hotel/view";
	}
	
	

}
