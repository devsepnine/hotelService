package com.pick.hotels.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.ReserveDto;

@Repository
public class ReserveDaoImpl implements ReserveDao{

	@Autowired
	private SqlSession sqlsession;

	@Override
	public boolean regist(ReserveDto reserveDto) {
		try {
			sqlsession.insert("reserve.regist", reserveDto);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
}
