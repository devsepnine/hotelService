package com.pick.hotels.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
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

import com.pick.hotels.entity.Detail_room_vo;
import com.pick.hotels.entity.H_search_vo;
import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.HotelFileDto;
import com.pick.hotels.entity.HotelListVo;
import com.pick.hotels.entity.Review_list_vo;
import com.pick.hotels.entity.RoomDto;
import com.pick.hotels.entity.RoomFileDto;
import com.pick.hotels.repository.HotelDao;
import com.pick.hotels.repository.HotelFileDao;
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
	
	@GetMapping("/search")
	public String search(Model model,
						 @ModelAttribute H_search_vo s_vo) throws UnsupportedEncodingException {
		if(s_vo.getRegion() != null) {
			s_vo.setRegion(URLDecoder.decode(s_vo.getRegion(),"UTF-8"));
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
		
		model.addAttribute("review_list", review);
		model.addAttribute("hotel_score", hotel_score);
		model.addAttribute("detail_list", detail_list);
		model.addAttribute("hdto", hdto);
		model.addAttribute("hflist", hflist);
		return "hotel/view";
	}
	
	

}
