package com.movie.mapper;

import java.util.HashMap;
import java.util.List;

import com.movie.domain.MovieDTO;


public interface MovieMapper {

	List<MovieDTO> Poster(MovieDTO vo);

	List<MovieDTO> Animation(MovieDTO vo);

	List<MovieDTO> Rec(MovieDTO vo);

	List<MovieDTO> detail(int m_no);

	List<MovieDTO> review(int m_no);

	void reviewWrite(HashMap<String, Object> map);


}
