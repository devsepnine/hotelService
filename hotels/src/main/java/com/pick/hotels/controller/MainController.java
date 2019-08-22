package com.pick.hotels.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;

import org.apache.commons.io.FileUtils;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

	@GetMapping("/")
	public String main() {
		return "main";
	}
	
	@GetMapping("/join")
	public String join() {

		return "join_select";
	}
	
   @GetMapping("/imgsrc")
   public ResponseEntity<ByteArrayResource> imgsrc(@RequestParam String notice_file_name) throws IOException{
	  
      File target = new File("D:/upload/notice", notice_file_name);
      
      byte[] data = FileUtils.readFileToByteArray(target); // commons io기능
                  //ok가 성공 notfound 실패
      
      ByteArrayResource resource = new ByteArrayResource(data);
      
      return ResponseEntity.ok()
					                 .contentType(MediaType.IMAGE_PNG) //전송타입
					                 .contentLength(data.length)
					                 .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename="+ URLEncoder.encode(notice_file_name,"utf-8"))
					                 .body(resource);
   }
}
