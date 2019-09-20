package com.pick.hotels.repository;

import java.util.List;

import com.pick.hotels.entity.ReserveDto;
import com.pick.hotels.entity.ReserveTotalVO;
import com.pick.hotels.entity.ReserveVO;
import com.pick.hotels.entity.V_reserve;

public interface ReserveDao {

	boolean regist(ReserveDto reserveDto);

	ReserveDto get(int reserve_no, int member_no);

	int timeCnt(ReserveDto reserveDto);

	List<ReserveVO> list(int member_no);

	ReserveVO one_review(int reserve_no, int member_no);

	boolean change(ReserveDto reserveDto);

	int count(int member_no);

	List<ReserveVO> cancel_list(int member_no);

	void update();
	
//	관리자
	List<ReserveTotalVO> getTotal();

	// 결제시 시퀀스 꺼내옴
	int getseq_no();

	V_reserve getV_reserve(int order_no);




}
