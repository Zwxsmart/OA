package com.cs.bean;

import java.util.Set;

// ��Ʒ���ͱ�
public class GoodsType {
	
	private String goodsTypeId;		// ��Ʒ���ͱ��
	private String name;	// ��Ʒ����
	private String des;		// ��Ʒ����
	private int status;		// ״̬
	
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
