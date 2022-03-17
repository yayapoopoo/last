package com.icia.dabyinsa.user.dto;

import lombok.Data;

@Data
public class CartDto {
	private int cart_id;
	private String m_id;
	private String m_name;
	private String prod_id;
	private String prod_name;
	private int img_no_seq;
	private String oriname;
	private int price;
	private int money;
	private int amount;
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
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
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "CartDto [cart_id=" + cart_id + ", m_id=" + m_id + ", m_name=" + m_name + ", prod_id=" + prod_id
				+ ", prod_name=" + prod_name + ", img_no_seq=" + img_no_seq + ", oriname=" + oriname + ", price="
				+ price + ", money=" + money + ", amount=" + amount + "]";
	}
}
