package com.movie.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.movie.board.domain.BoardDTO;
import com.movie.board.mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private BoardMapper board;

	public void writeComment(int b_no, int u_no, String bc_comt) {
		
		Map<String, Object> map  =  new HashMap<>();
		map.put("b_no", b_no);
		map.put("u_no", u_no);
		map.put("bc_comt", bc_comt);
		board.writeComment(map);
		
	}

	public void boardDelete(int b_no, int u_no) {
		HashMap<String,Object> map  =  new HashMap<>();
		map.put("b_no", b_no);
		map.put("u_no", u_no);
		
		board.deleteBoard(map);
		
	}

	public List<BoardDTO> reWriteSel(int b_no, int u_no) {
		HashMap<String,Object> map  =  new HashMap<>();
		map.put("b_no", b_no);
		map.put("u_no", u_no);
		return board.reWriteSel(map);
	}

}
