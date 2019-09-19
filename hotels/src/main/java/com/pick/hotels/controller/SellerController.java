package com.pick.hotels.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pick.hotels.entity.EmailCertDto;
import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.HotelFileDto;
import com.pick.hotels.entity.HotelSalesVO;
import com.pick.hotels.entity.PartnerDto;
import com.pick.hotels.entity.PartnerFileDto;
import com.pick.hotels.entity.PartnerListVO;
import com.pick.hotels.entity.ReserverListVO;
import com.pick.hotels.entity.SellerCertDto;
import com.pick.hotels.entity.SellerDto;
import com.pick.hotels.repository.EmailCertDao;
import com.pick.hotels.repository.HotelDao;
import com.pick.hotels.repository.HotelFileDao;
import com.pick.hotels.repository.PartnerDao;
import com.pick.hotels.repository.PartnerFileDao;
import com.pick.hotels.repository.SellerCertDao;
import com.pick.hotels.repository.SellerDao;
import com.pick.hotels.service.EmailService;
import com.pick.hotels.service.FileService;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Autowired
	private SellerDao sellerDao;
	
	@Autowired EmailService emailService;
	
	@Autowired
	private EmailCertDao emailcertDao;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private HotelFileDao hotelFileDao;
	
	@Autowired
	private PartnerDao partnerDao;
	
	@Autowired
	private PartnerFileDao partnerFileDao;
	
	@Autowired
	private HotelDao hotelDao;
	
	
	@GetMapping("/")
	public String main(HttpSession session, Model model) {
		int seller_no = (int) session.getAttribute("s_no");
		System.out.println(seller_no);
		
//		HotelDto hotelDto = hotelDao.getNo(seller_no);
//		System.out.println(hotelDto);
		List<HotelDto> hdtoList = hotelDao.getNoList(seller_no);
		System.out.println(hdtoList);
		
//		호텔 목록에서 호텔 번호만 모아서 Sql에 전송 ----> List<HotelSaleVO>가 나오면 Model에 담아서 View에 전달
		if(hdtoList.size()>0) {
			List<HotelSalesVO> salesList = hotelDao.salesPrice(hdtoList);
			model.addAttribute("salesList", salesList);
		}
		
//		월별 건수
		List<List<HotelSalesVO>> monthly_cnt = new ArrayList<>();
		for(HotelDto list : hdtoList) {
			List<HotelSalesVO> hotel_cnt = hotelDao.sales(list.getHotel_no());
			monthly_cnt.add(hotel_cnt);
		}
		
//		월별 금액
//		List<List<HotelSalesVO>> monthly_price = new ArrayList<>();
//		for(HotelDto pricelist : hdtoList) {
//			List<HotelSalesVO> hotel_price = hotelDao.salesPrice(pricelist.getHotel_no());
//			monthly_price.add(hotel_price);
//		}
		
//		model.addAttribute("monthly_price", monthly_price);
		model.addAttribute("monthlySales", monthly_cnt);
		
		model.addAttribute("hdtolist", hdtoList);
		return "seller/main";
	}
	
	@GetMapping("/hotel_sales")
	public String hotel_sales(@RequestParam int hotel_no, Model model) {

//		해당월 날짜별 예약 건수
		List<HotelSalesVO> hotel_month_cnt = hotelDao.monthSales(hotel_no);
		
//		해당월 날짜별 매출 금액
		List<HotelSalesVO> hotel_month_price = hotelDao.monthSalesPrice(hotel_no);
		
		
//		지정호텔 전체 월별 건수
		List<HotelSalesVO> hotel_cnt = hotelDao.sales(hotel_no);
		
//		지정호텔 전체 월별 매출
		List<HotelSalesVO> hotel_price = hotelDao.hotelsalesPrice(hotel_no);
		
//		지정호텔 Dto
		HotelDto hdto = hotelDao.get(hotel_no);
		
//		해당 월 가져오기
		String this_month = hotelDao.getMonth();
		
		model.addAttribute("hotel_price", hotel_price);
		model.addAttribute("hotel_cnt", hotel_cnt);
		model.addAttribute("hotel_month_cnt", hotel_month_cnt);
		model.addAttribute("hotel_month_price", hotel_month_price);
		model.addAttribute("hdto", hdto);
		model.addAttribute("this_month", this_month);
		return "seller/hotel_sales";
	}
	
	@GetMapping("/lisence")
	public String lisence() {
		return "seller/lisence";
	}
	
	@PostMapping("/lisence")
	public String lisence(@ModelAttribute SellerDto sellerDto, HttpSession session) {
		session.setAttribute("sellerDto", sellerDto);
		return "seller/regist";
	}
	
	@GetMapping("/regist")
	public String regist() {
		return "seller/regist";
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute SellerDto sellerDto, HttpSession session) {
		SellerDto sdto = (SellerDto) session.getAttribute("sellerDto");
		String origin = sellerDto.getSeller_pw();
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		
		sellerDto.setSeller_lisence(sdto.getSeller_lisence());
		sellerDto.setSeller_name(sdto.getSeller_name());
		sellerDto.setSeller_pw(encrypt);
		
		boolean result = sellerDao.regist(sellerDto);
		session.removeAttribute("sellerDto");
		if(result)
			return "seller/regist_result";
		else
			return "seller/regist_fail";
	}
	
	@GetMapping("/id_check")
	public void id_check(@RequestParam String seller_id, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		SellerDto sdto = sellerDao.getId(seller_id);
		if(sdto==null) {
			resp.getWriter().print("Y");
		}
		else {
			resp.getWriter().print("N");
		}
			
		
	}
	
	@GetMapping("/phone_check")
	public void phone_check(@RequestParam String seller_phone, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		SellerDto sdto = sellerDao.getPhone(seller_phone);
		if(sdto==null) {
			resp.getWriter().print("Y");
		}
		else {
			resp.getWriter().print("N");
		}
	}
	
	@GetMapping("/lisence_check")
	public void lisence_check(@RequestParam String seller_lisence, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		SellerDto sdto = sellerDao.getLisence(seller_lisence);
		if(sdto==null) {
			resp.getWriter().print("Y");
		}
		else {
			resp.getWriter().print("N");
		}
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("s_ok");
		session.removeAttribute("s_no");
		return"redirect:/";
	}
	
	@GetMapping("/blacklist")
	public String blacklist() {
		return "seller/blacklist";
	}
	
	@GetMapping("/login")
	public String login() {
		return "seller/login";
	}
	
	@PostMapping("/login")
	public String login(
			@ModelAttribute SellerDto sellerDto,
			@RequestParam(required=false) String remember,
			HttpSession session,
			HttpServletResponse response,
			Model model) {
//		암호화 적용 후
//		1. DB에서 회원정보를 불러온다
		SellerDto result = sellerDao.getId(sellerDto.getSeller_id());
//		2. BCrypt의 비교 명령을 이용하여 비교 후 처리
		if(result!=null) {
			if(BCrypt.checkpw(sellerDto.getSeller_pw(),result.getSeller_pw())) {
				if(result.getSeller_blacklist().equalsIgnoreCase("Y")) {
					
					model.addAttribute("id", sellerDto.getSeller_id());
					return "redirect:/seller/blacklist" ;
				}else {
					session.setAttribute("s_ok", result.getSeller_id());
					session.setAttribute("s_no", result.getSeller_no());
					
					
					//쿠키객체를 만들고 체크여부에 따라 시간 설정 후 response에 추가
					Cookie c = new Cookie("saveId", sellerDto.getSeller_id());
					if(remember == null)//체크 안했을때 
						c.setMaxAge(0);
					else //체크 했을때
						c.setMaxAge(4 * 7 * 24 * 60 * 60);//4주
					response.addCookie(c);
					return "redirect:/seller/";
				}
			}else {
				return "seller/login_fail";
			}
		}
		else {
			return "seller/login_fail";
		}
	}
	
	@GetMapping("/checkDelete")
	public void checkDelete(HttpSession session,@RequestParam String seller_pw, HttpServletResponse resp) throws IOException {
		SellerDto sellerDto = sellerDao.getId((String)session.getAttribute("s_ok"));
		System.out.println(seller_pw);
		System.out.println(sellerDto.getSeller_pw());
		if(BCrypt.checkpw(seller_pw,sellerDto.getSeller_pw())) {
			sellerDao.delete((String)session.getAttribute("s_ok"));
			session.removeAttribute("s_ok");
			session.removeAttribute("s_no");
			resp.getWriter().print("Y");
			
		}
		else {
			resp.getWriter().print("N");
		}
	}
	@GetMapping("/goodbye")
	public String goodbye() {
		return "seller/goodbye";
	}
	
	@GetMapping("/info")
	public String info(HttpSession session, Model model) {
		String seller_id = (String) session.getAttribute("s_ok");
		SellerDto sellerDto = sellerDao.getId(seller_id);
		model.addAttribute("sdto", sellerDto);
		return "seller/info";
	}
	
	@GetMapping("/delete")
	public String delete(HttpSession session) {
		String seller_id = (String) session.getAttribute("s_ok");
		sellerDao.delete(seller_id);
		session.removeAttribute("s_ok");
		session.removeAttribute("s_no");
		return "seller/goodbye";
	} 
	
	@GetMapping("/change")
	public String change(HttpSession session, Model model) {
		String seller_id = (String) session.getAttribute("s_ok");
		SellerDto sellerDto = sellerDao.getId(seller_id);
		model.addAttribute("sdto", sellerDto);
		return "seller/change_info";
	}
	
	@PostMapping("/change")
	public String change(@ModelAttribute SellerDto sellerDto, HttpSession session) {
		sellerDto.setSeller_id((String) session.getAttribute("s_ok"));
		sellerDao.change(sellerDto);
		return "redirect:info";
	}
	
	@GetMapping("/emailcert")
	public void emailcert(@RequestParam String seller_email_id, @RequestParam String seller_email_addr, HttpServletResponse resp) throws IOException, MessagingException {
			boolean result = emailService.sendCertNo(seller_email_id,seller_email_addr);
			if(result) {
				resp.getWriter().print("Y");
			}
			else {
				resp.getWriter().print("N");
			}
		}
	
	@GetMapping("/email_cert_check")
	public void email_cert_check(@RequestParam String seller_email_cert, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		EmailCertDto ecdto = emailcertDao.get(seller_email_cert);
		if(ecdto==null) {
			resp.getWriter().print("N");
		}
		else {
			resp.getWriter().print("Y");
			emailcertDao.delete(seller_email_cert);
		}
	}
	@GetMapping("/find_pw")
	public String findPassword() {
		return "seller/find_pw";
	}
	
	@PostMapping("/find_pw")
	public String findPassword(@ModelAttribute SellerDto sellerDto,Model model) throws MessagingException {
		SellerDto sdto = sellerDao.findPassword(sellerDto);
		if(sdto != null) {
			emailService.find_pw(sdto);
			return "redirect:find_pw_result";
		}
		else {
			model.addAttribute("error", "error");
			return "redirect:find_pw?";
		}
	}
	
	
	@GetMapping("/find_pw_result")
	public String findPasswordResult() {
		return "seller/find_pw_result";
	}
	
	
	@Autowired
	private SellerCertDao sellerCertDao;
	
	@GetMapping("/new_pw")
	public String newPassword(
			@RequestParam int seller_no,
			@RequestParam String no,
			HttpServletResponse response,
			Model model) throws IOException {
		SellerCertDto sellerCertDto = SellerCertDto.builder().seller_cert_who(seller_no).seller_cert_no(no).build();
		boolean result = sellerCertDao.validate(sellerCertDto);
		SellerDto sdto = sellerDao.get(seller_no);
		System.out.println("---------------------------------------------------");
		System.out.println(sdto);
		System.out.println(result);
		System.out.println("---------------------------------------------------");
		if(result && sdto != null) {
			model.addAttribute("seller_no", seller_no);
			System.out.println("이프가 트루일때");
			sellerCertDao.delete(sellerCertDto);
			return "seller/new_pw";
		}
		else {
			return "redirect:/seller/find_pw";
		}
		
	}
	
	@PostMapping("/new_pw")
	public String newPassword(@ModelAttribute SellerDto sellerDto) {
		String origin = sellerDto.getSeller_pw();
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		sellerDto.setSeller_pw(encrypt);
		
		sellerDao.changePw(sellerDto);
		return "seller/new_pw_result";
	}
	
	@GetMapping("/find_id")
	public String findId() {
		return "seller/find_id";
	}
	
	@PostMapping("find_id")
	public String findId(@ModelAttribute SellerDto sellerDto, Model model) {
		
		SellerDto sdto = sellerDao.findId(sellerDto);
		if(sdto != null) {
			model.addAttribute("seller_id",sdto.getSeller_id());
			return "seller/find_id_result";
		}else{
			model.addAttribute("error", "error");
			return "redirect:find_id?";
		}
	}
	
	@GetMapping("/change_pw")
	public String checkPw() {
		return "seller/change_pw";
	}
	
	@PostMapping("/change_pw")
	public String checkPw(HttpSession session, @ModelAttribute SellerDto sellerDto, Model model, @RequestParam String new_seller_pw) {
		//memberDto 에 아이디 입력
		sellerDto.setSeller_id((String) session.getAttribute("s_ok"));				
//		기존 비밀번호와 새로운 비밀번호가 들어옴
//		[1] 기존 비밀번호가 맞는지 확인
//		[1-1] new password 암호화
		String new_pw = BCrypt.hashpw(new_seller_pw, BCrypt.gensalt());
		
		//먼저 세션에 있는 계정 정보를 가져옴
		int seller_no = (int) session.getAttribute("s_no");
		SellerDto check = sellerDao.getId((String) session.getAttribute("s_ok"));
	
		//기존 비밀번호와 입력 비밀번호를 비교하여 확인
		boolean result = BCrypt.checkpw(sellerDto.getSeller_pw(), check.getSeller_pw());
		
		if(result) {
//		[2] 비밀번호가 맞으면 새로운 비밀번호로 변경
			sellerDto.setSeller_no(seller_no);
			sellerDto.setSeller_pw(new_pw);
			
			sellerDao.changePw(sellerDto);
			session.removeAttribute("s_no");
			session.removeAttribute("s_ok");
			return "seller/change_pw_result";
		}
//		[3] 비밀번호가 다르면 비밀번호 변경 실패 안내
		else {
			model.addAttribute("error", "error");
			return "redirect:/seller/change_pw?";
		}
	}
	
	
	@GetMapping("/hotel/regist")
	public String hotel_regist() {
		return "hotel/regist";
	}
	@PostMapping("/hotel/regist")
	public String hotel_regist(@ModelAttribute HotelDto hotelDto,HttpSession session,Model model, @RequestParam MultipartFile file,
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
		

		return "redirect:detail";

	}
	
	
	@GetMapping("/hotel/list")
	public String list(@ModelAttribute HotelDto hotelDto, Model model, HttpSession session) {
		int seller_no = (int) session.getAttribute("s_no");
		List<HotelDto> list = hotelDao.list(seller_no);
		model.addAttribute("list",list);
		model.addAttribute("hotel_no",hotelDto.getHotel_no());
		return "hotel/list";
	}
	
	@GetMapping("/hotel/delete")
	public void delete(@RequestParam int hotel_no, HttpServletResponse resp) throws IOException {
		boolean result = hotelDao.delete(hotel_no);
		if(result) {
			resp.getWriter().print("Y");
			fileService.hotel_delete(hotel_no);
		}
		else {
			resp.getWriter().print("N");
		}
	}
	
	@GetMapping("/hotel/edit")
	public String edit(@RequestParam int hotel_no, Model model) {
		model.addAttribute("hdto", hotelDao.get(hotel_no));
		model.addAttribute("hfdtolist", hotelFileDao.getlist(hotel_no));
		return "hotel/edit";
	}
	
	@PostMapping("/hotel/edit")
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
			@RequestParam(required = false, defaultValue = "0") String hotel_file,
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
		
		int hotel_no = hotelDto.getHotel_no();
		System.out.println(hotel_file);
		if(!file.isEmpty()) {
			fileService.hotel_delete(hotelDto);
			HotelDto saveResult =  fileService.hotel_title_save(file);
			hotelDto.setHotel_title(saveResult.getHotel_title());
		}
		System.out.println(hotelDto);
		
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
		hotelDto.setHotel_title(hotel_file);
		hotelDao.edit(hotelDto);
		
		if(!file1.isEmpty()) {
		
			if(hotel_file_no1 > 0) {
				fileService.hotel_delete(hotel_file_no1);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(hotel_no)
						.build();
	
				hfdto =  fileService.hotel_save(file1, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file2.isEmpty()) {
			
			if(hotel_file_no2 > 0) {
				fileService.hotel_delete(hotel_file_no2);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(hotel_no)
						.build();
	
				hfdto =  fileService.hotel_save(file2, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file3.isEmpty()) {
			
			if(hotel_file_no3 > 0) {
				fileService.hotel_delete(hotel_file_no3);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(hotel_no)
						.build();
	
				hfdto =  fileService.hotel_save(file3, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file4.isEmpty()) {
			
			if(hotel_file_no4 > 0) {
				fileService.hotel_delete(hotel_file_no4);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(hotel_no)
						.build();
	
				hfdto =  fileService.hotel_save(file4, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file5.isEmpty()) {
			
			if(hotel_file_no5 > 0) {
				fileService.hotel_delete(hotel_file_no5);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(hotel_no)
						.build();
	
				hfdto =  fileService.hotel_save(file5, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file6.isEmpty()) {
			
			if(hotel_file_no3 > 0) {
				fileService.hotel_delete(hotel_file_no6);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(hotel_no)
						.build();
	
				hfdto =  fileService.hotel_save(file6, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file7.isEmpty()) {
			
			if(hotel_file_no7 > 0) {
				fileService.hotel_delete(hotel_file_no7);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(hotel_no)
						.build();
	
				hfdto =  fileService.hotel_save(file7, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file8.isEmpty()) {
			
			if(hotel_file_no8 > 0) {
				fileService.hotel_delete(hotel_file_no8);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(hotel_no)
						.build();
	
				hfdto =  fileService.hotel_save(file8, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file9.isEmpty()) {
			
			if(hotel_file_no9 > 0) {
				fileService.hotel_delete(hotel_file_no9);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(hotel_no)
						.build();
	
				hfdto =  fileService.hotel_save(file9, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		if(!file10.isEmpty()) {
			
			if(hotel_file_no10 > 0) {
				fileService.hotel_delete(hotel_file_no10);
			}
			
				HotelFileDto hfdto = HotelFileDto.builder()
						.hotel_no(hotel_no)
						.build();
	
				hfdto =  fileService.hotel_save(file10, hfdto);
	
				hotelFileDao.regist(hfdto);
		}
		
		
		model.addAttribute("hotel_no", hotel_no);
		
		
		return "redirect:detail";
	}
	
	@GetMapping("/hotel/detail")
	public String detail(@RequestParam int hotel_no, Model model) {
		HotelDto hotelDto = hotelDao.get(hotel_no);
		model.addAttribute("hdto", hotelDto);
		model.addAttribute("hfdtolist", hotelFileDao.getlist(hotel_no));
		return "hotel/detail";
	}
	
	@GetMapping("/hotel/partner/regist")
	public String partner_regist(@RequestParam int hotel_no) {
		return "/partner/regist";
	}
	
	@PostMapping("/hotel/partner/regist")
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
		return "redirect:detail";
	}
	
	@GetMapping("/hotel/partner/delete")
	public void partner_delete(@RequestParam int partner_no, HttpServletResponse resp) throws IOException {
		boolean result = partnerDao.delete(partner_no);
		if(result) {
			resp.getWriter().print("Y");
			fileService.partner_delete(partner_no);
		} 
		else {
			resp.getWriter().print("N");
		}
	}
	
	@GetMapping("/hotel/partner/list")
	public String partner_list(@RequestParam int hotel_no, Model model) {
			List<PartnerListVO> list = partnerDao.list(hotel_no);
			model.addAttribute("list", list);
			System.out.println(list);
			return "/partner/list";
	}
	
	@GetMapping("/hotel/partner/detail")
	public String partner_detail(@RequestParam int partner_no, Model model) {
		PartnerDto partnerDto = partnerDao.get(partner_no);
		model.addAttribute("pdto", partnerDto);
		model.addAttribute("pfdtolist", partnerFileDao.getlist(partner_no));
		
		return "/partner/detail";
	}
	
	@GetMapping("/hotel/reserverlist")
	public String reserve_list(@RequestParam int hotel_no, Model model) {
		HotelDto hdto = hotelDao.get(hotel_no);
		List<ReserverListVO> rlist = hotelDao.getReserver(hotel_no);
		
		model.addAttribute("hdto", hdto);
		model.addAttribute("rlist", rlist);
		return "/hotel/reserverlist";
	}
	

}
