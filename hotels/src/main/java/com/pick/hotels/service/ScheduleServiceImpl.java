package com.pick.hotels.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.pick.hotels.repository.CouponDao;
import com.pick.hotels.repository.ReserveDao;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	private CouponDao couponDao;
	
	@Autowired
	private ReserveDao reserveDao;
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	@Scheduled(cron = "0 0 0 * * *")
	public void coupon_check() {
		couponDao.update();
		logger.info("쿠폰 사용기간 조회가 완료되었습니다.");
	}

	@Override
	@Scheduled(cron = "0 0 0 * * *")
	public void reserve_check() {
		reserveDao.update();
		System.out.println("예약 상태조회가 완료되었습니다");
		
	}
	


}
