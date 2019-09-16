package com.pick.hotels.repository;

import com.pick.hotels.entity.EmailCertDto;

public interface EmailCertDao {

	void insert(String emailcert);

	EmailCertDto get(String seller_email_cert);

	void delete(String seller_email_cert);

	void clear();
	
	
	void delete_m(String member_email_cert);




}
