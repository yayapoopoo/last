package com.icia.dabyinsa.admin.dto.delivery;

import lombok.Data;

@Data
public class ShippedBeginListDto {
	
	String odate;
	String ocode;
	String prodname;
	String mid;
	String shipnum;
	String supplier;
	int oiamount;
	int oitotalprice;
	int retailprice;
	int ppay;
	String memocontent;
}
