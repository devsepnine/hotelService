package com.pick.hotels.entity.kakaopay;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//카카오페이 결제 성공시 수량정보 저장하기 위한 클래스
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class KakaoPayAmount {
	private int total,tax_free,vat,point;
}
