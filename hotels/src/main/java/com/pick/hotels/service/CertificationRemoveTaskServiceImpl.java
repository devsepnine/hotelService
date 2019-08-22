package com.pick.hotels.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.pick.hotels.repository.EmailCertDao;

@Service
public class CertificationRemoveTaskServiceImpl implements CertificationRemoveTaskService{

	@Autowired
	private EmailCertDao emailcertDao;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
//	목표 : 매 정각마다 남아있는 인증번호 중 5분이 지난 것을 삭제
	@Override
	@Scheduled(cron = "0 5 * * * *")
	public void run() {
		emailcertDao.clear();
		logger.info("인증번호 초기화 작업이 수행되었습니다");
	}

}





