package com.cs.bean;

import java.util.Date;

// Ա��������
public class EmpFeedBack {
	
	private String feedBackId;	// �������
	private String empId;		// Ա�����
	private Date feedBackDay;	// ����ʱ��
	private String des;			// ��������
	private int status;			// ����״̬
	
	private Emp emp;	// Ա��

	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	public String getFeedBackId() {
		return feedBackId;
	}
	public void setFeedBackId(String feedBackId) {
		this.feedBackId = feedBackId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public Date getFeedBackDay() {
		return feedBackDay;
	}
	public void setFeedBackDay(Date feedBackDay) {
		this.feedBackDay = feedBackDay;
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
