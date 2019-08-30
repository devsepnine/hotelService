package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class HotelListVo {

	private int hotel_no, // 호텔 번호 
				room_cnt, // 객실 개수
				min_price, // 최소가격
				max_price, // 최대가격
				hotel_star, // 등급
				hotel_people; // 인원
	
	private String  hotel_title, // 썸네일
					hotel_name, // 호텔 이름
					hotel_basic_addr, // 호텔 주소
					hotel_parking, // 주차장 여부
					hotel_fitness, // 피트니스 여부
					hotel_pool,  // 수영장 여부
					hotel_sauna, // 사우나 여부
					hotel_lounge, // 라운지 여부
					hotel_bbq, // 바베큐 가능?
					hotel_cafe, // 카페 여부
					hotel_convenience_store, // 편의점 여부
					hotel_karaoke, // 노래방 여부
					hotel_internet; // 인터넷 여부

}
