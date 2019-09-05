package com.pick.hotels.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.CouponDto;

@Repository
public interface CouponDao {

	void regist(CouponDto couponDto);
	CouponDto get(int no);
	void edit(CouponDto couponDto);
	List<CouponDto> list(String type, String keyword, int start, int end);
	List<CouponDto> blacklist(String type, String keyword, int start, int end);
	int count(String type, String keyword);
	int getSequenceNumber();
	
}
