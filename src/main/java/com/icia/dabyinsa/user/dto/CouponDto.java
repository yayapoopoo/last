package com.icia.dabyinsa.user.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class CouponDto {
	private int icp_num;
	private String m_id;
	private String m_name;
	private String cp_num;
	private String cp_name;
	private String cp_content;
	private int cp_dis;
	private Date cp_date;
	public Date getCp_date() {
		return cp_date;
	}
	public void setCp_date(Date cp_date) {
		this.cp_date = cp_date;
	}
	public int getCp_dis() {
		return cp_dis;
	}
	public void setCp_dis(int cp_dis) {
		this.cp_dis = cp_dis;
	}
	public int getIcp_num() {
		return icp_num;
	}
	public void setIcp_num(int icp_num) {
		this.icp_num = icp_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getCp_num() {
		return cp_num;
	}
	public void setCp_num(String cp_num) {
		this.cp_num = cp_num;
	}
	public String getCp_name() {
		return cp_name;
	}
	public void setCp_name(String cp_name) {
		this.cp_name = cp_name;
	}
	public String getCp_content() {
		return cp_content;
	}
	public void setCp_content(String cp_content) {
		this.cp_content = cp_content;
	}
}
