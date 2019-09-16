package com.pick.hotels.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.AttractionFileDto;

@Repository
public class AttractionFileDaoImpl implements AttractionFileDao{

	@Autowired
	private SqlSession sqlSession;
	
//	관광지 사진 등록
	@Override
	public void regist(AttractionFileDto afdto) {
		sqlSession.insert("attractionFile.regist", afdto);
	}

//	관광지 사진 정보
	@Override
	public AttractionFileDto get(int no) {
		return sqlSession.selectOne("attractionFile.get", no);
	}

//	관광지 사진 삭제
	@Override
	public void exit(int no) {
		sqlSession.delete("attractionFile.exit", no);
	}

//	관광지 이미지 리스트
	@Override
	public List<AttractionFileDto> getlist(int no) {
		return sqlSession.selectList("attractionFile.getlist", no);
	}

	@Override
	public AttractionFileDto one_view(int no) {
		return sqlSession.selectOne("attractionFile.one_view", no);
	}
}
