package com.pick.hotels.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.HotelListVo;

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

	@Override
	public List<HotelListVo> get_h_list() {
		List<HotelListVo> list = sqlSession.selectList("hotel.search_list");
		System.out.println(list);
		return list;
	}

}
