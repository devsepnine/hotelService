package com.pick.hotels.service;

import javax.mail.MessagingException;

import com.pick.hotels.entity.MemberDto;

public interface EmailService {

	void find_pw(MemberDto mdto) throws MessagingException;

}
