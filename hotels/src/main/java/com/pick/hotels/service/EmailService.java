package com.pick.hotels.service;

import javax.mail.MessagingException;

import com.pick.hotels.entity.MemberDto;
import com.pick.hotels.entity.SellerDto;

public interface EmailService {

	void find_pw(MemberDto mdto) throws MessagingException;
	
	void sendCertNo(SellerDto sdto) throws MessagingException;

}
