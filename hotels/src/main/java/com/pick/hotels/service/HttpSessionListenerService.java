package com.pick.hotels.service;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class HttpSessionListenerService implements HttpSessionListener{
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		ServletContext application = se.getSession().getServletContext();
		Integer usercnt = (Integer) application.getAttribute("usercnt");
		if (usercnt==null)usercnt=0;
		usercnt++;
		application.setAttribute("usercnt", usercnt);
		System.out.println("###  ##  ### ###  ##   ##                             ##  ###   ## ##   ### ###  ### ##   \r\n" + 
				"  ## ##   ##  ##  ##   ##                             ##   ##  ##   ##   ##  ##   ##  ##  \r\n" + 
				" # ## #   ##      ##   ##                             ##   ##  ####      ##       ##  ##  \r\n" + 
				" ## ##    ## ##   ## # ##                             ##   ##   #####    ## ##    ## ##   \r\n" + 
				" ##  ##   ##      # ### #                             ##   ##      ###   ##       ## ##   \r\n" + 
				" ##  ##   ##  ##   ## ##                              ##   ##  ##   ##   ##  ##   ##  ##  \r\n" + 
				"###  ##  ### ###  ##   ##                              ## ##    ## ##   ### ###  #### ## ");
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		ServletContext application = se.getSession().getServletContext();
		Integer usercnt = (Integer) application.getAttribute("usercnt");
		if(usercnt==null)usercnt=1;
		usercnt--;
		application.setAttribute("usercnt", usercnt);
		System.out.println(" ## ##   ##  ###  #### ##           ##  ###   ## ##   ### ###  ### ##   \r\n" + 
				"##   ##  ##   ##  # ## ##           ##   ##  ##   ##   ##  ##   ##  ##  \r\n" + 
				"##   ##  ##   ##    ##              ##   ##  ####      ##       ##  ##  \r\n" + 
				"##   ##  ##   ##    ##              ##   ##   #####    ## ##    ## ##   \r\n" + 
				"##   ##  ##   ##    ##              ##   ##      ###   ##       ## ##   \r\n" + 
				"##   ##  ##   ##    ##              ##   ##  ##   ##   ##  ##   ##  ##  \r\n" + 
				" ## ##    ## ##    ####              ## ##    ## ##   ### ###  #### ##  ");
	}

	
	
}
