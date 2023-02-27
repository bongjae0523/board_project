package org.zerock.domain;

import lombok.Data;

@Data
public class PageDTO {

	private int startPage; //시작페이지
	private int endPage; //끝페이지
	private boolean prev, next; // 이전과 다음
	
	private Criteria cri; //pageNum(내가 보는 페이지) , amount(화면 나오는 데이터 수)
	private int total; //전체 데이터
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total; 
		
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0)) * 10;
		
		this.startPage = this.endPage -9;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		
		this.next = this.endPage < realEnd;
	}
	
}
