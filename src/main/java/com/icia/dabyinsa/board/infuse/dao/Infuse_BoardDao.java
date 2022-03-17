package com.icia.dabyinsa.board.infuse.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.icia.dabyinsa.board.infuse.dto.Infuse_BfileDto;
import com.icia.dabyinsa.board.infuse.dto.Infuse_BoardDto;
import com.icia.dabyinsa.board.infuse.dto.Infuse_ReplyDto;

@Mapper
public interface Infuse_BoardDao {
	//게시글 목록 가져오기
	public List<Infuse_BoardDto> getList(Map<String, Integer> pmap);
	//전체 글 개수 구하기
	public int getBoardCnt();
	//게시글 저장
	public void boardInsert(Infuse_BoardDto board);
	//파일 정보 저장
	public void fileInsert(Map<String, String> fmap);
	//글내용 가져오기
	public Infuse_BoardDto getContents(Integer bnum);
	//파일 목록 가져오기
	public List<Infuse_BfileDto> getBfList(Integer bnum);
	//댓글 목록 가져오기
	public List<Infuse_ReplyDto> getReList(Integer bnum);
	//댓글 저장
	public void replyInsert(Infuse_ReplyDto reply);
	//조회수 증가
	public void viewUpdate(Integer bnum);
	//게시글 업데이트
	public boolean boardUpdate(Infuse_BoardDto board);
	//개별 파일 삭제(게시글 수정 시)
	public boolean fileDelete(String sysName);
	//게시글의 댓글 삭제
	public boolean replyDelete(Integer bnum);
	//게시글의 파일 삭제(같은 게시물의 모든 파일 삭제)
	public boolean filesListDelete(Integer bnum);
	//게시글 삭제
	public boolean boardDelete(Integer bnum);
}





