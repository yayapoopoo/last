package com.icia.dabyinsa.admin.dto.order;

import lombok.Data;

@Data
public class OrderReturnsDto {
	
	String acceptdate;
	String ocode;
	String mid;
	String prodname;
	int oiamount;
	String shipnum;
	int procstatus;
	String memocontent;
}
