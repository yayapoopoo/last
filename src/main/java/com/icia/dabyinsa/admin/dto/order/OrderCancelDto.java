package com.icia.dabyinsa.admin.dto.order;

import lombok.Data;

@Data
public class OrderCancelDto {
	
	String acceptdate;
	String ocode;
	String mid;
	String prodname;
	int oiamount;
	int procstatus;
	String memocontent;
	int ppay;
}
