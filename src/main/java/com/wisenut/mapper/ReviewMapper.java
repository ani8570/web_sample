package com.wisenut.mapper;

import java.util.List;

import com.wisenut.domain.ReviewVO;
import com.wisenut.domain.PageVO;	//추가 작성자 :조윤희  - 페이징 처리를 위해 메소드 추가

/**
 * 
 * @author Lee jihoon
 * @date 2021.10.27
 * @description : Review에 관한 CRUD
 */
public interface ReviewMapper {
	public int getTotalCount(PageVO pageVO); // 추가 작성자 : 조윤희 - 전체 데이터 처리를 위해 추가 작성
	
	public List<ReviewVO> getListWithPaging(PageVO pageVO);	// 추가 작성자 : 조윤희 - 페이징 처리를 위해 추가
	
	public List<ReviewVO> getList();

	public void insert(ReviewVO reviewVO);

	public void insertSelectKey(ReviewVO reviewVO);

	public ReviewVO read(Long bno);

	/**
	 * @description : 글제목, 난이도, 리뷰, 수정날짜 만 바뀜
	 * @param bno
	 * @return success : 1, fail : 0
	 */
	public int update(ReviewVO reviewVO);

	/**
	 * @param bno
	 * @return success : 1, fail : 0
	 */
	public int delete(Long bno);
	
	/* 작성자 : 정선  - 글 수정시 패스워드 일치 여부 체크 */
	public int passChk(ReviewVO reviewVO) throws Exception;
}
