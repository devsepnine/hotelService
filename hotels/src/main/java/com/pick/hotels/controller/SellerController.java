package com.pick.hotels.controller;

import java.io.IOException;

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

import com.pick.hotels.entity.CertDto;
import com.pick.hotels.entity.EmailCertDto;
import com.pick.hotels.entity.SellerDto;
import com.pick.hotels.repository.CertDao;
import com.pick.hotels.repository.EmailCertDao;
import com.pick.hotels.repository.SellerDao;
import com.pick.hotels.service.EmailService;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Autowired
	private SellerDao sellerDao;
	
	@Autowired EmailService emailService;
	
	@Autowired
	private EmailCertDao emailcertDao;
	
	@GetMapping("/main")
	public String main() {
		return "seller/main";
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
		System.out.println(sellerDto);
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
		session.removeAttribute("ok");
		session.removeAttribute("no");
		session.removeAttribute("auth");
		return"redirect:/";
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
			HttpServletResponse response) {
//		암호화 적용 전
//		MemberDto result = memberDao.login(memberDto);
//		if(result != null) {
//		암호화 적용 후
//		1. DB에서 회원정보를 불러온다
		SellerDto result = sellerDao.getId(sellerDto.getSeller_id());
//		2. BCrypt의 비교 명령을 이용하여 비교 후 처리
		if(result!=null) {
			if(BCrypt.checkpw(sellerDto.getSeller_pw(),result.getSeller_pw())) {
				session.setAttribute("s_ok", result.getSeller_id());
				session.setAttribute("s_no", result.getSeller_no());
				
				
				//쿠키객체를 만들고 체크여부에 따라 시간 설정 후 response에 추가
				Cookie c = new Cookie("saveId", sellerDto.getSeller_id());
				if(remember == null)//체크 안했을때 
					c.setMaxAge(0);
				else //체크 했을때
					c.setMaxAge(4 * 7 * 24 * 60 * 60);//4주
				response.addCookie(c);
				
				return "redirect:/seller/main";
			}else {
				return "seller/login_fail";
			}
		}
		else {
			return "seller/login_fail";
		}
	}
	
	@GetMapping("/info")
	public String info(HttpSession session, Model model) {
		String seller_id = (String) session.getAttribute("s_ok");
		SellerDto sellerDto = sellerDao.getId(seller_id);
		System.out.println(sellerDto);
		model.addAttribute("sdto", sellerDto);
		return "seller/info";
	}
	
	@GetMapping("/delete")
	public String delete(HttpSession session) {
		String seller_id = (String) session.getAttribute("s_ok");
		sellerDao.delete(seller_id);
		session.removeAttribute("ok");
		session.removeAttribute("auth");
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
		System.out.println(sellerDto);
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
	private CertDao certDao;
	
	@GetMapping("/new_pw")
	public String newPassword(
			@RequestParam int seller_no,
			@RequestParam String no,
			HttpServletResponse response,
			Model model) throws IOException {
		CertDto certDto = CertDto.builder().cert_who(seller_no).cert_no(no).build();
		boolean result = certDao.validate(certDto);
		System.out.println(result);
		certDao.delete(certDto);
		SellerDto sdto = sellerDao.get(seller_no);
		if(result && sdto != null) {
			model.addAttribute("seller_no", seller_no);
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
		SellerDto check = sellerDao.getId((String) session.getAttribute("s_ok"));
	
		//기존 비밀번호와 입력 비밀번호를 비교하여 확인
		boolean result = BCrypt.checkpw(sellerDto.getSeller_pw(), check.getSeller_pw());
		
		
		if(result) {
//		[2] 비밀번호가 맞으면 새로운 비밀번호로 변경
			sellerDto.setSeller_pw(new_pw);
			
			sellerDao.changePw(sellerDto);
			
			return "seller/new_pw_result";
		}
//		[3] 비밀번호가 다르면 비밀번호 변경 실패 안내
		else {
			return "redirect:new_change_pw?error";
		}
	}
}
