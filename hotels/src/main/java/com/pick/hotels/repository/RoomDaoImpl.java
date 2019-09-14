package com.pick.hotels.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.RoomDto;
import com.pick.hotels.entity.RoomListVO;
import com.pick.hotels.entity.HotelSalesVO;
import com.pick.hotels.entity.Payment_VO;

@Repository
public class RoomDaoImpl implements RoomDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void regist(RoomDto roomDto) {
		sqlSession.insert("room.regist", roomDto);
	}

	@Override
	public int getSequenceNumber() {
		return sqlSession.selectOne("room.seq");
	}

	@Override
	public RoomDto get(int room_no) {
		return sqlSession.selectOne("room.get", room_no);
	}

	@Override
	public List<RoomDto> get_list(int hotel_no, String check_in, String check_out, int people) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("hotel_no", hotel_no);
		param.put("check_in",check_in);
		param.put("check_out", check_out);
		param.put("people", people);
		
		return sqlSession.selectList("room.get_list", param);
	}

	@Override
	public List<RoomListVO> list(int hotel_no) {
		return sqlSession.selectList("room.list", hotel_no);
	}

	@Override
	public void edit(RoomDto roomDto) {
		sqlSession.update("room.edit",roomDto);
	}

	@Override
	public boolean delete(int room_no) {
		try {
			sqlSession.insert("room.delete", room_no);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public int room_check(Payment_VO payment_VO) {
		return sqlSession.selectOne("room.room_check", payment_VO);
	}

}
