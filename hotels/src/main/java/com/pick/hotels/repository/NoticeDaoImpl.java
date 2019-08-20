package com.pick.hotels.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao{

	@Autowired
	private SqlSession sqlSession;
	
	//글쓰기
	@Override
	public void write(NoticeDto noticeDto) {
		sqlSession.insert("notice.write", noticeDto);
	}

	//글정보 가져오기
	@Override
	public NoticeDto get(int no) {
		return sqlSession.selectOne("notice.get", no);
	}

	//글 삭제
	@Override
	public void delete(int no) {
		sqlSession.delete("notice.delete", no);
	}

	//글 목록
	@Override
	public List<NoticeDto> list(String type, String keyword, int start, int end) {
		Map<String, Object> param = new HashMap<>();
		
//		검색일 떄 검색어를 mybatis에 전달
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);			
		}
		
//		검색이든 목록이든 페이징 구간 전달
		param.put("start", start);
		param.put("end", end);
		
		return sqlSession.selectList("notice.list", param);
	}

	//글 조회수
	@Override
	public void read(int no) {
		sqlSession.update("notice.read", no);
	}

	//글 목록/검색일때 각각의 게시글 수 구하기
	@Override
	public int count(String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		return sqlSession.selectOne("notice.count", param);
	}
	
	//시퀀스 번호 생성
	@Override
	public int getSequenceNumber() {
		return sqlSession.selectOne("notice.seq");
	}

	//글 수정
	@Override
	public void edit(NoticeDto noticeDto) {
		sqlSession.update("notice.edit", noticeDto);		
	}

	
}
