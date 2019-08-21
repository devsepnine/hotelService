package com.pick.hotels.service;

import javax.mail.MessagingException;

public interface EmailService {

	void sendCertificertion(String member_email1, String member_email2) throws MessagingException;
	
	void sendCertNo(String seller_email_id, String seller_email_addr) throws MessagingException;
}
