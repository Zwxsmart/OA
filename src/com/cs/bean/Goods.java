package com.cs.bean;

import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

// 物品表
public class Goods {
	
	private String goodsId;	// 物品编号
	private String name; // 物品名称
	private int quantity; // 物品总数
	private String des; // 物品描述
	private double unitPrice; 	// 物品单价
	private Date buyDay;	// 购买时间
	private String goodsTypeId;	// 物品类型编号
	private int status;		// 状态
	private int quantityCount;
	
	private GoodsType goodsType;
	private Set<GoodsUse> goodsUses; // 一个物品可以领用多次
	
//	@JSON(serialize=false)
	public Set<GoodsUse> getGoodsUses() {
		return goodsUses;
	}
	public void setGoodsUses(Set<GoodsUse> goodsUses) {
		this.goodsUses = goodsUses;
	}
//	@JSON(serialize=false)
	public GoodsType getGoodsType() {
		return goodsType;
	}
	public void setGoodsType(GoodsType goodsType) {
		this.goodsType = goodsType;
	}
	public int getQuantityCount() {
		return quantityCount;
	}
	public void setQuantityCount(int quantityCount) {
		this.quantityCount = quantityCount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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

	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public Date getBuyDay() {
		return buyDay;
	}
	public void setBuyDay(Date buyDay) {
		this.buyDay = buyDay;
	}
	public String getGoodsTypeId() {
		return goodsTypeId;
	}
	public void setGoodsTypeId(String goodsTypeId) {
		this.goodsTypeId = goodsTypeId;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	

}
