package com.cs.bean;

import java.util.Date;

// Ա��������־��
public class Report {
	
	private String reportId;	// ������־���
	private String empId;		// Ա�����
	private Date reportDay;		// ��־ʱ��
	private String des;			// ��־����
	private int status;			// ״̬
	
	private Emp emp;	// ���������־��Ӧ��һ��Ա��
	
	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	public String getReportId() {
		return reportId;
	}
	public void setReportId(String reportId) {
		this.reportId = reportId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public Date getReportDay() {
		return reportDay;
	}
	public void setReportDay(Date reportDay) {
		this.reportDay = reportDay;
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
