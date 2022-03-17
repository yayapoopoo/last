package com.icia.dabyinsa.user.dto;

import lombok.Data;

@Data
public class ProductListDto {
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getRetail_price() {
		return retail_price;
	}
	public void setRetail_price(int retail_price) {
		this.retail_price = retail_price;
	}
	public int getSpecial_member_price() {
		return special_member_price;
	}
	public void setSpecial_member_price(int special_member_price) {
		this.special_member_price = special_member_price;
	}
	public int getTaxrates() {
		return taxrates;
	}
	public void setTaxrates(int taxrates) {
		this.taxrates = taxrates;
	}
	public String getAdmin_prod_code() {
		return admin_prod_code;
	}
	public void setAdmin_prod_code(String admin_prod_code) {
		this.admin_prod_code = admin_prod_code;
	}
	public String getProd_summary_ex() {
		return prod_summary_ex;
	}
	public void setProd_summary_ex(String prod_summary_ex) {
		this.prod_summary_ex = prod_summary_ex;
	}
	public String getProd_briefly_ex() {
		return prod_briefly_ex;
	}
	public void setProd_briefly_ex(String prod_briefly_ex) {
		this.prod_briefly_ex = prod_briefly_ex;
	}
	public String getProd_detail_ex() {
		return prod_detail_ex;
	}
	public void setProd_detail_ex(String prod_detail_ex) {
		this.prod_detail_ex = prod_detail_ex;
	}
	public String getSale_dp() {
		return sale_dp;
	}
	public void setSale_dp(String sale_dp) {
		this.sale_dp = sale_dp;
	}
	public String getBuy_rightoff() {
		return buy_rightoff;
	}
	public void setBuy_rightoff(String buy_rightoff) {
		this.buy_rightoff = buy_rightoff;
	}
	public String getProd_meterial() {
		return prod_meterial;
	}
	public void setProd_meterial(String prod_meterial) {
		this.prod_meterial = prod_meterial;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public String getMaking_company() {
		return making_company;
	}
	public void setMaking_company(String making_company) {
		this.making_company = making_company;
	}
	public String getMaking_date() {
		return making_date;
	}
	public void setMaking_date(String making_date) {
		this.making_date = making_date;
	}
	public String getMaking_contry() {
		return making_contry;
	}
	public void setMaking_contry(String making_contry) {
		this.making_contry = making_contry;
	}
	public String getRegistration_date() {
		return registration_date;
	}
	public void setRegistration_date(String registration_date) {
		this.registration_date = registration_date;
	}
	public String getFix_date() {
		return fix_date;
	}
	public void setFix_date(String fix_date) {
		this.fix_date = fix_date;
	}
	public int getShipping_fee() {
		return shipping_fee;
	}
	public void setShipping_fee(int shipping_fee) {
		this.shipping_fee = shipping_fee;
	}
	public String getProd_categry() {
		return prod_categry;
	}
	public void setProd_categry(String prod_categry) {
		this.prod_categry = prod_categry;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	
	public String getB_star() {
		return b_star;
	}
	public void setB_star(String b_star) {
		this.b_star = b_star;
	}
	
	public String prod_id;
	public String prod_name;
	public int price;
	public int retail_price;
	public int special_member_price;
	public int taxrates;
	public String admin_prod_code;
	public String prod_summary_ex;
	public String prod_briefly_ex;
	public String prod_detail_ex;
	public String sale_dp;
	public String buy_rightoff;
	public String prod_meterial;
	public String supplier;
	public String making_company;
	public String making_date;
	public String making_contry;
	public String registration_date;
	public String fix_date;
	public int shipping_fee;
	public String prod_categry;	
	public String img_url;
	
	
	public String b_content;
	public String b_star;

	public int oi_amount;
	
	public int img_no_seq;
    private String pi_prod_id;
    private String oriname;
    private String sysname;
}

