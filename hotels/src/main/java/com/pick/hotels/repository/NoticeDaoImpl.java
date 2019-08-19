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
	
	@Override
	public void write(NoticeDto noticeDto) {
		sqlSession.insert("notice.write", noticeDto);
		
	}

	@Override
	public NoticeDto get(int no) {
		return sqlSession.selectOne("notice.get", no);
	}

	@Override
	public void delete(int no) {
		sqlSession.delete("notice.delete", no);
		
	}

	@Override
	public List<NoticeDto> list(String type, String keyword) {
		return sqlSession.selectList("notice.list");
	}

	@Override
	public void read(int no) {
		sqlSession.update("notice.read", no);
		
	}

	@Override
	public int count(String type, String keyword) {
		Map<String, String> param = new HashMap<>();
		if(type != null && keyword != null) {
			param.put("type", type.replace("+", "||"));
			param.put("keyword", keyword);
		}
		return sqlSession.selectOne("notice.count", param);
	}
	
	@Override
	public int getSequenceNumber() {
		return sqlSession.selectOne("notice.seq");
	}

	@Override
	public void edit(NoticeDto noticeDto) {
		sqlSession.update("notice.edit", noticeDto);		
	}


}
