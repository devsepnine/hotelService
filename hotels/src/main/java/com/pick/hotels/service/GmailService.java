package com.pick.hotels.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.pick.hotels.entity.CertDto;
import com.pick.hotels.repository.CertDao;

@Service
public class GmailService implements EmailService{
	
	@Autowired
	private JavaMailSender sender;
	
	@Autowired
	private RandomStringService randomStringService;
	
	@Autowired
	private CertDao certDao;

	@Override
	public void sendCertificertion(String member_email1, String member_email2) throws MessagingException {
//		인증번호 생성
		String no = randomStringService.generate(128);
		String email = member_email1+"@"+member_email2;
		
		certDao.insert(CertDto.builder().cert_who(email).cert_no(no).build());
		
		MimeMessage mail = sender.createMimeMessage();
		MimeMessageHelper helper = 
				new MimeMessageHelper(mail, false, "UTF-8");
		
		helper.setFrom("");
		helper.setTo(member_email1+"@"+member_email2);
		helper.setSubject("[] 비밀번호 변경 메일 입니다");
		String address = ServletUriComponentsBuilder
													.fromCurrentContextPath()
													.port(8080)
													.path("/member/new_pw")
													.queryParam("email", member_email1+"@"+member_email2)
													.queryParam("no", no)
													.toUriString();
		helper.setText("<h3><a href = '"+address+"'이곳을 눌러 인증을 완료하세요");
		sender.send(mail);
		
	}
	
}
