package com.icia.dabyinsa.user.dto;

import lombok.Data;

@Data
public class MiligeDto {
	private String m_id;
	private String m_name;
	private int mi_acc;
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
	public int getMi_acc() {
		return mi_acc;
	}
	public void setMi_acc(int mi_acc) {
		this.mi_acc = mi_acc;
	}
}
