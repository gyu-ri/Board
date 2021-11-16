package com.test.domain;

import java.util.Date;

public class Reply {
	
	private int no;
	private int rno;
	private String text;
	private String writer;
	private String password;
	private Date writeDate;
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
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
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	

	@Override
	public String toString() {
		return "Reply [no=" + no + ", rno=" + rno + ", text=" + text + ", writer=" + writer + ", password=" + password
				+ ", writeDate=" + writeDate + "]";
	}
	

}
