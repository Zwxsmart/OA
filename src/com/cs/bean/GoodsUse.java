package com.cs.bean;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

// 物品领用表
public class GoodsUse {
	
	private String useId;	// 领用编号
	private String goodsId;	// 物品编号
	private String empId;	// 员工编号
	private int quantity;	// 物品数量
	private Date useDay;	// 领用时间
	private Date ereturnDay; // 预计归还时间
	private Date returnDay;	// 归还时间
	private int useStatus; //归还状态
	private String des;

	private Emp emp;	// 一个员工可以领用多次物品
	private Goods goods;	// 一个物品也可以被领用多次
	
	public Emp getEmp() {
		return emp;
	}
	
	
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	
	
	
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
	public int getUseStatus() {
		return useStatus;
	}
	public void setUseStatus(int useStatus) {
		this.useStatus = useStatus;
	}
	public String getUseId() {
		return useId;
	}
	public void setUseId(String useId) {
		this.useId = useId;
	}
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Date getUseDay() {
		return useDay;
	}
	public void setUseDay(Date useDay) {
		this.useDay = useDay;
	}
	public Date getEreturnDay() {
		return ereturnDay;
	}
	public void setEreturnDay(Date ereturnDay) {
		this.ereturnDay = ereturnDay;
	}
	public Date getReturnDay() {
		return returnDay;
	}
	public void setReturnDay(Date returnDay) {
		this.returnDay = returnDay;
	}
	
	

}
