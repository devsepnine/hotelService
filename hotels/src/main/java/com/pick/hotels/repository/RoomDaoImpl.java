package com.pick.hotels.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.RoomDto;
import com.pick.hotels.entity.RoomListVO;
import com.pick.hotels.entity.HotelSalesVO;

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
	public List<RoomDto> get_list(int hotel_no) {
		return sqlSession.selectList("room.get_list", hotel_no);
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

}
