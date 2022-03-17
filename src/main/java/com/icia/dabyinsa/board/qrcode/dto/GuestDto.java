package com.icia.dabyinsa.board.qrcode.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class GuestDto {
	private int g_num;//댓글 번호(키)
	private int g_qnum;//게시글 번호(검색)
	private String g_select;//구분
	private String g_present;//답례품
	private String g_name;//수령인
	private int g_phonenumber;//수령인 연락처
	private int g_post;//우편번호
	private String g_address1;//도로명 주소
	private String g_address2;//상세 주소
	private String g_memo;//배송 메세지
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",
			timezone = "Asia/Seoul")
	private Timestamp g_date;
}
