package com.movie.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.movie.user.domain.UserDTO;
import com.movie.user.service.UserService;


public class AuthenticationInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session  =  request.getSession();
		Object obj  =  session.getAttribute("loginVo");
		
		if( obj == null) {
			Cookie loginCookie  =  WebUtils.getCookie(request, "loginCookie");
			if ( loginCookie != null) {
				String sessionId  =  loginCookie.getValue();
				UserDTO vo   =  userService.checkSessionKey(sessionId);
				if ( vo != null ) {
					session.setAttribute("loginVo", vo);
					return true;
				}
			}
			
			response.sendRedirect("/User/LoginPage");
			return false;
		}
		
		
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView model) throws Exception {
		super.postHandle(request, response, handler, model);
	}
	
}
