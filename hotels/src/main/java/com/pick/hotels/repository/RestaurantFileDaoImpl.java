package com.pick.hotels.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.RestaurantFileDto;

@Repository
public class RestaurantFileDaoImpl implements RestaurantFileDao{

	@Autowired
	private SqlSession sqlSession;
	
//	레스토랑 사진 등록
	@Override
	public void regist(RestaurantFileDto rfdto) {
		sqlSession.insert("restaurantFile.regist", rfdto);
	}

//	레스토랑 사진 정보
	@Override
	public RestaurantFileDto get(int no) {
		return sqlSession.selectOne("restaurantFile.get", no);
	}

//	레스토랑 사진 삭제
	@Override
	public void exit(int no) {
		sqlSession.delete("restaurantFile.exit", no);
	}

//	레스토랑 이미지 리스트
	@Override
	public List<RestaurantFileDto> getlist(int no) {
		return sqlSession.selectList("restaurantFile.getlist", no);
	}
}
