package com.icia.dabyinsa.board.qrcode.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.icia.dabyinsa.board.qrcode.dto.QfileDto;
import com.icia.dabyinsa.board.qrcode.dto.QrcodeDto;
import com.icia.dabyinsa.board.qrcode.dto.GuestDto;

@Mapper
public interface QrcodeDao {
	//게시글 목록 가져오기
	public List<QrcodeDto> getList(Map<String, Object> pmap);
	//본인게시글 목록 가져오기
	public List<QrcodeDto> getmyList(Map<String, Object> pmap);
	//전체 글 개수 구하기
	public int getQrcodeCnt();
	//게시글 저장
	public void qrcodeInsert(QrcodeDto qrcode);
	//파일 정보 저장
	public void fileInsert(Map<String, String> fmap);
	//글내용 가져오기
	public QrcodeDto getContents(Integer qnum);
	//파일 목록 가져오기
	public List<QfileDto> getQfList(Integer qnum);
	//하객 목록 가져오기
	public List<GuestDto> getGuList(Integer qnum);
	//하객 정보 저장
	public void guestInsert(GuestDto guest);
	//조회수 증가
	public void viewUpdate(Integer qnum);
	//게시글 업데이트
	public boolean qrcodeUpdate(QrcodeDto qrcode);
	//개별 파일 삭제(게시글 수정 시)
	public boolean fileDelete(String sysName);
	//게시글의 댓글 삭제
	public boolean guestDelete(Integer qnum);
	//게시글의 파일 삭제(같은 게시물의 모든 파일 삭제)
	public boolean filesListDelete(Integer qnum);
	//게시글 삭제
	public boolean qrcodeDelete(Integer qnum);
}





