package com.movie.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import com.movie.domain.MovieDTO;
import com.movie.mapper.MovieMapper;
import com.movie.user.domain.UserDTO;
import com.movie.user.mapper.UserMapper;

@Controller
public class HomeController {

	@Autowired
	private MovieMapper mapper;
	
	@Autowired
	private UserMapper  userMapper;
	
	@RequestMapping("/")
	public ModelAndView home(@CookieValue(name = "loginCookie", required = false)String cookie, MovieDTO vo, UserDTO dto) {
		
		// 로고 뿌리기
		List<MovieDTO> poster = mapper.Poster(vo);
		
		ModelAndView mv = new ModelAndView();
		
		if(cookie != null) {
			String dbCookie  = userMapper.cookie(cookie); 
			if ( dbCookie != null && cookie.equals(dbCookie) ) {
				
				List<UserDTO> cookieVo  =  userMapper.cookieVo(dbCookie);				
				mv.addObject("Cookie", dbCookie);
				mv.addObject("cookieVo", cookieVo);
				
			}
		}
		mv.setViewName("main");
		mv.addObject("poster", poster);
		return mv;
	}

	
	@GetMapping("/AiPage")
	public String aiPage() {
		
		return "ai/ai";
	}

	
}
