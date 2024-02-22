package com.movie.controller;



import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		List<MovieDTO> animation  =  mapper.Animation(vo);
		
		List<MovieDTO> rec  =  mapper.Rec(vo);
		
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
		mv.addObject("Ani", animation);
		mv.addObject("rec", rec);
		return mv;
	}

	@GetMapping("/Detail")
	@ResponseBody
	public List<MovieDTO> detail(@RequestParam(name = "m_no", required = false)int m_no) {
		
		List<MovieDTO> detail  =  mapper.detail(m_no);
		
		return detail;
	}
	
	@GetMapping("/Review")
	@ResponseBody
	public List<MovieDTO> review(@RequestParam(name = "m_no", required = false)int m_no) {
		
		List<MovieDTO> review  =  mapper.review(m_no);
		System.out.println(review);
		return review;
	}
	
	@PostMapping("/ReviewWrite")
	@ResponseBody
	public void reviewWrite( int m_no, int u_no, String r_review) {
		HashMap<String, Object> map  =  new HashMap<>();
		map.put("m_no", m_no);
		map.put("u_no", u_no);
		map.put("r_review", r_review);
		
		mapper.reviewWrite(map);
		
	}
	

	
}
