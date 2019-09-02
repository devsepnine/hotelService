package com.pick.hotels.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.RestaurantDto;

@Repository
public class RestaurantDaoImpl implements RestaurantDao{

	@Autowired
	private SqlSession sqlSession;
	
//	레스토랑 등록
	@Override
	public void regist(RestaurantDto rdto) {
		sqlSession.insert("restaurant.regist", rdto);
	}

//	레스토랑 정보
	@Override
	public RestaurantDto get(int no) {
		return sqlSession.selectOne("restaurant.get", no);
	}

//	레스토랑 삭제
	@Override
	public void exit(int no) {
		sqlSession.delete("restaurant.exit", no);
	}

//	레스토랑 목록
	@Override
	public List<RestaurantDto> list(String type, String keyword, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		
//		검색일 떄 검색어를 mybatis에 전달
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);			
		}
		
//		검색이든 목록이든 페이징 구간 전달
		param.put("start", start);
		param.put("end", end);
		
		return sqlSession.selectList("restaurant.list", param);
	}

//	레스토랑 게시글 수 구하기
	@Override
	public int count(String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		
		return sqlSession.selectOne("restaurant.count", param);
	}

//	시퀀스 번호 구하기
	@Override
	public int getSequenceNumber() {
		return sqlSession.selectOne("restaurant.seq");
	}
	
//	레스토랑 수정
	@Override
	public void edit(RestaurantDto rdto) {
		sqlSession.update("restaurant.edit", rdto);
	}

//	레스토랑 리스트에서 삭제
	@Override
	public boolean delete(int restaurant_no) {
		try {
			sqlSession.insert("restaurant.delete", restaurant_no);
			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
