package com.wisenut.domain;

import java.util.Date;
import lombok.Data;

/**
 * 
 * @author Lee jihoon
 * @date 2021.10.27
 * @description : Review에 관한 정보
 * 
 */
@Data
public class ReviewVO {
	private Long bno;
	private Long store_num;
	private String title;
	private String difficulty;
	private String writer;
	private String review;
	private String password;
	private Date regdate;
	private Date updateDate;

}
