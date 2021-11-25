package com.test.domain;

import java.util.Date;



public class Board {
	private int no;
	private String title;
	private String writer;
	private String password;
	private String content;
	private Date writeDate;

	private int groupNo;
	private int groupOrder;
	private int indent;
	private int groupNoCount;
	private int deleteStatus;
	private int parentNo;
	private int replyCount;
	
	private String fileName;
	private String reFileName;
	private String uploadPath;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	
	
	
	
	
	public String getReFileName() {
		return reFileName;
	}
	public void setReFileName(String reFileName) {
		this.reFileName = reFileName;
	}
	public String getUploadPath() {
		return uploadPath;
	}
	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getParentNo() {
		return parentNo;
	}
	public void setParentNo(int parentNo) {
		this.parentNo = parentNo;
	}
	public int getDeleteStatus() {
		return deleteStatus;
	}
	public void setDeleteStatus(int deleteStatus) {
		this.deleteStatus = deleteStatus;
	}
	public int getGroupNoCount() {
		return groupNoCount;
	}
	public void setGroupNoCount(int groupNoCount) {
		this.groupNoCount = groupNoCount;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getGroupOrder() {
		return groupOrder;
	}
	public void setGroupOrder(int groupOrder) {
		this.groupOrder = groupOrder;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	@Override
	public String toString() {
		return "Board [no=" + no + ", title=" + title + ", writer=" + writer + ", password=" + password + ", content="
				+ content + ", writeDate=" + writeDate + ", groupNo=" + groupNo + ", groupOrder=" + groupOrder
				+ ", indent=" + indent + ", groupNoCount=" + groupNoCount + ", deleteStatus=" + deleteStatus
				+ ", parentNo=" + parentNo + ", replyCount=" + replyCount + ", fileName=" + fileName + ", reFileName="
				+ reFileName + ", uploadPath=" + uploadPath + "]";
	}
	
	
}
