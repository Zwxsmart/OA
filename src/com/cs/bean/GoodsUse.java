package com.cs.bean;

import java.util.Date;

import org.apache.struts2.json.annotations.JSON;

// ��Ʒ���ñ�
public class GoodsUse {
	
	private String useId;	// ���ñ��
	private String goodsId;	// ��Ʒ���
	private String empId;	// Ա�����
	private int quantity;	// ��Ʒ����
	private Date useDay;	// ����ʱ��
	private Date ereturnDay; // Ԥ�ƹ黹ʱ��
	private Date returnDay;	// �黹ʱ��
	private int useStatus; //�黹״̬
	private String des;

	private Emp emp;	// һ��Ա���������ö����Ʒ
	private Goods goods;	// һ����ƷҲ���Ա����ö��
	
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
