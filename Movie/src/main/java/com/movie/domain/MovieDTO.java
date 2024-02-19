package com.movie.domain;

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
	
	
}
