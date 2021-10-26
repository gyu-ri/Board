package com.test.domain;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;



public class PageMaker {
		
	//게시물 총 갯수
	private int totalCount;
	
	//현재 페이지 시작 번호
	private int startPage;
	
	//현재 페이지 끝 번호
	private int endPage;
	
	//맨 끝페이지 번호
	private int lastPage;
	
	//이전 페이지로
	private boolean prev;
	
	//다음 페이지로
	private boolean next;
	
	//하단에 나오는 페이지 번호수
	private int displayPageNum=10;
	
	private Criteria criteria;
	



	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCriteria() {
		return criteria;
	}

	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	
	private void calcData() {
		  endPage = (int) (Math.ceil(criteria.getPage() / (double)displayPageNum) * displayPageNum);
		  startPage = (endPage - displayPageNum) + 1;
		  
		  lastPage=(int) (Math.ceil(totalCount / (double)criteria.getPostNum()));
		  
		  
		  int tempEndPage = (int) (Math.ceil(totalCount / (double)criteria.getPostNum()));
		  if (endPage > tempEndPage)
		  {
		   endPage = tempEndPage;
		  }
		  prev = startPage == 1 ? false : true;
		  next = endPage * criteria.getPostNum() >= totalCount ? false : true;
		 }
	
	
	public String makeQuery(int page) {
		UriComponents uriComponents =
				   UriComponentsBuilder.newInstance()
				   .queryParam("page", page)
				   .queryParam("postNum", criteria.getPostNum())
				   .build();
		 return uriComponents.toUriString();
	}
	
	

	
	public String makeSearch(int page) {
		UriComponents uriComponents=
		UriComponentsBuilder.newInstance()
		.queryParam("page", page)
		.queryParam("postNum", criteria.getPostNum())
		.queryParam("searchType", ((SearchCriteria)criteria).getSearchType())
		.queryParam("keyword", encoding(((SearchCriteria)criteria).getKeyword()))
		.build();
		return uriComponents.toUriString();
		
	}
	
//	public void currentPage(int page) {
//		
//		
//		for(int currentPage=startPage; currentPage <= endPage; currentPage++) {
//			
//		}
//		
//		return currentPage;
//		
//	}
	
	
	private String encoding(String keyword) {
		if(keyword == null || keyword.trim().length() == 0) {
			return "";
		}
		try {
			return URLEncoder.encode(keyword,"UTF-8");
		}catch(UnsupportedEncodingException e) {
			return "";
		}
	}

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", lastPage=" + lastPage + ", prev=" + prev + ", next=" + next + ", displayPageNum=" + displayPageNum
				+ ", criteria=" + criteria + "]";
	}





}
