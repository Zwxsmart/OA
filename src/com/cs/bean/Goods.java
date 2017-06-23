package com.cs.bean;

import java.util.Date;
import java.util.Set;

import org.apache.struts2.json.annotations.JSON;

// ��Ʒ��
public class Goods {
	
	private String goodsId;	// ��Ʒ���
	private String name; // ��Ʒ����
	private int quantity; // ��Ʒ����
	private String des; // ��Ʒ����
	private double unitPrice; 	// ��Ʒ����
	private Date buyDay;	// ����ʱ��
	private String goodsTypeId;	// ��Ʒ���ͱ��
	private int status;		// ״̬
	private int quantityCount;
	
	private GoodsType goodsType;
	private Set<GoodsUse> goodsUses; // һ����Ʒ�������ö��
	
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
