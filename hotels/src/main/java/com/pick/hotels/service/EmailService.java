package com.pick.hotels.service;

import javax.mail.MessagingException;

import com.pick.hotels.entity.MemberDto;
import com.pick.hotels.entity.SellerDto;

public interface EmailService {

	void find_pw(MemberDto mdto) throws MessagingException;
	
	boolean sendCertNo_member(String member_email1, String member_email2);

	void find_pw(SellerDto sdto) throws MessagingException;

	boolean sendCertNo(String seller_email_id, String seller_email_addr);
}
