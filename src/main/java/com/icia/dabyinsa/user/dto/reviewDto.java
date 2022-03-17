package com.icia.dabyinsa.user.dto;

import lombok.Data;

@Data
public class reviewDto {

	public int getB_NO() {
		return B_NO;
	}

	public void setB_NO(int b_NO) {
		B_NO = b_NO;
	}

	public String getPROD_ID() {
		return PROD_ID;
	}

	public void setPROD_ID(String pROD_ID) {
		PROD_ID = pROD_ID;
	}

	public int getCATE_NO() {
		return CATE_NO;
	}

	public void setCATE_NO(int cATE_NO) {
		CATE_NO = cATE_NO;
	}

	public String getWRITER() {
		return WRITER;
	}

	public void setWRITER(String wRITER) {
		WRITER = wRITER;
	}

	public String getB_CONTENT() {
		return B_CONTENT;
	}

	public void setB_CONTENT(String b_CONTENT) {
		B_CONTENT = b_CONTENT;
	}

	public int getB_STAR() {
		return B_STAR;
	}

	public void setB_STAR(int b_STAR) {
		B_STAR = b_STAR;
	}

	public String getB_ORIGINAL_FILENAME() {
		return B_ORIGINAL_FILENAME;
	}

	public void setB_ORIGINAL_FILENAME(String b_ORIGINAL_FILENAME) {
		B_ORIGINAL_FILENAME = b_ORIGINAL_FILENAME;
	}

	public String getB_RENAMED_FILENAME() {
		return B_RENAMED_FILENAME;
	}

	public void setB_RENAMED_FILENAME(String b_RENAMED_FILENAME) {
		B_RENAMED_FILENAME = b_RENAMED_FILENAME;
	}

	public String getB_DATE() {
		return B_DATE;
	}

	public void setB_DATE(String b_DATE) {
		B_DATE = b_DATE;
	}

	public String getB_ADMIN_DP() {
		return B_ADMIN_DP;
	}

	public void setB_ADMIN_DP(String b_ADMIN_DP) {
		B_ADMIN_DP = b_ADMIN_DP;
	}

	public int getB_ADMIN_GRADE() {
		return B_ADMIN_GRADE;
	}

	public void setB_ADMIN_GRADE(int b_ADMIN_GRADE) {
		B_ADMIN_GRADE = b_ADMIN_GRADE;
	}

	public String getB_REPLY() {
		return B_REPLY;
	}

	public void setB_REPLY(String b_REPLY) {
		B_REPLY = b_REPLY;
	}

	public int getRectn() {
		return rectn;
	}

	public void setRectn(int rectn) {
		this.rectn = rectn;
	}

	public int B_NO;
    public String PROD_ID; 
    public int CATE_NO;
    public String WRITER; 
    public String B_CONTENT;  
    public int B_STAR;
    public String B_ORIGINAL_FILENAME;  
    public String B_RENAMED_FILENAME;  
    public String B_DATE;
    public String B_ADMIN_DP;
    public int B_ADMIN_GRADE;
    public String B_REPLY;
    
    public int rectn; //댓글 수 추가
}