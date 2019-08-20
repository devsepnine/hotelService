package com.pick.hotels.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pick.hotels.entity.MemberDto;
import com.pick.hotels.entity.NoticeDto;
import com.pick.hotels.repository.MemberDao;
import com.pick.hotels.repository.NoticeDao;
import com.pick.hotels.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private NoticeService noticeService;
	
//	글 목록
	@GetMapping("/list")
	public String list(
			Model model,
			@RequestParam(required = false) String type,
			@RequestParam(required = false) String keyword,
			@RequestParam(required = false, defaultValue="1") int page
			) {
		int pagesize = 1;		//한 페이지에 보여줄 게시글 갯수
		int start = pagesize * page - (pagesize -1);
		int end = pagesize * page;
		
		int blocksize = 5;
		int startBlock = (page - 1 ) / blocksize * blocksize + 1;
		int endBlock = startBlock + (blocksize -1);
		
		int count = noticeDao.count(type, keyword);
		int pageCount = (count -1) / pagesize + 1;
		
		if(endBlock > pageCount) {
			endBlock = pageCount;
		}
		
		model.addAttribute("page", page);
		model.addAttribute("startBlock", startBlock);
		model.addAttribute("endBlock", endBlock);
		model.addAttribute("start", start);
		model.addAttribute("end", end);
		
		List<NoticeDto> list = noticeDao.list(type, keyword, start, end);
		
		model.addAttribute("list", list);
		
		return "notice/list";
	}
	
//	글 상세보기
	@GetMapping("/content")
	public String content(Model model, @RequestParam int no, HttpSession session) {
//		조회수 중복 방지 처리
		Set<Integer> set = (Set<Integer>) session.getAttribute("read");
		if(set == null) 
			set = new HashSet<>();
		
		boolean first = set.add(no); //true : 처음 읽음, false : 두번이상
		
		session.setAttribute("read", set);
		
		if(first) { 
			noticeService.read(no);
		}
//		else { 
//			model.addAttribute("ndto", noticeDao.get(no));
//		}
		
		NoticeDto noticeDto = noticeDao.get(no);
		MemberDto memberDto = memberDao.get(noticeDto.getNotice_writer());
		
		model.addAttribute("ndto",noticeDto);
		model.addAttribute("mdto",memberDto);
		
		return "notice/content";
	}
	
	
//	게시판 글쓰기
	@GetMapping("/write")
	public String write() {
		return "notice/write";
	}
	
	@PostMapping("/write")
	public String write(HttpSession session,@ModelAttribute NoticeDto noticeDto, Model model) {
		int member_no = (int)session.getAttribute("member_no");
		noticeDto.setNotice_writer(member_no);
		
		int no = noticeService.write(noticeDto);
		
		model.addAttribute("no", no);
		return "redirect:content";
	}
	
	
//	 글 수정
	@GetMapping("/edit")
	public String edit(Model model, @RequestParam int no) {
		model.addAttribute("ndto", noticeDao.get(no));
		return "notice/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@ModelAttribute NoticeDto noticeDto, RedirectAttributes model) {
		noticeDao.edit(noticeDto);
		model.addAttribute("no", noticeDto.getNotice_no());
		return "redirect:content";
	}
		
		
//	글 삭제
	@GetMapping("/delete")
	public String delete(@RequestParam int no) {
		noticeDao.delete(no);
		return "redirect:list";
	}
		
}