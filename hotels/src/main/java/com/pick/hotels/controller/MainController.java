package com.pick.hotels.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.pick.hotels.entity.RegionDto;
import com.pick.hotels.repository.RegionDao;



@Controller
public class MainController {
	@Autowired
	private RegionDao regionDao;
	
	@GetMapping("/")
	public String main() {
		return "main";
	}
	
	@GetMapping("/join")
	public String join() {

		return "join_select";
	}

   @PostMapping("/region")
   public void region(HttpServletResponse resp) throws IOException {
	   resp.setContentType("application/json");
	   List<RegionDto> list = regionDao.get_list();
	   ObjectMapper mapper = new ObjectMapper();
	   String json = mapper.writeValueAsString(list);
	   resp.setCharacterEncoding("UTF-8");
	   resp.getWriter().print(json);
   }
   
   
   @GetMapping("/img_v/{d_no}")
   public ResponseEntity<ByteArrayResource> v_img(@RequestParam String img_name,
		   											@PathVariable int d_no) throws IOException{
	  
	  String dir[] = {	"D:/upload/kh16/notice",
			  			"D:/upload/kh16/attraction",
			  			"D:/upload/kh16/restaurant"
			  			};
	   
      File target = new File(dir[d_no], img_name);
      
      byte[] data = FileUtils.readFileToByteArray(target); // commons io기능
                  //ok가 성공 notfound 실패
      
      ByteArrayResource resource = new ByteArrayResource(data);
      
      return ResponseEntity.ok()
					                 .contentType(MediaType.IMAGE_PNG) //전송타입
					                 .contentLength(data.length)
					                 .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename="+ URLEncoder.encode(img_name,"utf-8"))
					                 .body(resource);
   }
}
