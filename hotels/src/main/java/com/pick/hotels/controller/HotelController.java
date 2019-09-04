package com.pick.hotels.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.pick.hotels.entity.Detail_room_vo;
import com.pick.hotels.entity.H_search_vo;
import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.HotelFileDto;
import com.pick.hotels.entity.HotelListVo;
import com.pick.hotels.entity.RoomDto;
import com.pick.hotels.entity.RoomFileDto;
import com.pick.hotels.repository.HotelDao;
import com.pick.hotels.repository.HotelFileDao;
import com.pick.hotels.repository.RoomDao;
import com.pick.hotels.repository.RoomFileDao;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	
	
	private @Autowired HotelDao hotelDao;
	
	private @Autowired HotelFileDao hotelFileDao;
	
	private @Autowired RoomDao roomDao;
	
	private @Autowired RoomFileDao roomFileDao;
	
	@GetMapping("/search")
	public String search(Model model,
						 @ModelAttribute H_search_vo s_vo) {
		if(s_vo.getRegion() != null) {
			List<HotelListVo> h_list = hotelDao.get_h_list(s_vo);
			System.out.println(h_list);
			model.addAttribute("h_list",h_list);
		}
		return "hotel/search";
	}
	
	@GetMapping("/view/{hotel_no}")
	public String view(HttpSession session,
						@PathVariable int hotel_no,
						Model model) {
		HotelDto hdto = hotelDao.get(hotel_no);
		List<HotelFileDto> hflist = hotelFileDao.getlist(hotel_no);
		List<Detail_room_vo> detail_list = new ArrayList<Detail_room_vo>();
		
		List<RoomDto> rdto_list = roomDao.get_list(hotel_no);
		for(RoomDto rdto : rdto_list) {
			int no = rdto.getRoom_no();
			List<RoomFileDto> rfdto_list = roomFileDao.get_list(no);
			Detail_room_vo drv = Detail_room_vo.builder().rdto(rdto).room_file_list(rfdto_list).build();
			detail_list.add(drv);
		}
		
		
		model.addAttribute("detail_list", detail_list);
		model.addAttribute("hdto", hdto);
		model.addAttribute("hflist", hflist);
		return "hotel/view";
	}
	
	

}
