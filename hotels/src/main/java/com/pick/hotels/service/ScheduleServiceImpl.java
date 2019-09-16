package com.pick.hotels.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.pick.hotels.repository.CouponDao;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	private CouponDao couponDao;
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	@Scheduled(cron = "* * 0 * * *")
	public void coupon_check() {
		couponDao.update();
		logger.info("쿠폰 사용기간 조회가 완료되었습니다.");
	}
	


}
