package com.icia.dabyinsa.admin.dto.order;

import lombok.Data;

@Data
public class OrderListDto {
	
	String odate;
	String ocode;
	String mid;
	String prodname;
	int ppay;
	int pstatus;
	int dstatus;
	int oitotalprice;
	int procstatus;

}
