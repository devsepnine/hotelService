package com.pick.hotels.entity.kakaopay;

import lombok.AllArgsConstructor;

import lombok.NoArgsConstructor;

import lombok.Builder;

import lombok.Data;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class KakaoPayReturnVo {
	private String tid;
	private String next_redirect_pc_url;
	private String created_at;
}
