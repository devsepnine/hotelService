package com.pick.hotels.controller;

import java.io.IOException;
import java.security.SecureRandom;

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
import com.pick.hotels.entity.MemberDto;
import com.pick.hotels.repository.CertDao;
import com.pick.hotels.repository.MemberDao;
import com.pick.hotels.service.EmailService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private EmailService emailService;
	
	@GetMapping("/agree")
	public String agree() {
		return "member/agree";
	}
	
	@GetMapping("/regist")
	public String regist(@RequestParam(required = false, defaultValue = "no") String agree) {
		if(agree.equals("no")) {
			return "redirect:/member/agree";
		}
		else {
			return "member/regist";
		}
	}
	
	@PostMapping("/regist")
	public String regist(@ModelAttribute MemberDto memberDto) {
		System.out.println(memberDto);
	
		String origin = memberDto.getMember_pw();
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		memberDto.setMember_pw(encrypt);
		System.out.println(encrypt);
		boolean result = memberDao.regist(memberDto);
		if(result)
			return "member/regist_result";
		else
			return "member/regist_fail";
	}
	
	@GetMapping("/id_check")
	public void id_check(@RequestParam String member_id, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		MemberDto mdto = memberDao.get(member_id);
		if(mdto==null) {
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
		return "member/login";
	}
	
	@PostMapping("/login")
	public String login(
			@ModelAttribute MemberDto memberDto,
			@RequestParam(required=false) String remember,
			HttpSession session,
			HttpServletResponse response) {
//		암호화 적용 전
//		MemberDto result = memberDao.login(memberDto);
//		if(result != null) {
		
//		암호화 적용 후
//		1. DB에서 회원정보를 불러온다
		MemberDto result = memberDao.get(memberDto.getMember_id());
		System.out.println(result);
//		2. BCrypt의 비교 명령을 이용하여 비교 후 처리
		if(result!=null) {
			if(BCrypt.checkpw(memberDto.getMember_pw(), result.getMember_pw())) {
				session.setAttribute("ok", result.getMember_id());
				session.setAttribute("auth", result.getMember_auth());
				session.setAttribute("no", result.getMember_no());
				
				System.out.println("로그인 성공");
				
				memberDao.lasttime(memberDto.getMember_id());
				
				//쿠키객체를 만들고 체크여부에 따라 시간 설정 후 response에 추가
				Cookie c = new Cookie("saveId", memberDto.getMember_id());
				if(remember == null)//체크 안했을때 
					c.setMaxAge(0);
				else //체크 했을때
					c.setMaxAge(4 * 7 * 24 * 60 * 60);//4주
				response.addCookie(c);
				
				return "redirect:/";
			}else {
				return "member/login_fail";
			}
		}
		else {
			return "member/login_fail";
		}
	}
	
	@GetMapping("/info")
	public String info(HttpSession session, Model model) {
		String member_id = (String) session.getAttribute("ok");
		MemberDto memberDto = memberDao.get(member_id);
		System.out.println(memberDto);
		model.addAttribute("mdto", memberDto);
		return "member/info";
	}
	
	@GetMapping("/delete")
	public String delete(HttpSession session) {
		String member_id = (String) session.getAttribute("ok");
		memberDao.delete(member_id);
		session.removeAttribute("ok");
		session.removeAttribute("auth");
		return "member/goodbye";
	}
	
	@GetMapping("/change")
	public String change(HttpSession session, Model model) {
		String member_id = (String) session.getAttribute("ok");
		MemberDto memberDto = memberDao.get(member_id);
		model.addAttribute("mdto", memberDto);
		return "member/change_info";
	}
	
	@PostMapping("/change")
	public String change(@ModelAttribute MemberDto memberDto, HttpSession session) {
		memberDto.setMember_id((String) session.getAttribute("ok"));
		System.out.println(memberDto);
		memberDao.change(memberDto);
		return "redirect:info";
	}
	
	@GetMapping("/find_pw")
	public String findPassword() {
		return "member/find_pw";
	}
	
	@PostMapping("/find_pw")
	public String findPassword(@ModelAttribute MemberDto memberDto) throws MessagingException {
		boolean exist = memberDao.findPassword(memberDto);
		if(exist) {
			emailService.sendCertificertion(memberDto.getMember_email1(),memberDto.getMember_email2());
			return "redirect:find_pw_result";
		}
		else {
			return "redirect:find_pw?error";
		}
	}

	
	@Autowired
	private CertDao certDao;
	
	@GetMapping("/new_pw")
	public String newPassword(
			@RequestParam String member_email,
			@RequestParam String member_no,
			HttpServletResponse response,
			Model model) {
		
		CertDto certDto = CertDto.builder().cert_who(member_email).cert_no(member_no).build();
		boolean result = certDao.validate(certDto);
//		certDao.delete(certDto);
		
		if(result) {
			model.addAttribute("member_email", member_email);
			return "member/new_pw";
		}
		else {
//			response.sendError(401);
			return null;
		}
		
	}
	
	
}
