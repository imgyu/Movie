package com.movie.user.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.movie.user.domain.UserDTO;
import com.movie.user.mapper.UserMapper;

@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private PasswordEncoder encoder;
	
	@Autowired
	private JavaMailSender mailSender;
	
	public void Join(HashMap<String, Object> map) {
		String rawPassword  =  (String) map.get("u_pw");
		String encodePassword  =  encoder.encode(rawPassword);
		
		map.put("u_pw", encodePassword);
		
		userMapper.Join(map);
		
	}

	public void keepLogin(String u_id, String sessionKey, Date sessionLimit) {
		Map<String, Object> map  =  new HashMap<String, Object>();
		map.put("u_id", u_id);
		map.put("sessionKey", sessionKey);
		map.put("sessionLimit", sessionLimit);
		
		userMapper.keepLogin(map);
		
	}

	public UserDTO checkSessionKey(String sessionKey) {
		 
		return userMapper.checkSession(sessionKey);
	}

	public List<String> findId(String u_email) {
		
		return userMapper.findId(u_email);
	}

	public void sendUserName(String u_email, List<String> username) {
		SimpleMailMessage simple  =  new SimpleMailMessage();
		simple.setTo(u_email);
		simple.setSubject("아이디 찾기");
		
		StringBuffer sb  =  new StringBuffer(); 
		sb.append("가입하신 아이디는");
		sb.append(System.lineSeparator());
		
		for(int i = 0; i<username.size()-1; i++) {
			sb.append(username.get(i));
			sb.append(System.lineSeparator());
		}
		sb.append(username.get(username.size()-1)).append("입니다.");
		
		simple.setText(sb.toString());
		
		new Thread(new Runnable()  {
			public void run() {
				mailSender.send(simple);
			}
		}).start();
	}

	public boolean pwEmailCheck(String u_id, String u_email) {
		Map<String, Object> map  =  new HashMap<>();
		map.put("u_id", u_id);
		map.put("u_email", u_email);
		String result  =  userMapper.pwEmailCheck(map);
		if ("1".equals(result)) {
			return true;
		}
		return false;
	}

	public void updatePw(Map<String, Object> map, String u_id) {
		
		
		String rawPassword  =  (String) map.get("u_pw");
		String encodePassword  =  encoder.encode(rawPassword);
		
		map.put("u_pw", encodePassword);
		map.put("u_id", u_id);
		
		userMapper.updatePw(map);
		
	}

	

}
