package com.pick.hotels.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.HotelFileDto;

@Repository
public class HotelFileDaoImpl implements HotelFileDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void regist(HotelFileDto hfdto) {
		System.out.println(hfdto.getHotel_no());
		sqlSession.insert("hotelFile.regist", hfdto);
		
	}

	@Override
	public List<HotelFileDto> getlist(int hotel_no) {
		return sqlSession.selectList("hotelFile.getlist", hotel_no);
	}

	@Override
	public HotelFileDto get(int no) {
		return sqlSession.selectOne("hotelFile.get", no);
	}

	@Override
	public void delete(int no) {
		sqlSession.delete("hotelFile.delete", no);
	}

}
