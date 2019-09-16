package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor

public class View_attraction {
	private AttractionDto attractionDto;
	private AttractionFileDto attractionFileDto;
}
