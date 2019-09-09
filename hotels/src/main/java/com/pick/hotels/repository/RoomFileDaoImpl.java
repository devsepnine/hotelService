package com.pick.hotels.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.RoomFileDto;

@Repository
public class RoomFileDaoImpl implements RoomFileDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void regist(RoomFileDto rfdto) {
		sqlSession.insert("roomFile.regist", rfdto);
		
	}

	@Override
	public List<RoomFileDto> get_list(int no) {
		return sqlSession.selectList("roomFile.get_list", no);
	}

	@Override
	public List<RoomFileDto> getlist(int room_no) {
		return sqlSession.selectList("roomFile.getlist", room_no);
	}

	@Override
	public RoomFileDto get(int no) {
		return sqlSession.selectOne("roomFile.get", no);
	}



}
