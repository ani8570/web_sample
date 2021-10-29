package com.wisenut.mapper;

import java.util.List;

import com.wisenut.domain.ReviewVO;
import com.wisenut.domain.StoreVO;

/**
 * 
 * @author Lee jihoon
 * @date 2021.10.27
 * @description : Store에 관한 CRUD 중 R만 있다.
 */
public interface StoreMapper {
	public List<StoreVO> getList();

	public StoreVO read(long store_num);
}
