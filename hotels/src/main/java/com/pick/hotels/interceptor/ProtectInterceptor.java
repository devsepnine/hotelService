package com.pick.hotels.interceptor;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ProtectInterceptor extends HandlerInterceptorAdapter{
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		ServletContext application = request.getServletContext();
		
//		먼저 app 에서 blacklist를 꺼내 blacklist인지 확인
		Set<String> blacklist = (Set<String>) application.getAttribute("blacklist");
		String ip = request.getRemoteAddr();
		if(blacklist==null) blacklist = new HashSet<String>(); //blacklist가 없으면 새로만듬
		if(blacklist.contains(ip)) { // 블랙리스트면 접속 차단
			response.sendError(403);
			return false;
		}
		//블랙리스트가 아니고 뉴세션이 아니면 
		if(!session.isNew()) {
			Long log_time = (Long) session.getAttribute("log_time"); //세션에 이전접속시간 가져옴
			Long current = System.currentTimeMillis(); // 현재 시간 추가
			if(log_time != null) {
				Long gap = current - log_time;
				if(gap <1000) {
					Integer black_cnt = (Integer) session.getAttribute("black_cnt");
					if(black_cnt==null) black_cnt = 0;
					black_cnt++;
					session.setAttribute("black_cnt", black_cnt);
					
					if(black_cnt > 5) {
						logger.info("{} blacklist 추가", ip);
						blacklist.add(ip);
						application.setAttribute("blacklist", blacklist);
						response.sendError(403);
						return false;
					}
				}else {
					session.removeAttribute("black_cnt");
				}
			}
			session.setAttribute("log_time", current);
		}
		return true;
	}

}
