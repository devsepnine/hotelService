package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class EmailCertDto {
	private int seller_email_cert_no;
	private String seller_email_cert, seller_email_when;
}
