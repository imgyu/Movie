package com.movie.board.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BoardDTO {
	
	private int b_no;
	private int u_no;
	private int bt_no;
	private String b_title;
	private String b_content;
	private String b_writedate;
	private String bc_comt;
	private String bc_writedate;
	private int bc_no;
	private String bc_file;
	private String b_file;
	private String u_nickname;
	private String u_profileimg;
	private int b_readcount;
	private String bt_name;
}
