package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class H_search_vo {

	private int 	people;
	
	private String  parking, // 주차장 여부
					fitness, // 피트니스 여부
					pool,  // 수영장 여부
					sauna, // 사우나 여부
					lounge, // 라운지 여부
					bbq, // 바베큐 가능?
					cafe, // 카페 여부
					conveni, // 편의점 여부
					karaoke, // 노래방 여부
					internet, // 인터넷 여부
					check_in, // 체크 인
					check_out, // 체크 아웃
					region; // 검색어
}
