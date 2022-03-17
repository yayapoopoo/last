package com.icia.dabyinsa.admin.dto.product;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class prodinfoDto {

    /*
    PROD_ID, PROD_NAME, RETAIL_PRICE, SPECIAL_MEMBER_PRICE, TAXRATES, 
    ADMIN_PROD_CODE, PROD_SUMMARY_EX, PROD_BRIEFLY_EX, PROD_DETAIL_EX, 
    SALE_DP, BUY_RIGHTOFF, PROD_METERIAL, SUPPLIER, MAKING_COMPANY, 
    MAKING_DATE, MAKING_CONTRY, REGISTRATION_DATE, FIX_DATE, 
    SHIPPING_FEE, PROD_CATEGRY

    */
    private String Prod_id;
    private String prod_name;
    private int price;
    private int retail_price;
    private int special_member_price;
    private int taxrates;
    private String admin_prod_code;
    private String prod_summary_ex;
    private String prod_briefly_ex;
    private String prod_detail_ex;
    private String sale_dp;
    private String buy_rightoff;
    private String prod_meterial;
    private String supplier;
    private String making_company;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date making_date;
    private String making_contry;
    private Date registration_date;
    private Date fix_date;
    private int shipping_fee;
    private String prod_categry;
    private String oriName;
    private String sysName;


}
