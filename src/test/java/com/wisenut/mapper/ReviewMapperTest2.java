package com.wisenut.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wisenut.domain.ReviewVO;
import com.wisenut.domain.PageVO; //추가 작성자 : 조윤희 - 리뷰목록 페이징 처리를 위해 추가

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * 
 * @author Lee jihoon
 * @date 2021.10.27
 * @description : Mapper CRUD test
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewMapperTest2 {

	@Setter(onMethod_ = @Autowired)
	private ReviewMapper mapper;

	@Test
	public void testCRUD() {
		// create
		log.info("Insert");
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setStore_num(3L);
		reviewVO.setTitle("999");
		reviewVO.setDifficulty("3");
		reviewVO.setWriter("999");
		reviewVO.setReview("999");
		reviewVO.setPassword("999");
		mapper.insertSelectKey(reviewVO);
		// read

		log.info("Read");
		mapper.read(reviewVO.getBno());
		log.info(reviewVO);
		// update
		log.info("Update");
		reviewVO.setReview("997");
		int cnt = mapper.update(reviewVO);
		log.info(cnt);

		log.info("Delete");
		cnt = mapper.delete(reviewVO.getBno());
		log.info(cnt);

	}
}
