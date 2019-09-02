package com.pick.hotels.repository;

import java.util.HashMap;
import java.util.Set;

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

	@Override
	public ReserveDto get(int reserve_no, int no) {
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		param.put("reserve_no", reserve_no);
		param.put("member_no", no);
		ReserveDto rdto = sqlsession.selectOne("reserve.get", param);
		System.out.println(rdto);
		return rdto;
	}


}
