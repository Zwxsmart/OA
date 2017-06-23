package com.cs.bean;

import java.util.Date;

public class Pay {
	
	// ֧����Ϣ��
	
	private String payId;		// ֧�����
	
	private String payTypeId;	// ֧�������
	
	private Date payDay;		// ֧��ʱ��
	
	private String des;			// ֧������
	
	private Double pay;			// ֧�����
	
	private String empId;		// Ա�����
	
	private String toName;		// �տ�������
	
	private String toPhone;		// �տ�����ϵ��ʽ
	
	
	private PayType payType;    //���� ֧�����
	
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