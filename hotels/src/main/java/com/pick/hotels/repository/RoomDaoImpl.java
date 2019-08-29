package com.pick.hotels.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.RoomDto;

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
}
