package com.pick.hotels.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.H_search_vo;
import com.pick.hotels.entity.HotelDto;
import com.pick.hotels.entity.HotelListVo;
import com.pick.hotels.entity.HotelSalesVO;

@Repository
public class HotelDaoImpl implements HotelDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void regist(HotelDto hotelDto) {
		System.out.println(hotelDto);
		sqlSession.insert("hotel.regist", hotelDto);
	}

	@Override
	public List<HotelDto> list(int seller_no) {
		return sqlSession.selectList("hotel.list",seller_no);
	}

	@Override
	public List<HotelListVo> get_h_list(H_search_vo h_search_vo) {
		List<HotelListVo> list = sqlSession.selectList("hotel.search_list", h_search_vo);
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

	@Override
	public HotelDto get(int hotel_no) {
		return sqlSession.selectOne("hotel.get", hotel_no);
	}

	@Override
	public void edit(HotelDto hotelDto) {
		sqlSession.update("hotel.edit", hotelDto);
	}

	@Override
	public HotelDto getNo(int seller_no) {
		return sqlSession.selectOne("hotel.getNo",seller_no);
	}

	@Override
	public List<HotelDto> getNoList(int seller_no) {
		return sqlSession.selectList("hotel.getNoList",seller_no);
	}

	@Override
	public List<HotelSalesVO> sales(int hotel_no) {
		return sqlSession.selectList("hotel.sales", hotel_no);
	}


}
