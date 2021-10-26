package com.test.domain;

import java.util.Date;



public class Criteria {
	
	//현재 페이지
	private int page;
	
	//한 페이지에 출력할 게시물 수
	private int postNum;

	//게시물 시작 번호
	private int rowStart;
	
	//게시물 끝 번호
	private int rowEnd;
	
	
	public Criteria() {
		//필드 변수 초기화
		this.page = 1;
		this.postNum = 10;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <=0) {
			this.page=1;
			return;
		}
		this.page = page;
	}

	public int getPostNum() {
		return postNum;
	}

	public void setPostNum(int postNum) {
		if(postNum <=0 || postNum > 100) {
			this.postNum = 10;
			return;
		}
		this.postNum = postNum;
	}

	public int getRowStart() {
		rowStart=((page-1)*postNum)+1;
		
		return rowStart;
	}

	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}

	public int getRowEnd() {
		rowEnd=rowStart+postNum-1;
		return rowEnd;
	}

	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", postNum=" + postNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}


	
	
	
	

}
