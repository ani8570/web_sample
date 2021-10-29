package com.wisenut.domain;

/**
 * 
 * @author 조윤희
 * @date 2021.10.27
 * @description : 리뷰 목록 페이징 처리를 위한 파라미터 정의
 * 
 **/

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageVO {

	private int pageNum;
	private int amount;
	private String type;
	private String keyword;

	public PageVO() {
		this(1, 10);
	}// end PageVO

	public PageVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}// end PageVO

	/**
	 * @date 2021.10.28
	 * @description : 검색 조건에 따른 String 을 받아 배열로 처리한다.
	 * @return
	 */
	public String[] getTypeArr() {
		return (type == null) ? new String[] {} : type.split("");
	}
}// end class PageVO
