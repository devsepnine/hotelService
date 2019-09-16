package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class KakaoPayMentDto {

	private String kakaopay_cid, kakaopay_tid;
	private int kakaopay_reserve_no, kakaopay_no, kakaopay_cancel_amount, kakaopay_tax_free_amount;

}
