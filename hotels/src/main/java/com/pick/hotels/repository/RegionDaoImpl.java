package com.pick.hotels.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.RegionDto;

@Repository
public class RegionDaoImpl implements RegionDao{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<RegionDto> get_list() {
		return sqlSession.selectList("region.get_list");
	}

}
