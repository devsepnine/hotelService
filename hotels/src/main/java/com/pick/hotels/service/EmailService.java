package com.pick.hotels.service;

import javax.mail.MessagingException;

public interface EmailService {

	void sendCertificertion(String member_email1, String member_email2) throws MessagingException;

}
