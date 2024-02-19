package com.movie.board.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.movie.board.domain.BoardDTO;
import com.movie.board.domain.ImgFile;
import com.movie.board.mapper.BoardMapper;
import com.movie.board.service.BoardService;
import com.movie.paging.PagingDTO;

import junit.framework.Test;

@Controller
@RequestMapping("/Board")
public class BoardController {

	@Autowired
	private BoardMapper board;
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/ListPage")
	public String listPage(@RequestParam(name = "bt_no")int bt_no, PagingDTO pg,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, Model model) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		 map.put("bt_no", bt_no);
		 
		 
		 int total  =  board.countBoard(map);
		 if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "10";
			}
		
		 pg = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage)); 
		 map.put("pg", pg);
		 
		List<BoardDTO> boardList  =  board.boardList(map);
		model.addAttribute("board", boardList);
		model.addAttribute("pg", pg);
		model.addAttribute("bt_no", bt_no);
		
		return "board/board";
	}
	
	@GetMapping("/List")
	@ResponseBody
	public Map<String, Object> boardlist(@RequestParam(name = "bt_no")int bt_no, PagingDTO pg,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {
		
		 Map<String, Object> map = new HashMap<String, Object>();
		 map.put("bt_no", bt_no);
		 
		 
		 int total  =  board.countBoard(map);
		 if (nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if (nowPage == null) {
				nowPage = "1";
			} else if (cntPerPage == null) {
				cntPerPage = "10";
			}
		
		 pg = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage)); 
		 map.put("pg", pg);
		 
		List<BoardDTO> boardList  =  board.boardList(map);
		map.put("boardList", boardList);
		
		return map;
	}
	
	@GetMapping("/Detail")
	public ModelAndView detail(BoardDTO bto) {
		
		List<BoardDTO> commentList  =  board.commentList(bto);
		List<BoardDTO> boardDetail  =  board.boardDetail(bto);
		board.readCount(bto.getB_no());
		
		List<BoardDTO> imgList  =  board.imgList(bto);
		
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("board/boardetail");
		mv.addObject("comtList", commentList);
		mv.addObject("boardDetail", boardDetail);
		mv.addObject("file", imgList);
		
		return mv;
	}
	
	@PostMapping("/WriteComment")
	@ResponseBody
	public String writeComment(@RequestParam int b_no, @RequestParam int u_no, String bc_comt) {
		
		
		boardService.writeComment(b_no, u_no, bc_comt);
		
		return "success";
	}
	
	@GetMapping("/RegisterPage")
	public String registerPage(@RequestParam HashMap<String, Object> map ) {
		
		return "/board/registration";
	}
	
	
	@GetMapping("/FindLike")
	@ResponseBody
	public int findLike(int u_no, int b_no) {
		
		Map<String, Object> map  =  new HashMap<String, Object>();
		map.put("u_no", u_no);
		map.put("b_no", b_no);
		int findLike  =  board.findLike(map);
		
		
		
		return findLike;
	}
	
	@PostMapping("/Like")
	@ResponseBody
	public void like(int u_no, int b_no) {
		
		Map<String, Object> map  =  new HashMap<String, Object>();
		map.put("u_no", u_no);
		map.put("b_no", b_no);
		
		board.Like(map);
		
	}
	
	@PostMapping("/UnLike")
	@ResponseBody
	public void unLike(int u_no, int b_no) {
		Map<String, Object> map  =  new HashMap<String, Object>();
		map.put("u_no", u_no);
		map.put("b_no", b_no);
		
		board.unLike(map);
	}
	
	@GetMapping("/FindFav")
	@ResponseBody
	public int findFav(int u_no, int b_no) {
		
		Map<String, Object> map  =  new HashMap<String, Object>();
		map.put("u_no", u_no);
		map.put("b_no", b_no);
		int findFav  =  board.findFav(map);
		
		return findFav;
	}
	
	@PostMapping("/Fav")
	@ResponseBody
	public void fav(int u_no, int b_no) {
		
		Map<String, Object> map  =  new HashMap<String, Object>();
		map.put("u_no", u_no);
		map.put("b_no", b_no);
		
		board.Fav(map);
		
	}
	
	@PostMapping("/UnFav")
	@ResponseBody
	public void unFav(int u_no, int b_no) {
		Map<String, Object> map  =  new HashMap<String, Object>();
		map.put("u_no", u_no);
		map.put("b_no", b_no);
		
		board.unFav(map);
	}
	
	@PostMapping("/TestBoard")
	public ModelAndView testBoard(@RequestParam HashMap<String, Object> map) {
		
		board.testBoardInsert(map);
		
	
		
	ModelAndView mv  =  new ModelAndView();
	mv.setViewName("redirect:/Board/ListPage?bt_no=1");
	
	return mv;
	}
	
	@PostMapping("/TestFileInsert")
	@ResponseBody
	public void testFileInsert(@RequestParam(name = "b_file", required = false) MultipartFile[] b_file,
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request
			)throws Exception {
		
		
		
		if(b_file != null) {			
			
			ImgFile.save(b_file, map,request);
			System.out.println(map);
			
			String tb_no = board.findTb_no(map);
			
				for(int i = 0; i < b_file.length; i++) {
					String file  =  b_file[i].getOriginalFilename();
					map.put("b_file", file);
					map.put("tb_no", tb_no);
					board.fileInsert(map);
			}
		}	
	}
	
	@PostMapping("/WriteBoard")
	public ModelAndView writeBoard(@RequestParam HashMap<String, Object> map) {
		
		board.BoardInsert(map);
		
		ModelAndView mv  =  new ModelAndView();
		mv.setViewName("redirect:/Board/ListPage?bt_no=1");
		return mv;
	}
	
	@PostMapping("/FileInsert")
	@ResponseBody
	public void fileInsert(@RequestParam(name = "b_file", required = false) MultipartFile[] b_file,
			@RequestParam HashMap<String, Object> map,
			HttpServletRequest request
			)throws Exception {
		
		
		
		if(b_file != null) {			
			
			ImgFile.save(b_file, map,request);
			System.out.println(map);
			
			String b_no = board.findb_no(map);
			
				for(int i = 0; i < b_file.length; i++) {
					String file  =  b_file[i].getOriginalFilename();
					map.put("b_file", file);
					map.put("b_no", b_no);
					board.fileInsert2(map);
			}
		}	
	}
	
	@GetMapping("/BoardDelete")
	public String boardDelete(int b_no, int u_no) {
		
		board.deleteFileBoard(b_no);
		boardService.boardDelete(b_no, u_no);
		
		return "redirect:/Board/ListPage?bt_no=1";
	}
	
	@GetMapping("/ReWritePage")
	public String rewritePage(int b_no, int u_no, Model model) {
		
		List<BoardDTO> reWriteSel  =  boardService.reWriteSel(b_no, u_no);
		List<BoardDTO> reWriteImg  =  board.reWriteImg(b_no);
		model.addAttribute("reWriteSel", reWriteSel);
		model.addAttribute("reWriteImg", reWriteImg);
		return "board/rewrite";
	}
	
	
	
}
