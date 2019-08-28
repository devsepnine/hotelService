package com.pick.hotels.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.AttractionDto;

@Repository
public class AttractionDaoImpl implements AttractionDao{

	@Autowired
	private SqlSession sqlSession;
	
//	관광지 등록
	@Override
	public void regist(AttractionDto adto) {
		sqlSession.insert("attraction.regist", adto);
	}

//	관광지 정보
	@Override
	public AttractionDto get(int no) {
		return sqlSession.selectOne("attraction.get", no);
	}

//	관광지 삭제
	@Override
	public void exit(int no) {
		sqlSession.delete("attraction.exit", no);
	}

//	관광지 목록
	@Override
	public List<AttractionDto> list(String type, String keyword, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		
//		검색일 떄 검색어를 mybatis에 전달
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);			
		}
		
//		검색이든 목록이든 페이징 구간 전달
		param.put("start", start);
		param.put("end", end);
		
		return sqlSession.selectList("attraction.list", param);
	}

//	관광지 게시글 수 구하기
	@Override
	public int count(String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		
		return sqlSession.selectOne("attraction.count", param);
	}

//	시퀀스 번호 구하기
	@Override
	public int getSequenceNumber() {
		return sqlSession.selectOne("attraction.seq");
	}
	
//	관광지 수정
	@Override
	public void edit(AttractionDto atdo) {
		sqlSession.update("attraction.edit", atdo);
	}
	

}
