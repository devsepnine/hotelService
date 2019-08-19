package com.pick.hotels;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.pick.hotels.entity.NoticeDto;
import com.pick.hotels.repository.NoticeDao;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(
	locations = {
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"
	}
)
public class NoticeWriteTest {
	@Autowired
	private NoticeDao noticeDao;
	
	@Test
	public void test() {
		int no = noticeDao.getSequenceNumber();
		NoticeDto noticeDto = new NoticeDto();
		noticeDto.setNotice_no(no);
		noticeDto.setNotice_title("테스트제목");
		noticeDto.setNotice_writer(1);
		noticeDto.setNotice_content("테스트 내용");
		noticeDto.setNotice_file_name("파일 이름");
		noticeDto.setNotice_file_type("파일 유형");

	
		System.out.println(noticeDto);
		noticeDao.write(noticeDto);
	}

}
