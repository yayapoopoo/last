package com.icia.dabyinsa.board.review.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class review_BoardDto {
	private int bnum;
	private String btitle;
	private String bcontents;
	private String bid;//작성자 id(외래키)
	private String mname;//작성자 이름
	//오라클의 date 타입과 연동이 잘되는 자료형
	private Timestamp bdate;
	private int bviews;
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontents() {
		return bcontents;
	}
	public void setBcontents(String bcontents) {
		this.bcontents = bcontents;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public Timestamp getBdate() {
		return bdate;
	}
	public void setBdate(Timestamp bdate) {
		this.bdate = bdate;
	}
	public int getBviews() {
		return bviews;
	}
	public void setBviews(int bviews) {
		this.bviews = bviews;
	}
}

