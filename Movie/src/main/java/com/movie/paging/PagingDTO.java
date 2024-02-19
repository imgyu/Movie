package com.movie.paging;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class PagingDTO {
	@NonNull
	private int nowPage;
	private int startPage;
	private int endPage;
	private int total;
	private int cntPerPage;
	private int lastPage;
	private int start;
	private int end;
	
	// 제일 마지막 페이지 계산 
		public void calcLastPage(int total, int cntPerPage) {
			setLastPage((int) Math.ceil((double) total / (double) cntPerPage));
		}

		// 시작, 끝 페이지 계산
		public void calcStartEndPage(int nowPage, int lastPage, int cntPerPage) {
			if (lastPage <= cntPerPage) {
				setStartPage(1);
				setEndPage(lastPage);
			} else {
				int startPage = nowPage - (cntPerPage / 2);
				int endPage = nowPage + (cntPerPage / 2);

				if (startPage < 1) {
					startPage = 1;
					endPage = cntPerPage;
				} else if (endPage > lastPage) {
					endPage = lastPage;
					startPage = lastPage - cntPerPage + 1;
				}

				setStartPage(startPage);
				setEndPage(endPage);
			}
		}

		// DB 쿼리에서 사용할 start, end값 계산
		public void calcStartEnd(int nowPage, int cntPerPage) {
			setEnd(nowPage * cntPerPage);
			setStart(getEnd() - cntPerPage + 1);
		}
		

		public PagingDTO(int total, int nowPage, int cntPerPage) {
			setNowPage(nowPage);
	        setCntPerPage(cntPerPage);
	        setTotal(total);
	        calcLastPage(getTotal(), getCntPerPage());
	        calcStartEndPage(getNowPage(), getLastPage(), getCntPerPage());
	        calcStartEnd(getNowPage(), getCntPerPage());
		}
	
	
}
