package com.movie.user.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class UserDTO {

	private int u_no;
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_nickname;
	private String u_email;
	private String u_profileimg;
	private String u_bday;
	private boolean useCookie;
	private String  sessionKey;
	private String  sessionLimit;
	
}
