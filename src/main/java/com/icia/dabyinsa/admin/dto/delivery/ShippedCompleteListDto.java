package com.icia.dabyinsa.admin.dto.delivery;

import lombok.Data;

@Data
public class ShippedCompleteListDto {

	String odate;
	String ocode;
	String prodname;
	String mid;
	String shipnum;
	String supplier;
	int oiamount;
	int oitotalprice;
	String memocontent;
}
