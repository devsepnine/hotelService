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
import com.pick.hotels.repository.HotelDao;
import com.pick.hotels.repository.HotelFileDao;
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
	
	@GetMapping("/search")
	public String search(Model model,
						 @ModelAttribute H_search_vo s_vo) {
		List<HotelListVo> h_list = hotelDao.get_h_list(s_vo);
		
		
		model.addAttribute("h_list",h_list);
		return "hotel/search";
	}
	
	@GetMapping("/view")
	public String view() {
		return "hotel/view";
	}
	
	@GetMapping("/regist")
	public String regist() {
		return "hotel/regist";
	}
	@PostMapping("/regist")
	public String regist(@ModelAttribute HotelDto hotelDto,HttpSession session,Model model, @RequestParam MultipartFile file,
			@RequestParam MultipartFile file1, @RequestParam MultipartFile file2, @RequestParam MultipartFile file3,
			@RequestParam MultipartFile file4, @RequestParam MultipartFile file5, @RequestParam MultipartFile file6,
			@RequestParam MultipartFile file7, @RequestParam MultipartFile file8, @RequestParam MultipartFile file9,
			@RequestParam MultipartFile file10) throws IllegalStateException, IOException {
		
		
		int seller_no = (int)session.getAttribute("s_no");
		hotelDto.setSeller_no(seller_no);
		if(hotelDto.getHotel_bbq()==null) hotelDto.setHotel_bbq("N");
		if(hotelDto.getHotel_cafe()==null) hotelDto.setHotel_cafe("N");
		if(hotelDto.getHotel_convenience_store()==null) hotelDto.setHotel_convenience_store("N");
		if(hotelDto.getHotel_fitness()==null) hotelDto.setHotel_fitness("N");
		if(hotelDto.getHotel_internet()==null) hotelDto.setHotel_internet("N");
		if(hotelDto.getHotel_karaoke()==null) hotelDto.setHotel_karaoke("N");
		if(hotelDto.getHotel_lounge()==null) hotelDto.setHotel_lounge("N");
		if(hotelDto.getHotel_parking()==null) hotelDto.setHotel_parking("N");
		if(hotelDto.getHotel_pool()==null) hotelDto.setHotel_pool("N");
		if(hotelDto.getHotel_sauna()==null) hotelDto.setHotel_sauna("N");
		
		
		int no = hotelDao.getSequenceNumber();
		hotelDto.setHotel_no(no);
		
		System.out.println(hotelDto);
		System.out.println("main : "+file.isEmpty());
		System.out.println("1 : "+file1.isEmpty());
		System.out.println("2 : "+file2.isEmpty());
		System.out.println("3 : "+file3.isEmpty());
		System.out.println("4 : "+file4.isEmpty());
		System.out.println("5 : "+file5.isEmpty());
		System.out.println("6 : "+file6.isEmpty());
		System.out.println("7 : "+file7.isEmpty());
		System.out.println("8 : "+file8.isEmpty());
		System.out.println("9 : "+file9.isEmpty());
		System.out.println("10 : "+file10.isEmpty());
		
		HotelDto saveResult =  fileService.hotel_title_save(file);
		hotelDto.setHotel_title(saveResult.getHotel_title());
		
		hotelDao.regist(hotelDto);
		
		if(!file1.isEmpty()) {
			HotelFileDto hfdto = HotelFileDto.builder()
														.hotel_no(no)
														.build();
			
			hfdto =  fileService.hotel_save(file1, hfdto);
			
			hotelFileDao.regist(hfdto);
		}
		
		if(!file2.isEmpty()) {
			HotelFileDto hfdto = HotelFileDto.builder()
														.hotel_no(no)
														.build();
			
			hfdto =  fileService.hotel_save(file2, hfdto);
			
			hotelFileDao.regist(hfdto);
		}
		
		if(!file3.isEmpty()) {
			HotelFileDto hfdto = HotelFileDto.builder()
														.hotel_no(no)
														.build();
			
			hfdto =  fileService.hotel_save(file3, hfdto);
			
			hotelFileDao.regist(hfdto);
		}
		if(!file4.isEmpty()) {
			HotelFileDto hfdto = HotelFileDto.builder()
														.hotel_no(no)
														.build();
			
			hfdto =  fileService.hotel_save(file4, hfdto);
			
			hotelFileDao.regist(hfdto);
		}
		
		if(!file5.isEmpty()) {
			HotelFileDto hfdto = HotelFileDto.builder()
														.hotel_no(no)
														.build();
			
			hfdto =  fileService.hotel_save(file5, hfdto);
			
			hotelFileDao.regist(hfdto);
		}
		
		if(!file6.isEmpty()) {
			HotelFileDto hfdto = HotelFileDto.builder()
														.hotel_no(no)
														.build();
			
			hfdto =  fileService.hotel_save(file6, hfdto);
			
			hotelFileDao.regist(hfdto);
		}
		if(!file7.isEmpty()) {
			HotelFileDto hfdto = HotelFileDto.builder()
														.hotel_no(no)
														.build();
			
			hfdto =  fileService.hotel_save(file7, hfdto);
			
			hotelFileDao.regist(hfdto);
		}
		
		if(!file8.isEmpty()) {
			HotelFileDto hfdto = HotelFileDto.builder()
														.hotel_no(no)
														.build();
			
			hfdto =  fileService.hotel_save(file8, hfdto);
			
			hotelFileDao.regist(hfdto);
		}
		
		if(!file9.isEmpty()) {
			HotelFileDto hfdto = HotelFileDto.builder()
														.hotel_no(no)
														.build();
			
			hfdto =  fileService.hotel_save(file9, hfdto);
			
			hotelFileDao.regist(hfdto);
		}
		if(!file10.isEmpty()) {
			HotelFileDto hfdto = HotelFileDto.builder()
														.hotel_no(no)
														.build();
			
			hfdto =  fileService.hotel_save(file10, hfdto);
			
			hotelFileDao.regist(hfdto);
		}
		model.addAttribute("hotel_no",hotelDto.getHotel_no());
		

		return "redirect:content";

	}
	
	
	@GetMapping("/list")
	public String list(@ModelAttribute HotelDto hotelDto, Model model, HttpSession session) {
		int seller_no = (int) session.getAttribute("s_no");
		List<HotelDto> list = hotelDao.list(seller_no);
		model.addAttribute("list",list);
		model.addAttribute("hotel_no",hotelDto.getHotel_no());
		return "hotel/list";
	}
	
	@GetMapping("/delete")
	public void delete(@RequestParam int hotel_no, HttpServletResponse resp) throws IOException {
		boolean result = hotelDao.delete(hotel_no);
		if(result) {
			resp.getWriter().print("Y");
		}
		else {
			resp.getWriter().print("N");
		}
	}

}
