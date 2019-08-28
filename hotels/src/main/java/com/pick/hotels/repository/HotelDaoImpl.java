package com.pick.hotels.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.HotelDto;

@Repository
public class HotelDaoImpl implements HotelDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void regist(HotelDto hotelDto) {
		sqlSession.insert("hotel.regist", hotelDto);
	}

	@Override
	public List<HotelDto> list(String seller_id) {
		return sqlSession.selectList("hotel.list",seller_id);
	}

}
