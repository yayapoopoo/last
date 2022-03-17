package com.icia.dabyinsa.admin.dto.order;

import lombok.Data;

@Data
public class OrderRefundDto {
	
	String acceptdate;
	String ocode;
	String mid;
	String prodname;
	int oiamount;
	int ppay;
	String shipnum;
	int procstatus;
	String memocontent;
	String odate;
}
