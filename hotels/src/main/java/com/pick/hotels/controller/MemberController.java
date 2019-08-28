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
import com.pick.hotels.entity.MemberDto;
import com.pick.hotels.repository.CertDao;
import com.pick.hotels.repository.EmailCertDao;
import com.pick.hotels.repository.MemberDao;
import com.pick.hotels.service.EmailService;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private EmailCertDao emailcertDao;
	
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
	
		String origin = memberDto.getMember_pw();
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		memberDto.setMember_pw(encrypt);
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
//		2. BCrypt의 비교 명령을 이용하여 비교 후 처리
		if(result!=null) {
			if(BCrypt.checkpw(memberDto.getMember_pw(), result.getMember_pw())) {
				session.setAttribute("ok", result.getMember_id());
				session.setAttribute("auth", result.getMember_auth());
				session.setAttribute("no", result.getMember_no());
				
//				System.out.println("로그인 성공");
//				최종접속시간 저장
				memberDao.lasttime(memberDto.getMember_id());
				System.out.println("저장여부" + remember);
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
		memberDao.change(memberDto);
		return "redirect:info";
	}
	
	@GetMapping("/find_pw")
	public String findPassword() {
		return "member/find_pw";
	}
	
	@PostMapping("/find_pw")
	public String findPassword(@ModelAttribute MemberDto memberDto,Model model) throws MessagingException {
		MemberDto mdto = memberDao.findPassword(memberDto);
		if(mdto != null) {
			emailService.find_pw(mdto);
			return "redirect:find_pw_result";
		}
		else {
			model.addAttribute("error", "error");
			return "redirect:find_pw?";
		}
	}
	
	
	@GetMapping("/find_pw_result")
	public String findPasswordResult() {
		return "member/find_pw_result";
	}
	
	
	@Autowired
	private CertDao certDao;
	
	@GetMapping("/new_pw")
	public String newPassword(
			@RequestParam int member_no,
			@RequestParam String no,
			HttpServletResponse response,
			Model model) throws IOException {
		CertDto certDto = CertDto.builder().cert_who(member_no).cert_no(no).build();
		boolean result = certDao.validate(certDto);
		certDao.delete(certDto);
		MemberDto mdto = memberDao.get(member_no);
		if(result && mdto != null) {
			model.addAttribute("member_no", member_no);
			return "member/new_pw";
		}
		else {
			return "redirect:/member/find_pw";
		}
		
	}
	
	@PostMapping("/new_pw")
	public String newPassword(@ModelAttribute MemberDto memberDto) {
		String origin = memberDto.getMember_pw();
		String encrypt = BCrypt.hashpw(origin, BCrypt.gensalt());
		memberDto.setMember_pw(encrypt);
		
		memberDao.changePw(memberDto);
		return "member/new_pw_result";
	}
	
	@GetMapping("/find_id")
	public String findId() {
		return "member/find_id";
	}
	
	@PostMapping("find_id")
	public String findId(@ModelAttribute MemberDto memberDto, Model model) {
		
		MemberDto mdto = memberDao.findId(memberDto);
		if(mdto != null) {
			model.addAttribute("member_id",mdto.getMember_id());
			return "member/find_id_result";
		}else{
			model.addAttribute("error", "error");
			return "redirect:find_id?";
		}
	}
	
	@GetMapping("/change_pw")
	public String checkPw() {
		return "member/change_pw";
	}
	
	@PostMapping("/change_pw")
	public String checkPw(HttpSession session, @ModelAttribute MemberDto memberDto, Model model, @RequestParam String new_member_pw) {
		//memberDto 에 아이디 입력
		memberDto.setMember_id((String) session.getAttribute("ok"));				
//		기존 비밀번호와 새로운 비밀번호가 들어옴
//		[1] 기존 비밀번호가 맞는지 확인
//		[1-1] new password 암호화
		
		String new_pw = BCrypt.hashpw(new_member_pw, BCrypt.gensalt());
		
		
		
		//먼저 세션에 있는 계정 정보를 가져옴
		MemberDto check = memberDao.get((String) session.getAttribute("ok"));

		//기존 비밀번호와 입력 비밀번호를 비교하여 확인
		boolean result = BCrypt.checkpw(memberDto.getMember_pw(), check.getMember_pw());
		if(result) {
//		[2] 비밀번호가 맞으면 새로운 비밀번호로 변경
			memberDto.setMember_no((int) session.getAttribute("no"));
			memberDto.setMember_pw(new_pw);
			
			memberDao.changePw(memberDto);
			
			return "member/change_pw_result";
		}
//		[3] 비밀번호가 다르면 비밀번호 변경 실패 안내
		else {
			model.addAttribute("error", "error");
			return "redirect:change_pw?";
		}
	}
	

	
	@GetMapping("/emailcert")
	public void emailcert(@RequestParam String member_email1, @RequestParam String member_email2, HttpServletResponse resp) throws IOException, MessagingException {
			boolean result = emailService.sendCertNo_member(member_email1,member_email2);
			if(result) {
				resp.getWriter().print("Y");
			}
			else {
				resp.getWriter().print("N");
			}
		}
	
	@GetMapping("/email_cert_check")
	public void email_cert_check(@RequestParam String member_email_cert, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		EmailCertDto ecdto = emailcertDao.get(member_email_cert);
		if(ecdto==null) {
			resp.getWriter().print("N");
		}
		else {
			resp.getWriter().print("Y");
			emailcertDao.delete(member_email_cert);
		}
	}
	
	
	
	
}
