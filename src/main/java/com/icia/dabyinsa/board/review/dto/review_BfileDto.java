package com.icia.dabyinsa.board.review.dto;

import lombok.Data;

@Data
public class review_BfileDto {
	private String bf_oriname;
	private String bf_sysname;
	public String getBf_oriname() {
		return bf_oriname;
	}
	public void setBf_oriname(String bf_oriname) {
		this.bf_oriname = bf_oriname;
	}
	public String getBf_sysname() {
		return bf_sysname;
	}
	public void setBf_sysname(String bf_sysname) {
		this.bf_sysname = bf_sysname;
	}
}
