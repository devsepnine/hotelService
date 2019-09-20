package com.pick.hotels.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.hotels.entity.ReserveDto;
import com.pick.hotels.entity.ReserveTotalVO;
import com.pick.hotels.entity.ReserveVO;
import com.pick.hotels.entity.V_reserve;

@Repository
public class ReserveDaoImpl implements ReserveDao{

	@Autowired
	private SqlSession sqlsession;

	@Override
	public boolean regist(ReserveDto reserveDto) {
		return sqlsession.insert("reserve.regist", reserveDto) > 0;
				
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

	@Override
	public int count(int member_no) {
		return sqlsession.selectOne("reserve.count", member_no);
	}

	@Override
	public List<ReserveVO> cancel_list(int member_no) {
		return sqlsession.selectList("reserve.cancel_list",member_no);
	}

	@Override
	public void update() {
		int result = sqlsession.update("reserve.update");
		System.out.println("result = "+result);
	}
	
//	관리자
//	월별 호텔 전체 매출
	@Override
	public List<ReserveTotalVO> getTotal() {
		return sqlsession.selectList("reserve.total");
	}

	//결제시 시퀀스 생성
	@Override
	public int getseq_no() {
		return sqlsession.selectOne("reserve.seq_no");
	}

	@Override
	public V_reserve getV_reserve(int order_no) {
		return sqlsession.selectOne("reserve.get_reserve", order_no);
	}

}
