package com.pick.hotels.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.pick.hotels.repository.CertDao;
import com.pick.hotels.repository.EmailCertDao;
import com.pick.hotels.repository.SellerCertDao;

@Service
public class CertificationRemoveTaskServiceImpl implements CertificationRemoveTaskService{

	@Autowired
	private EmailCertDao emailcertDao;
	
	@Autowired
	private CertDao certDao;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private SellerCertDao sellerCertDao;
	
	@Override
	@Scheduled(cron = "0 */5 * * * *")
	public void seller_run() {
		emailcertDao.clear();
		logger.info("인증번호 초기화 작업이 수행되었습니다"); 
	}
	
	@Override
	@Scheduled(cron = "0 */5 * * * *")
	public void seller_run_cert() {
		sellerCertDao.clear();
		logger.info("인증번호 초기화 작업이 수행되었습니다"); 
	}

	@Override
	@Scheduled(cron = "0 */5 * * * *")
	public void member_run_cert() {
		certDao.clear();
		logger.info("인증번호 초기화 작업이 수행되었습니다"); 
	}
	
}





