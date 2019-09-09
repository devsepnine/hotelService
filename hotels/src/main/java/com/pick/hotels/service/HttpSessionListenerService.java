package com.pick.hotels.service;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebListener
public class HttpSessionListenerService implements HttpSessionListener{
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		ServletContext application = se.getSession().getServletContext();
		Integer usercnt = (Integer) application.getAttribute("usercnt");
		if (usercnt==null)usercnt=0;
		usercnt++;
		application.setAttribute("usercnt", usercnt);
		logger.debug("\n"+
				" _   _ _______        __  __  __ _____ __  __  ____ _____  ____ \r\n" + 
				"| | / |____ \\ \\      / / |  \\/  |____ |  \\/  |( __ |____ |/ _  |\r\n" + 
				"| |/  | |_  |\\ \\ /\\ / /  | |\\/| | |_  | |\\/| |/ _  | |_  | (_| |\r\n" + 
				"|  /| |___| | \\ V  V /   | |  | |___| | |  | | (_| |___| |> _  |\r\n" + 
				"|_/ |_|_____|  \\_/\\_/    |_|  |_|_____|_|  |_|\\____|_____/_/ |_|");
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		ServletContext application = se.getSession().getServletContext();
		Integer usercnt = (Integer) application.getAttribute("usercnt");
		if(usercnt==null || usercnt <= 0)usercnt=1;
		usercnt--;
		application.setAttribute("usercnt", usercnt);
		logger.debug("\n"+
				"  ___  _   _ _____   __  __ _____ __  __  ____ _____  ____ \r\n" + 
				" / _ \\| | | |_   _| |  \\/  |____ |  \\/  |( __ |____ |/ _  |\r\n" + 
				"| | | | | | | | |   | |\\/| | |_  | |\\/| |/ _  | |_  | (_| |\r\n" + 
				"| |_| | |_| | | |   | |  | |___| | |  | | (_| |___| |> _  |\r\n" + 
				" \\___/ \\___/  |_|   |_|  |_|_____|_|  |_|\\____|_____/_/ |_|");
	}

	
	
}
