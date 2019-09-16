package com.pick.hotels.entity.kakaopay;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class KakaoPayCanceledVo {
	private String aid;//요청 고유 번호
	private String tid;//결제 고유 번호
	private String cid;//가맹점 코드
	private String status;
	private String partner_order_id;//가맹점 주문번호
	private String partner_user_id;//가맹점 회원 id
	private String payment_method_type;//결제 수단
	private String item_name;//상품 이름
	private String item_code;
	private int quantity;//상품 수량
	private String created_at;//결제 준비 요청 시각
	private String approved_at;//결제 승인 시각
	private String canceled_at;
	private String payload;
	
	
	private KakaoPayAmount amount;//수량 상세 정보
	private KakaoPayCanceledAmount canceled_amount;
	private KakaoPayCanceledAvailableAmount caceled_available_amount;
}
