package com.movie.board.domain;

import java.io.File;

public class CheckFileName {
	public String getCheckFileName(
			String filePath, String orgFileName, String s_imgExt) {
		
		boolean   isCheck         =  true;
		String    returnFileName  =  null;
		
		String    fullFilePath    =  null;
		File      file            =  null;
		
		String    fileName        =  orgFileName;
		
		int i = 0;
		while( isCheck ) {
			fullFilePath  =  filePath  + fileName + s_imgExt;
			
			file          =  new File(  fullFilePath ); 
			if( file.exists() ) {
				i++;
				fileName = String.format("%s_%d", orgFileName, i); 
			} else {
				isCheck = false;
			}
		}
		returnFileName  =  fileName + s_imgExt;
		
		return   returnFileName;
	}
}

