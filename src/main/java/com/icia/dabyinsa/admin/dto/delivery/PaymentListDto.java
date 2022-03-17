package com.icia.dabyinsa.admin.dto.delivery;

import lombok.Data;

@Data
public class PaymentListDto {
	
	String ocode;
	String prodname;
	String mid;
	int oitotalprice;
	int pbank;
	int procstatus;
	String memocontent;
	String odate;
	String pstatus;
}
