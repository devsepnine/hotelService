package com.pick.hotels.service;

import java.io.IOException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pick.hotels.entity.NoticeDto;

@Service
public interface FileService {
	NoticeDto save(MultipartFile file) throws IllegalStateException, IOException;

	void delete(String delete_file);
}
