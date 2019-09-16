package com.pick.hotels.repository;

import com.pick.hotels.entity.KakaoPayMentDto;

public interface KakaoPayMentDao {

	void inster_pay(KakaoPayMentDto kdto);

	KakaoPayMentDto selectOne(int order_id);

	void update_canceled(int order_id);

}
