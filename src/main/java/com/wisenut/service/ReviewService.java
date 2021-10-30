package com.wisenut.service;

import java.util.List;

import com.wisenut.domain.ReviewVO;
import com.wisenut.domain.PageVO;	// 추가 작성자 : 조윤희 - 리뷰 목록 페이징 처리를 위한 추가 작성

/**
 * 
 * @author 조윤희, 정선
 * @date 2021.10.28
 * @description : 각종 목록 페이징 처리 및 전체 데이터 개수 처리
 * 글 수정시 패스워드 일치 여부 체크
 * 
 **/



public interface ReviewService {
	public List<ReviewVO> getList(PageVO pageVO);	//리뷰 목록 페이징 처리를 위한 추가 작성
	
	public int getTotal(PageVO pageVO);		//전체 데이터 개수 처리
	
	public void register(ReviewVO review);

	public ReviewVO get(Long bno);

	public boolean modify(ReviewVO review);

	public boolean remove(Long bno);
	
	/*  패스워드 일치 여부 체크 */
	public int passChk(ReviewVO reviewVO) throws Exception;
	
	
}
