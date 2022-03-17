package com.icia.dabyinsa.board.qrcode.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QrcodeDto {
	private int qnum;
	private String qselect;
	private String qordername;
	private String qphonenumber;
	private String qemail;
	private String qeventdate;
	private String qprod1;
	private String qprod2;
	private String qprod3;
	private String qcontents;
	private String qid;//작성자 id(외래키)
	private String mname;//작성자 이름
	//오라클의 date 타입과 연동이 잘되는 자료형
	private Timestamp qdate;
	private int qviews;
}

