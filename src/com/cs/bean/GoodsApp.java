package com.cs.bean;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

// ��Ʒ�깺��
public class GoodsApp {
	
	private String goodsAppId;		// ��Ʒ�깺���
	private String empId;			// Ա�����
	private Date appDay;			// �깺ʱ��
	private String goodsName;		// ��Ʒ����
	private int quantity;			// ��Ʒ����
	private String des;				// �깺ԭ��
	private int status;				// ״̬
	private int appStatus;		    // �깺״̬
	private double unitPrice;		//��Ʒ����
	
	private Emp emp;
	
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	public String getGoodsAppId() {
		return goodsAppId;
	}
	public void setGoodsAppId(String goodsAppId) {
		this.goodsAppId = goodsAppId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public Date getAppDay() {
		return appDay;
	}
	public void setAppDay(Date appDay) {
		this.appDay = appDay;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getAppStatus() {
		return appStatus;
	}
	public void setAppStatus(int appStatus) {
		this.appStatus = appStatus;
	}
	
	

}
