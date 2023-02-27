package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {

	private long bno;
	private String title;
	private String content;
	private String writer;
	private long readcount;
	
	private Date regdate;
	private Date updateDate;
	
	private int replyCnt;
	
	
}