package com.cs.bean;

import java.util.Date;

// 员工工作日志表
public class Report {
	
	private String reportId;	// 工作日志编号
	private String empId;		// 员工编号
	private Date reportDay;		// 日志时间
	private String des;			// 日志描述
	private int status;			// 状态
	
	private Emp emp;	// 多个工作日志对应于一个员工
	
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
