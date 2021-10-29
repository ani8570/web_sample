package com.wisenut.service;

import static org.junit.Assert.assertNotNull;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.wisenut.domain.ReviewVO;
import com.wisenut.domain.PageVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/**
 * 
 * @author 조윤희
 * @date 2021.10.27
 * @description : Review Service test
 *
 **/

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewServiceTest {
	
	@Setter(onMethod_ = {@Autowired})
	private ReviewService service;
	
	@Test
	public void testGetList() {
		service.getList(new PageVO(2,10)).forEach(board -> log.info(board));		
	}//end test
	
	@Test
	public void testGetList2() {
		for (ReviewVO board:service.getList(new PageVO(2,10))) { 
			   log.info(board); 
		  }//end for 		
	}//end test	 	

}//end class

