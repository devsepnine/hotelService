package com.pick.hotels.repository;

import com.pick.hotels.entity.ReserveDto;

public interface ReserveDao {

	boolean regist(ReserveDto reserveDto);

	ReserveDto get(int reserve_no, int no);


}
