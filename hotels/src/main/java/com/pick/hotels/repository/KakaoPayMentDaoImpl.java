package com.pick.hotels.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.KakaoPayMentDto;

@Repository
public class KakaoPayMentDaoImpl implements KakaoPayMentDao{

	private @Autowired SqlSession sqlSession;
	
	@Override
	public void inster_pay(KakaoPayMentDto kdto) {
		sqlSession.insert("kakaopayment.insert", kdto);
		
	}

	@Override
	public KakaoPayMentDto selectOne(int order_id) {
		
		return sqlSession.selectOne("kakaopayment.select_order", order_id);
	}

	@Override
	public void update_canceled(int order_id) {
		sqlSession.update("kakaopayment.update_canceled", order_id);
		
	}

}
