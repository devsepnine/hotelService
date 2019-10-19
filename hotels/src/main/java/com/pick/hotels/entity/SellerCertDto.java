package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class SellerCertDto {
	private int seller_cert_who;
	private String  seller_cert_no, seller_cert_when;
}
