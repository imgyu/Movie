package com.movie.board.domain;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class ImgFile {
	 public static void save(
			MultipartFile[] files,
			HashMap<String,Object> map,
			 HttpServletRequest request) {
	        // 자료실에 파일이 저장될 경로(디렉토리) 지정 없으면 생성
		    String filePath = "/Users/inb/git/Movie/src/main/resources/static/img/";
	        //upload.path=E:/study/imageTest/

	        File dir = new File(filePath);
	        if (!dir.exists()) {
	            dir.mkdir(); // make directory
	        }

	        // 넘어온 파일 저장(d:\\upload\\) 처리 - 중복파일 처리
	        CheckFileName checkFile = new CheckFileName();

//	        // 파일 저장
//	        MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
//
//	        Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
//
//			MultipartFile  multipartFile = null;


	        // 파일 정보를 저장할 리스트 생성

	        // 넘어온 파일을 한개씩 반복 처리
//	        while (iterator.hasNext()) {
//	            multipartFile = multipartHttpServletRequest.getFile(iterator.next());
	        	
	        
	        for(MultipartFile multipartFile : files) {
	            if ( !multipartFile.isEmpty() ) {
	            	String u_imgname   = multipartFile.getOriginalFilename();
	            	String orgFileName = u_imgname.substring(0, u_imgname.lastIndexOf('.'));
	            	String u_imgext    = u_imgname.substring( u_imgname.lastIndexOf('.') );
	              
	            	String b_file = checkFile.getCheckFileName(filePath, orgFileName, u_imgext);
	                
	                File file = new File(filePath + b_file);
	                try {
	                    multipartFile.transferTo(file);
	                } catch (IllegalStateException | IOException e) {
	                    e.printStackTrace();
	                }
	                map.put("b_file", b_file);
	            }
	        }
	 }
}