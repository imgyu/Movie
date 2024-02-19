package com.movie.user.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.movie.user.domain.UserDTO;
import com.movie.user.mapper.UserMapper;
import com.movie.user.service.MailService;
import com.movie.user.service.UserService;

import oracle.jdbc.proxy.annotation.Post;


@Controller
@RequestMapping("/User")
public class UserController {

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private MailService mailService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@GetMapping("/JoinPage")
	public ModelAndView joinForm() {
		
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("user/join");
		
		return mv;
	}
	
	@RequestMapping("/Join")
	public ModelAndView join(@RequestParam HashMap<String, Object> map) {
		
		userService.Join(map);
		
		ModelAndView mv  =  new ModelAndView("redirect:/");
		
		return mv;
	}
	
	@GetMapping("/LoginPage")
	public ModelAndView loginForm () {
		
		ModelAndView mv  =  new ModelAndView("user/login");
		
		return mv;
	}
	
	@RequestMapping("/Login")
	public String login(UserDTO vo, HttpServletRequest request, Model model, HttpServletResponse response) {
		
		HttpSession session  =  request.getSession();
		String returnURL  =  "";
		
		if(session.getAttribute("loginVo") != null) {
			session.removeAttribute("loginVo");
		}
		
		UserDTO userDTO  =  userMapper.login(vo);
		
		if (userDTO != null && encoder.matches(vo.getU_pw(), userDTO.getU_pw())) {
			session.setAttribute("loginVo", userDTO);
			
			returnURL  =  "redirect:/";
			
			
		if(vo.isUseCookie()) {
			Cookie cookie  =  new Cookie("loginCookie", session.getId());
			cookie.setPath("/");
			int amount  =  60 * 60 * 24 * 7;
			cookie.setMaxAge(amount);
			response.addCookie(cookie);
			
			Date sessionLimit  =  new Date(System.currentTimeMillis() + (1000 * amount));
			userService.keepLogin(vo.getU_id(), session.getId(), sessionLimit);
			
		}
		
			
		} else {
			model.addAttribute("loginFail", "아이디나 비밀번호가 잘못되었습니다. 다시 시도하세요.");
			returnURL  =  "redirect:/User/LoginPage";
		}
		System.out.println("로그인 완성 ~ ");
		return returnURL;
		
	}
	
	@RequestMapping("/LogOut")
	public String logout(@CookieValue(name = "loginCookie", required = false)String cookie, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		Object obj  =  session.getAttribute("loginVo");
		Cookie loginCookie  =  WebUtils.getCookie(request, "loginCookie");
		System.out.println(cookie);
		if(obj != null) {
			UserDTO vo  =  (UserDTO)obj;
			session.removeAttribute("loginVo");
			session.invalidate();
		}
		
		if(loginCookie != null) {
			String dbCookie  = userMapper.cookie(cookie); 
			
			loginCookie.setPath("/");
			loginCookie.setMaxAge(0);
			userMapper.LogOut(dbCookie);
			response.addCookie(loginCookie);
		}
		
		
		return "redirect:/";
	}
	
	@GetMapping("/NickCheck")
	@ResponseBody
	public int nickCheck(UserDTO vo) {
		
		String u_nickname  =  vo.getU_nickname();
		int result  =  userMapper.nickCheck(u_nickname);
		
		return result;
	}
	
	//아이디 체크
	@GetMapping("/IdCheck")
	@ResponseBody
	public int idCheck(UserDTO vo) {
		
		String u_id  =  vo.getU_id();
		int result   =  userMapper.idCheck(u_id);
		
		return result;
	}
	// 이메일 체크
	@GetMapping("/EmailCheck")
	@ResponseBody
	public int emailCheck(UserDTO vo) {
		String u_email  =  vo.getU_email();
		int result  =  userMapper.emailCheck(u_email);
		
		return result;
	}
	
	// 이메일 인증
	@PostMapping("/Mail")
	@ResponseBody
	public String mailSend(String u_email) {
		
		int number  =  mailService.sendMail(u_email);
		String num  =  "" + number;
		System.out.println(num);
		return num;
	}
	
	@GetMapping("/FindIdPage")
	public String findId() {
		
		return "user/findid";
	}
	
	@PostMapping("/SendId")
	public ResponseEntity<Object> sendMail(String u_email) {
		List<String> username  =  userService.findId(u_email);
		if(username.size() != 0) {
			userService.sendUserName(u_email, username);
			return new ResponseEntity<Object>(HttpStatus.OK);
		}
		return new ResponseEntity<Object>(HttpStatus.BAD_REQUEST);
	}
	
	@PostMapping("/FindId")
	public ResponseEntity<String> idCheck(String u_id, HttpSession session) {
		
		if(userMapper.idCheck(u_id) != 0) {
			Map<String, Object> map  =  new HashMap<>();
			map.put("u_id", u_id );
			map.put("status", false);
			
			session.setMaxInactiveInterval(300);
			session.setAttribute("Status", map);
			return ResponseEntity.ok().body(u_id);
		}
		
		return ResponseEntity.badRequest().body("아이디가 존재하지 않습니다.");
	}
	
	@GetMapping("/FindPwPage")
	public String findPwPage() {
		
		return "user/findpw";
	}
	
	@GetMapping("/Sendpw")
	public ModelAndView sendPw(String u_id, HttpSession session) {
		
		Map<String, Object> map  =  (Map<String, Object>) session.getAttribute("map");
		u_id  =  String.valueOf(map.get("u_id"));
		
		ModelAndView mv  =  new ModelAndView();
		
		if(map == null || u_id.equals(map.get("u_id"))) {
			mv.setViewName("redirect:/User/FindPwPage");
			return mv;
		}
		
		mv.setViewName("user/findpw");
		mv.addObject("u_id", u_id);
		
		return mv;
	}
	
	@GetMapping("/SendEmail")
	public ResponseEntity<String> emailCheck(String u_id, String u_email) {
		
		boolean emailCheck  =  userService.pwEmailCheck(u_id, u_email);
		
		if(emailCheck) {
			int number  =  mailService.sendMail(u_email);
			String num  =  "" + number;
			
			return new ResponseEntity<>(num, HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
	}
	
	@GetMapping("/ChangePage")
	public ModelAndView changePage(@RequestParam String u_id) {
		
		ModelAndView  mv  =  new ModelAndView("user/changepw");
		mv.addObject("u_id", u_id);
		
		return mv;
	}
	
	@PostMapping("/ChangePw")
	public String changePw(@RequestParam Map<String, Object> map, String u_id) {
		
		userService.updatePw(map, u_id);
		
		
		
		return "user/login";
	}
	
}
