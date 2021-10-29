package com.wisenut.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wisenut.domain.PageVO;		//추가 작성자 : 조윤희 - 리뷰 목록 페이징 처리를 위한 추가 작성
import com.wisenut.domain.ReviewVO;
import com.wisenut.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * 
 * @author 조윤희
 * @date 2021.10.28
 * @description : 각종 목록 페이징 처리 및 전체 데이터 개수 처리
 * 
 **/

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	@Setter(onMethod_ = @Autowired)
	private ReviewMapper mapper;

	@Override
	public void register(ReviewVO review) {
		log.info("register...." + review);
		mapper.insertSelectKey(review);
	}

	@Override
	public ReviewVO get(Long bno) {
		log.info("get....." + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(ReviewVO review) {
		log.info("Modify....." + review);
		return mapper.update(review) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		log.info("remove..." + bno);
		return mapper.delete(bno) == 1;
	}
	
	@Override
	public List<ReviewVO> getList(PageVO pageVO) { //리뷰 목록 페이징 처리를 위한 추가 작성
		log.info("get List with pageVO..." + pageVO);
		return mapper.getListWithPaging(pageVO);
	}//end getList

	@Override
	public int getTotal(PageVO pageVO) {	//전체 데이터 개수 처리 위한 작성
		log.info("get total count");
		return mapper.getTotalCount(pageVO);
	}//end getTotal
	
}
