package com.cs.bean;

import java.util.Date;

// 员工考勤申诉表
public class EmpAppeal {
	
	private String appealId;	// 请假编号
	private String empId;	// 员工编号
	private Date appealDay;	// 提交时间
	private String des;		// 请假描述
	private int status;		// 状态
	private int firstLevel;		// 直属上司审核
	private int secondLevel;	// 老板审核
	private int pass;			// 通过状态
	
	public String getAppealId() {
		return appealId;
	}
	public void setAppealId(String appealId) {
		this.appealId = appealId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public Date getAppealDay() {
		return appealDay;
	}
	public void setAppealDay(Date appealDay) {
		this.appealDay = appealDay;
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
	public int getFirstLevel() {
		return firstLevel;
	}
	public void setFirstLevel(int firstLevel) {
		this.firstLevel = firstLevel;
	}
	public int getSecondLevel() {
		return secondLevel;
	}
	public void setSecondLevel(int secondLevel) {
		this.secondLevel = secondLevel;
	}
	public int getPass() {
		return pass;
	}
	public void setPass(int pass) {
		this.pass = pass;
	}
	
	
	
	
	
	

}
