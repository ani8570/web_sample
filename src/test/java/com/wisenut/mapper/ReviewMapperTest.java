package com.wisenut.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wisenut.domain.ReviewVO;
import com.wisenut.domain.PageVO;	//추가 작성자 : 조윤희 - 리뷰목록 페이징 처리를 위해 추가

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
public class ReviewMapperTest {

	@Setter(onMethod_ = @Autowired)
	private ReviewMapper mapper;
	//Show list1
	@Test
	public void testGetList() {
		log.info("getList1");
		mapper.getList().forEach(review -> log.info(review));
	}
	//Show list2
	@Test
	public void testGetList2() {
		log.info("getList2");
		for (ReviewVO review : mapper.getList())
			log.info(review);
	}


	
}
