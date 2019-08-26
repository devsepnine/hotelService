package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class AttractionFileDto {
	private int attraction_no, attraction_file_no;
	private String attraction_file_name, attraction_file_type;
}
