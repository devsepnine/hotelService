package com.pick.hotels.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class NoticeDto {
	private int notice_no, notice_read, notice_writer;
	private String notice_title, notice_content, notice_when, notice_file_name, notice_file_type; 
}
