package com.movie.cs.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

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


import com.movie.cs.domain.CsMessage;
import com.movie.cs.mapper.CsMapper;
import com.movie.user.domain.UserDTO;
import com.movie.user.mapper.UserMapper;



@RequestMapping("/Cs")
@Controller
public class CsController {
	
	@Autowired
	private CsMapper csMapper;
	
	@Autowired
	private UserMapper  userMapper;
	
	@GetMapping("/List")
	public ModelAndView csList(@CookieValue(name = "loginCookie", required = false)String cookie) {
		
		ModelAndView mv = new ModelAndView();
		
		if(cookie != null) {
			String dbCookie  = userMapper.cookie(cookie); 
			if ( dbCookie != null && cookie.equals(dbCookie) ) {
				
				List<UserDTO> cookieVo  =  userMapper.cookieVo(dbCookie);				
				mv.addObject("Cookie", dbCookie);
				mv.addObject("cookieVo", cookieVo);
				
			}
		}
		mv.setViewName("cs/cslist");
		return mv;
	}
	
	@GetMapping("/CsPage")
	public ModelAndView csPage(CsMessage message, @RequestParam int chr_no, HttpSession session) {
		
		ModelAndView mv  =  new ModelAndView();
		
		UserDTO loggedInUser = (UserDTO) session.getAttribute("loginVo");
		int u_no = loggedInUser.getU_no();
		
		HashMap<String, Object> map  =  new HashMap<String, Object>();
		
		map.put("u_no", u_no);
		map.put("message", message);
		map.put("chr_no", chr_no);
		
		
		List<CsMessage> msgList  =  csMapper.msgList(map);
		
		
		
		
		mv.addObject("msgList", msgList);
		mv.addObject("chr_no", chr_no);
		mv.setViewName("cs/cs");
		return mv;
	}
	
	@PostMapping("/SaveMessage")
	@ResponseBody
	public String saveMsg(@RequestBody CsMessage message) {
		csMapper.insertMsg(message);
		
		
		return "success";
	}
	
}
