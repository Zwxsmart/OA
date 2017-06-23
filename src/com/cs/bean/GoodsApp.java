package com.cs.bean;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

// 物品申购表
public class GoodsApp {
	
	private String goodsAppId;		// 物品申购编号
	private String empId;			// 员工编号
	private Date appDay;			// 申购时间
	private String goodsName;		// 物品名称
	private int quantity;			// 物品数量
	private String des;				// 申购原因
	private int status;				// 状态
	private int appStatus;		    // 申购状态
	private double unitPrice;		//物品单价
	
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
