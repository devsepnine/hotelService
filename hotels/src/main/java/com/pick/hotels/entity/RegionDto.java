package com.pick.hotels.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@JsonIgnoreProperties({"region_no"})
@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class RegionDto {
	private int region_no;
	private String region_kor_name, region_eng_name;
}
