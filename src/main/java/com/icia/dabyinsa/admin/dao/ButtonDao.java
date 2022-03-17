package com.icia.dabyinsa.admin.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ButtonDao {
	
	// 반품 버튼
	void setReturns(String ocode);
	
	// 환불 버튼
	void setRefund(String ocode);
	
	// 입금확인 버튼
	void setPOk(String ocode);
	
	// 주문취소 버튼
	void setPCancle(String ocode);
	
	// 배송중처리 버튼
	void setSStart(String ocode);
	
	// 배송준비중처리 버튼
	void setSBegin(String ocode);
	
	// 배송대기처리 버튼
	void setSStandBy(String ocode);
	
	// 배송완료처리 버튼
	void setSEnd(String ocode);
	
	//상품목록파일삭제 버튼
	void filedelete(String pid);
	
	//상품목록삭제 버튼
	void pdelete(String pid); //삭제하기
	
}
