package com.pick.hotels.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
			  			"D:/upload/kh16/restaurant",
			  			"D:/upload/kh16/hotel",
			  			"D:/upload/kh16/room",
			  			"D:/upload/kh16/partner"			  			
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
   
   @GetMapping("/direct/{region}")
   public String redirectsearch(@PathVariable String region, Model model) {
	   Calendar now = Calendar.getInstance();
	   now.add(Calendar.DATE, 1);
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	   String check_in = sdf.format(now.getTime());
	   now.add(Calendar.DATE, 1);
	   String check_out = sdf.format(now.getTime());
	   model.addAttribute("region", region);
	   String redirect = "redirect:/hotel/search?check_in="+check_in+"&check_out="+check_out+"&people=1";
	   return redirect;
   }
   
   @GetMapping("/mainview/{hotel}")
   public String redirecthotel(@PathVariable String hotel, Model model) {
	   Calendar now = Calendar.getInstance();
	   now.add(Calendar.DATE, 1);
	   SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	   String check_in = sdf.format(now.getTime());
	   now.add(Calendar.DATE, 1);
	   String check_out = sdf.format(now.getTime());
	   String redirect = "redirect:/hotel/view/"+hotel+"?check_in="+check_in+"&check_out="+check_out+"&people=1";
	   return redirect;
   }
   
//   테스트 로그인 처리
   @GetMapping("/testlogin/{type}")
   public String testlogin(@PathVariable int type, HttpSession session) {
	   session.removeAttribute("ok");
	   session.removeAttribute("auth");
	   session.removeAttribute("username");
	   session.removeAttribute("s_ok");
	   session.removeAttribute("s_no");
	   switch (type) {
	case 0:
		session.setAttribute("ok", "n0chatt3r");
		session.setAttribute("auth", "일반");
		session.setAttribute("no", 166);
		session.setAttribute("username", "노채터");
		return "redirect:/";
	case 1:
		session.setAttribute("s_ok", "rlaskdus");
		session.setAttribute("s_no", 93);
		return "redirect:/seller/";
	case 2:
		session.setAttribute("ok", "admin");
		session.setAttribute("auth", "관리자");
		session.setAttribute("no", 163);
		session.setAttribute("username", "김나연");
		return "redirect:/admin/main";
	default:
		break;
	}
	   
	   return "redirect:/";
   }
}
