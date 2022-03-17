package com.icia.dabyinsa.admin.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.icia.dabyinsa.admin.dto.delivery.PaymentListDto;
import com.icia.dabyinsa.admin.dto.delivery.ShippedBeginListDto;
import com.icia.dabyinsa.admin.dto.delivery.ShippedCompleteListDto;
import com.icia.dabyinsa.admin.dto.delivery.ShippedEndListDto;
import com.icia.dabyinsa.admin.dto.delivery.ShippedStandbyListDto;
import com.icia.dabyinsa.admin.dto.order.OrderCancelDto;
import com.icia.dabyinsa.admin.dto.order.OrderChangeDto;
import com.icia.dabyinsa.admin.dto.order.OrderListDto;
import com.icia.dabyinsa.admin.dto.order.OrderRefundDto;
import com.icia.dabyinsa.admin.dto.order.OrderReturnsDto;

@Mapper
public interface OrderSearchDao {
	
	// 전체 주문 목록
	List<OrderListDto> getOList(String keyword, String keyword2, String searchOption, String searchOption2);
	int getOListCount(String keyword, String keyword2, String searchOption, String searchOption2);
	
	// 취소
	List<OrderCancelDto> getOCList(String keyword, String keyword2, String searchOption, String searchOption2);
	int getOCListCount(String keyword, String keyword2, String searchOption, String searchOption2);
	
	// 교환
	List<OrderChangeDto> getOCGList(String keyword, String keyword2, String searchOption, String searchOption2);
	int getOCGListCount(String keyword, String keyword2, String searchOption, String searchOption2);
	
	// 환불
	List<OrderRefundDto> getORList(String keyword, String keyword2, String searchOption, String searchOption2);
	int getORListCount(String keyword, String keyword2, String searchOption, String searchOption2);

	// 반품
	List<OrderReturnsDto> getORTList(String keyword, String keyword2, String searchOption, String searchOption2);
	int getORTListCount(String keyword, String keyword2, String searchOption, String searchOption2);
	
	// 입금전
	List<PaymentListDto> getPList(String keyword, String keyword2, String searchOption, String searchOption2);
	int getPListCount(String keyword, String keyword2, String searchOption, String searchOption2);
	
	// 배송준비중
	List<ShippedBeginListDto> getSBList(String keyword, String keyword2, String searchOption, String searchOption2);
	int getSBListCount(String keyword, String keyword2, String searchOption, String searchOption2);
	
	// 배송대기
	List<ShippedStandbyListDto> getSSList(String keyword, String keyword2, String searchOption, String searchOption2);
	int getSSListCount(String keyword, String keyword2, String searchOption, String searchOption2);
	
	// 배송중
	List<ShippedEndListDto> getSEList(String keyword, String keyword2, String searchOption, String searchOption2);
	int getSEListCount(String keyword, String keyword2, String searchOption, String searchOption2);

	// 배송완료
	List<ShippedCompleteListDto> getSCList(String keyword, String keyword2, String searchOption, String searchOption2);
	int getSCListCount(String keyword, String keyword2, String searchOption, String searchOption2);
}
