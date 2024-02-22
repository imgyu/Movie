package com.movie.cs.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class CsMessage {

	private int chr_no;
	private String chr_msg;
	private String chr_subtime;
	private String chr_opendate;
	private int u_no;
	private int c_no;
}
