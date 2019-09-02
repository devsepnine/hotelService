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
import org.springframework.web.multipart.MultipartFile;

import com.pick.hotels.entity.H_search_vo;
import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.HotelFileDto;
import com.pick.hotels.entity.HotelListVo;
import com.pick.hotels.entity.PartnerDto;
import com.pick.hotels.entity.PartnerFileDto;
import com.pick.hotels.repository.HotelDao;
import com.pick.hotels.repository.HotelFileDao;
import com.pick.hotels.repository.PartnerDao;
import com.pick.hotels.repository.PartnerFileDao;
import com.pick.hotels.service.FileService;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	
	@Autowired
	private HotelDao hotelDao;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private HotelFileDao hotelFileDao;
	
	@Autowired
	private PartnerDao partnerDao;
	
	@Autowired
	private PartnerFileDao partnerFileDao;
	
	@GetMapping("/search")
	public String search(Model model,
						 @ModelAttribute H_search_vo s_vo) {
		if(s_vo.getRegion() != null) {
			List<HotelListVo> h_list = hotelDao.get_h_list(s_vo);
			model.addAttribute("h_list",h_list);
		}
		return "hotel/search";
	}
	
	@GetMapping("/view")
	public String view() {
		return "hotel/view";
	}
	
	

}
