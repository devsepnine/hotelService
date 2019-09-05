package com.pick.hotels.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.ReserveDto;
import com.pick.hotels.entity.ReserveVO;

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
	public ReserveDto get(int reserve_no, int member_no) {
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		param.put("reserve_no", reserve_no);
		param.put("member_no", member_no);
		ReserveDto rdto = sqlsession.selectOne("reserve.get", param);
		return rdto;
	}

	@Override
	public int timeCnt(ReserveDto reserveDto) {
		return sqlsession.selectOne("reserve.time",reserveDto);
	}

	@Override
	public List<ReserveVO> list(int member_no) {
		return sqlsession.selectList("reserve.list", member_no);
	}

	@Override
	public ReserveVO one_review(int reserve_no, int member_no) {
		HashMap<String, Integer> param = new HashMap<String, Integer>();
		param.put("reserve_no", reserve_no);
		param.put("member_no", member_no);
		
		return sqlsession.selectOne("reserve.review_write", param);
	}

	@Override
	public boolean change(ReserveDto reserveDto) {
		return sqlsession.update("reserve.change", reserveDto) > 0;
	}





}
