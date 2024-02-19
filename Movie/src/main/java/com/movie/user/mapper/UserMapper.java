package com.movie.user.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.movie.domain.MovieDTO;
import com.movie.user.domain.UserDTO;


public interface UserMapper {

	int idCheck(String u_id);

	int emailCheck(String u_email);

	int nickCheck(String u_nickname);

	void Join(HashMap<String, Object> map);

	UserDTO login(UserDTO vo);

	void keepLogin(Map<String, Object> map);

	UserDTO checkSession(String sessionKey);

	String cookie(String cookie);

	List<UserDTO> cookieVo(String dbCookie);

	List<String> findId(String u_email);

	String pwEmailCheck(Map<String, Object> map);

	void updatePw(Map<String, Object> map);

	void LogOut(String dbCookie);

	


}
