package com.wisenut.domain;

import lombok.Data;
/**
 * 
 * @author Lee jihoon
 * @date 2021.10.27
 * @description : 매장에 관한 정보
 */
@Data
public class StoreVO {
	private Long store_num;
	private String store_name;
	private Long stote_xcoord;
	private Long stote_ycoord;
	private String store_addr;
	private String store_url;
}
