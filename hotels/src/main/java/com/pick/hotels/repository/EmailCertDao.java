package com.pick.hotels.repository;

import com.pick.hotels.entity.EmailCertDto;

public interface EmailCertDao {

	void insert(String emailcert);

	EmailCertDto get(String seller_email_cert);



}
