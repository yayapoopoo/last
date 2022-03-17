package com.icia.dabyinsa.user.dto;

import lombok.Data;

@Data
public class BoardQnaDto {

	//b_qna
	public int b_no;
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getProd_id() {
		return prod_id;
	}
	public void setProd_id(String prod_id) {
		this.prod_id = prod_id;
	}
	public int getCate_no() {
		return cate_no;
	}
	public void setCate_no(int cate_no) {
		this.cate_no = cate_no;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_pwd() {
		return b_pwd;
	}
	public void setB_pwd(String b_pwd) {
		this.b_pwd = b_pwd;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
	}
	public int getB_views() {
		return b_views;
	}
	public void setB_views(int b_views) {
		this.b_views = b_views;
	}
	public String getB_lock() {
		return b_lock;
	}
	public void setB_lock(String b_lock) {
		this.b_lock = b_lock;
	}
	public String getB_admin_dp() {
		return b_admin_dp;
	}
	public void setB_admin_dp(String b_admin_dp) {
		this.b_admin_dp = b_admin_dp;
	}
	public int getB_admin_grade() {
		return b_admin_grade;
	}
	public void setB_admin_grade(int b_admin_grade) {
		this.b_admin_grade = b_admin_grade;
	}
	public String getB_reply() {
		return b_reply;
	}
	public void setB_reply(String b_reply) {
		this.b_reply = b_reply;
	}
	public String prod_id;
	public int cate_no;
	public String b_title;
	public String b_pwd;
	public String b_writer;
	public String b_content;
	public String b_date;
	public int b_views;
	public String b_lock;
	public String b_admin_dp;
	public int b_admin_grade;
	public String b_reply;
}
