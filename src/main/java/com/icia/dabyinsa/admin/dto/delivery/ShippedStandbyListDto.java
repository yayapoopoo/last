package com.icia.dabyinsa.admin.dto.delivery;

import lombok.Data;

@Data
public class ShippedStandbyListDto {

	String ocode;
	String prodname;
	String mid;
	String shipnum;
	String supplier;
	int oiamount;
	int retailprice;
	int oitotalprice;
	String memocontent;
	String odate;
}
