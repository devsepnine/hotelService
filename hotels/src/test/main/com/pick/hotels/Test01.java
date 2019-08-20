package com.pick.hotels;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.pick.hotels.entity.NoticeDto;
import com.pick.hotels.repository.NoticeDao;


//service나 dao를 이용하고 싶으면? 불러와야 합니다..... 
//테스트에서는 뭘 자동으로 넣어야 할지 모르니까 알려줘야 함 - 3종세트 추가
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(
	locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
	}
)
public class Test01 {
	@Autowired
	private NoticeDao noticeDao;
	
	@Test
	public void test() {
		System.out.println(noticeDao);
		
//		만들어야 하는 기능
//		[1] 글 상세보기 기능			글번호 	--->	글정보
		int no = 1;
		NoticeDto noticeDto = noticeDao.get(no);
//		[2] 회원정보 상세보기 기능						글정보(회원번호)	--->	회원정보
		
//		MemberDto memberDto = memberDao.get(noticeDto.getNotice_writer());
		
		
		
//		조인을 할 경우에는
//		Dao, Dto가 따로 필요함(새로운 테이블에 맞게)
//		[1] 글 정보 + 회원정보 불러오기	글번호 ---->	글정보+회원정보(번호)
		
		
	}
	
}
