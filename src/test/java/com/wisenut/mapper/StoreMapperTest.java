package com.wisenut.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wisenut.domain.StoreVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class StoreMapperTest {

	@Setter(onMethod_ = @Autowired)
	private StoreMapper mapper;

//	@Test
	public void testGetList() {
		mapper.getList().forEach(store -> log.info(store));
	}

//	@Test
	public void testGetList2() {
		for (StoreVO store : mapper.getList())
			log.info(store);
	}
	@Test
	public void testRead() {
		log.info(mapper.read(3));
	}
}
