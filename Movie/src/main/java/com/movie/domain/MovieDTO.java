package com.movie.domain;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class MovieDTO {

	private int m_no;
	private String m_id;
	private String m_title;
	private String m_img; 
	private String m_release_date;
	private int m_vote_average;
	private int m_vote_count;
	private String m_genre_ids;
	private String profile_path;
	private String r_review;
	private String character;
	private String name;
	private String genres_info;
	private String u_profileimg;
	private String u_nickname;
	
	
}
