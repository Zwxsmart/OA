package com.cs.bean;

import java.util.Date;

public class Pay {
	
	// 支出信息表
	
	private String payId;		// 支出编号
	
	private String payTypeId;	// 支出类别编号
	
	private Date payDay;		// 支出时间
	
	private String des;			// 支出描述
	
	private Double pay;			// 支出金额
	
	private String empId;		// 员工编号
	
	private String toName;		// 收款人姓名
	
	private String toPhone;		// 收款人联系方式
	
	
	private PayType payType;    //关联 支出类别
	
	private Emp emp;


	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}
	public String getPayTypeId() {
		return payTypeId;
	}

	public void setPayTypeId(String payTypeId) {
		this.payTypeId = payTypeId;
	}

	public Date getPayDay() {
		return payDay;
	}

	public void setPayDay(Date payDay) {
		this.payDay = payDay;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public Double getPay() {
		return pay;
	}

	public void setPay(Double pay) {
		this.pay = pay;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getToName() {
		return toName;
	}

	public void setToName(String toName) {
		this.toName = toName;
	}

	public String getToPhone() {
		return toPhone;
	}

	public void setToPhone(String toPhone) {
		this.toPhone = toPhone;
	}

	public PayType getPayType() {
		return payType;
	}

	public void setPayType(PayType payType) {
		this.payType = payType;
	}

	@Override
	public String toString() {
		return "Pay [payId=" + payId + ", payTypeId=" + payTypeId + ", payDay=" + payDay + ", des=" + des + ", pay="
				+ pay + ", empId=" + empId + ", toName=" + toName + ", toPhone=" + toPhone + ", payType=" + payType
				+ ", emp=" + emp + "]";
	}
	
}