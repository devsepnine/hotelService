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
	public List<HotelDto> list(int seller_no) {
		return sqlSession.selectList("hotel.list",seller_no);
	}

	@Override
	public List<HotelListVo> get_h_list() {
		List<HotelListVo> list = sqlSession.selectList("hotel.search_list");
		return list;
	}

	@Override
	public int getSequenceNumber() {
		return sqlSession.selectOne("hotel.seq");
	}

	@Override
	public boolean delete(int hotel_no) {
		try {
			sqlSession.insert("hotel.delete", hotel_no);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
