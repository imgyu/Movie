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
public class TestBoardDTO {

	private int tb_no;
	private int u_no;
	private int bt_no;
	private String tb_title;
	private String tb_content;
	private String tb_writedate;
	private String tb_file;
	
}
