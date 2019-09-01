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

import com.pick.hotels.entity.AttractionDto;
import com.pick.hotels.entity.AttractionFileDto;
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
	
	@GetMapping("/edit")
	public String edit(@RequestParam int hotel_no, Model model) {
		model.addAttribute("hdto", hotelDao.get(hotel_no));
		model.addAttribute("hfdtolist", hotelFileDao.getlist(hotel_no));
		return "hotel/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute HotelDto hotelDto,
			@RequestParam(required = false) MultipartFile file,
			@RequestParam(required = false) MultipartFile file1,
			@RequestParam(required = false) MultipartFile file2,
			@RequestParam(required = false) MultipartFile file3,
			@RequestParam(required = false) MultipartFile file4,
			@RequestParam(required = false) MultipartFile file5,
			@RequestParam(required = false) MultipartFile file6,
			@RequestParam(required = false) MultipartFile file7,
			@RequestParam(required = false) MultipartFile file8,
			@RequestParam(required = false) MultipartFile file9,
			@RequestParam(required = false) MultipartFile file10,
			@RequestParam(required = false, defaultValue = "0") int hotel_file_no0,
			@RequestParam(required = false, defaultValue = "0") int hotel_file_no1,
			@RequestParam(required = false, defaultValue = "0") int hotel_file_no2,
			@RequestParam(required = false, defaultValue = "0") int hotel_file_no3,
			@RequestParam(required = false, defaultValue = "0") int hotel_file_no4,
			@RequestParam(required = false, defaultValue = "0") int hotel_file_no5,
			@RequestParam(required = false, defaultValue = "0") int hotel_file_no6,
			@RequestParam(required = false, defaultValue = "0") int hotel_file_no7,
			@RequestParam(required = false, defaultValue = "0") int hotel_file_no8,
			@RequestParam(required = false, defaultValue = "0") int hotel_file_no9,
			@RequestParam(required = false, defaultValue = "0") int hotel_file_no10,
			Model model) throws IllegalStateException, IOException {
		
		int no = hotelDto.getHotel_no();
		if(hotel_file_no0 > 0) {
			fileService.hotel_title_edit(hotel_file_no0,no);
			HotelDto saveResult =  fileService.hotel_title_update(file,no);
			hotelDto.setHotel_title(saveResult.getHotel_title());
		}
		hotelDao.edit(hotelDto);
		
//		수정을 하게되면 
//		1. 수정한 글 내용
//		2. 수정파일1, 2, 3
//		이 넘어오게 되는데 이것을 받아서 수정 처리를 한다.
//		-> 글 내용은 그냥 수정
//		->
		if(!file1.isEmpty()) {
		
			if(hotel_file_no1 > 0) {
				fileService.hotel_delete(hotel_file_no1);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(no)
						.build();
	
				hfdto =  fileService.hotel_save(file1, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file2.isEmpty()) {
			
			if(hotel_file_no2 > 0) {
				fileService.hotel_delete(hotel_file_no2);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(no)
						.build();
	
				hfdto =  fileService.hotel_save(file2, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file3.isEmpty()) {
			
			if(hotel_file_no3 > 0) {
				fileService.hotel_delete(hotel_file_no3);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(no)
						.build();
	
				hfdto =  fileService.hotel_save(file3, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file4.isEmpty()) {
			
			if(hotel_file_no4 > 0) {
				fileService.hotel_delete(hotel_file_no4);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(no)
						.build();
	
				hfdto =  fileService.hotel_save(file4, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file5.isEmpty()) {
			
			if(hotel_file_no5 > 0) {
				fileService.hotel_delete(hotel_file_no5);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(no)
						.build();
	
				hfdto =  fileService.hotel_save(file5, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file6.isEmpty()) {
			
			if(hotel_file_no3 > 0) {
				fileService.hotel_delete(hotel_file_no6);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(no)
						.build();
	
				hfdto =  fileService.hotel_save(file6, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file7.isEmpty()) {
			
			if(hotel_file_no7 > 0) {
				fileService.hotel_delete(hotel_file_no7);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(no)
						.build();
	
				hfdto =  fileService.hotel_save(file7, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file8.isEmpty()) {
			
			if(hotel_file_no8 > 0) {
				fileService.hotel_delete(hotel_file_no8);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(no)
						.build();
	
				hfdto =  fileService.hotel_save(file8, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file9.isEmpty()) {
			
			if(hotel_file_no9 > 0) {
				fileService.hotel_delete(hotel_file_no9);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(no)
						.build();
	
				hfdto =  fileService.hotel_save(file9, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file10.isEmpty()) {
			
			if(hotel_file_no10 > 0) {
				fileService.hotel_delete(hotel_file_no10);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(no)
						.build();
	
				hfdto =  fileService.hotel_save(file10, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		
		model.addAttribute("hotel_no", no);
		
		return "redirect:content";
	}
	
	@GetMapping("partner/regist")
	public String partner_regist(@RequestParam int hotel_int) {
		return "hotel/partner/regist";
	}
	
	@PostMapping("partner/regist")
	public String partner_regist(
			@ModelAttribute PartnerDto partnerDto,@RequestParam int hotel_no, Model model,
			@RequestParam MultipartFile file1, @RequestParam MultipartFile file2, 
			@RequestParam MultipartFile file3, @RequestParam MultipartFile file4) throws IllegalStateException, IOException {
		
		int no = partnerDao.getSequenceNumber();
		partnerDto.setPartner_no(no);
		partnerDao.regist(partnerDto);
		
		
		if(!file1.isEmpty()) {
			PartnerFileDto pfdto = PartnerFileDto.builder()
														.partner_no(no)
														.build();
			
			pfdto =  fileService.partner_save(file1, pfdto);
			
			partnerFileDao.regist(pfdto);
		}
		
		if(!file2.isEmpty()) {
			PartnerFileDto pfdto = PartnerFileDto.builder()
														.partner_no(no)
														.build();
			
			pfdto =  fileService.partner_save(file2, pfdto);
			
			partnerFileDao.regist(pfdto);
		}
		
		if(!file3.isEmpty()) {
			PartnerFileDto pfdto = PartnerFileDto.builder()
														.partner_no(no)
														.build();
			
			pfdto =  fileService.partner_save(file3, pfdto);
			
			partnerFileDao.regist(pfdto);
		}
		
		if(!file4.isEmpty()) {
			PartnerFileDto pfdto = PartnerFileDto.builder()
														.partner_no(no)
														.build();
			
			pfdto =  fileService.partner_save(file4, pfdto);
			
			partnerFileDao.regist(pfdto);
		}
		
		model.addAttribute("partner_no",partnerDto.getPartner_no());
		model.addAttribute("hotel_no",hotel_no);
		return "redirect:partner/content";
	}

}
