package com.movie.board.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.movie.board.domain.BoardDTO;

@Mapper
public interface BoardMapper {

	int countBoard(Map<String, Object> map);

	List<BoardDTO> boardList(Map<String, Object> map);

	List<BoardDTO> commentList(BoardDTO bto);

	void writeComment(Map<String, Object> map);

	void readCount(int b_no);

	List<BoardDTO> boardDetail(BoardDTO bto);

	int findLike(Map<String, Object> map);

	void Like(Map<String, Object> map);

	void unLike(Map<String, Object> map);

	int findFav(Map<String, Object> map);

	void Fav(Map<String, Object> map);

	void unFav(Map<String, Object> map);

	void fileInsert(HashMap<String, Object> filemap);

	void testBoardInsert(HashMap<String, Object> map);

	String findTb_no(HashMap<String, Object> map);

	void BoardInsert(HashMap<String, Object> map);

	String findb_no(HashMap<String, Object> map);

	void fileInsert2(HashMap<String, Object> map);

	List<BoardDTO> imgList(BoardDTO bto);

	List<BoardDTO> testBoardList(HashMap<String, Object> map);

	List<BoardDTO> testImgList(HashMap<String, Object> map);

	void deleteBoard(HashMap<String, Object> map);

	void deleteFileBoard(int b_no);

	List<BoardDTO> reWriteSel(HashMap<String, Object> map);

	List<BoardDTO> reWriteImg(int b_no);

	

	

}
