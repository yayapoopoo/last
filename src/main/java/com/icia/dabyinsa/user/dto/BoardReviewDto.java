package com.icia.dabyinsa.user.dto;

import lombok.Data;

@Data
public class BoardReviewDto {
	
	
//b_review
	
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
	public int getB_star() {
		return b_star;
	}
	public void setB_star(int b_star) {
		this.b_star = b_star;
	}
	public String getB_original_filename() {
		return b_original_filename;
	}
	public void setB_original_filename(String b_original_filename) {
		this.b_original_filename = b_original_filename;
	}
	public String getB_renamed_filename() {
		return b_renamed_filename;
	}
	public void setB_renamed_filename(String b_renamed_filename) {
		this.b_renamed_filename = b_renamed_filename;
	}
	public String getB_date() {
		return b_date;
	}
	public void setB_date(String b_date) {
		this.b_date = b_date;
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
	
	public int b_no;
	public String prod_id;
	public String b_title;


	public String b_pwd;
	public int cate_no; 
	public String b_writer; 
	public String b_content; 
	public int b_star; 
	public String b_original_filename; 
	public String b_renamed_filename; 
	public String b_date; 
	public String b_admin_dp; 
	public int b_admin_grade; 
	public String b_reply;
	

}

