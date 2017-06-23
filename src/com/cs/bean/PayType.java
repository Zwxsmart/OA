package com.cs.bean;

public class PayType {
	
	//支出类型
	
	private String payTypeId;	// 支出类型编号
	
	public String getPayTypeId() {
		return payTypeId;
	}

	public void setPayTypeId(String payTypeId) {
		this.payTypeId = payTypeId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	private String name;	//支出类型名称
	
	private String des;		//支出类型介绍
	
	private int status;		//状态默认可用（1）

}
