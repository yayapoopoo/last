package com.icia.dabyinsa.board.review.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class review_ReplyDto {
	private int r_num;//댓글 번호(키)
	private int r_bnum;//게시글 번호(검색)
	private String r_contents;//댓글 내용
	private String r_id;//댓글 작성자 id(로그인 id)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",
			timezone = "Asia/Seoul")
	private Timestamp r_date;
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public int getR_bnum() {
		return r_bnum;
	}
	public void setR_bnum(int r_bnum) {
		this.r_bnum = r_bnum;
	}
	public String getR_contents() {
		return r_contents;
	}
	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}
	public String getR_id() {
		return r_id;
	}
	public void setR_id(String r_id) {
		this.r_id = r_id;
	}
	public Timestamp getR_date() {
		return r_date;
	}
	public void setR_date(Timestamp r_date) {
		this.r_date = r_date;
	}
}
