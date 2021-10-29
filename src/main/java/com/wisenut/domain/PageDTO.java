package com.wisenut.domain;

import lombok.Getter;
import lombok.ToString;

/**
 * 
 * @author 조윤희
 * @date 2021.10.28
 * @description : Paging class
 *
 **/

@Getter
@ToString
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private PageVO pageVO;
	
	public PageDTO(PageVO pageVO, int total) {
		this.pageVO = pageVO;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(pageVO.getPageNum() / 10.0)) * 10;
		
		this.startPage = this.endPage - 9;
		
		int realEnd = (int) (Math.ceil((total * 1.0) / pageVO.getAmount()));
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}//end if
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}//end PageDTO
}//end class
