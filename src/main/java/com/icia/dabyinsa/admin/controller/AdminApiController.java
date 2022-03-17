package com.icia.dabyinsa.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.icia.dabyinsa.admin.dto.ResponseDto;
import com.icia.dabyinsa.admin.service.ButtonService;

@RestController
@RequestMapping("admin")
public class AdminApiController {

	@Autowired
	private ButtonService bs;

	// 반품 버튼
	@PutMapping("/api/returns")
	public ResponseDto<Integer> returns(String ocode) {
		bs.returnsBtn(ocode);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	// 환불 버튼
	@PutMapping("/api/refund")
	public ResponseDto<Integer> refund(String ocode) {
		bs.refundBtn(ocode);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	// 입금 확인버튼
	@PutMapping("/api/pOk")
	public ResponseDto<Integer> pOk(String ocode) {
		bs.pOkBtn(ocode);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	// 주문취소 버튼
	@PutMapping("/api/pCancle")
	public ResponseDto<Integer> pCancle(String ocode) {
		bs.pCancleBtn(ocode);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	// 배송중처리 버튼
	@PutMapping("/api/sStart")
	public ResponseDto<Integer> sStart(String ocode) {
		bs.sStartBtn(ocode);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	// 배송준비중처리 버튼
	@PutMapping("/api/sBegin")
	public ResponseDto<Integer> sBegin(String ocode) {
		bs.sBeginBtn(ocode);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	// 배송대기중처리 버튼
	@PutMapping("/api/sStandBy")
	public ResponseDto<Integer> sStandBy(String ocode) {
		bs.sStandByBtn(ocode);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}
	
	// 배송완료처리 버튼
	@PutMapping("/api/sEnd")
	public ResponseDto<Integer> sEnd(String ocode) {
		bs.sEndBtn(ocode);
		return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
	}

	
	
	
}
