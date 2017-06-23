package com.cs.bean;

import java.util.Set;

// 物品类型表
public class GoodsType {
	
	private String goodsTypeId;		// 物品类型编号
	private String name;	// 物品名称
	private String des;		// 物品描述
	private int status;		// 状态
	
	private Set<Goods> goodss;
	
	public Set<Goods> getGoodss() {
		return goodss;
	}
	public void setGoodss(Set<Goods> goodss) {
		this.goodss = goodss;
	}
	public String getGoodsTypeId() {
		return goodsTypeId;
	}
	public void setGoodsTypeId(String goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
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
	
	

}
