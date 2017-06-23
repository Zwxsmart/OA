package com.cs.bean;

import java.math.BigInteger;
import java.util.Date;

public class EmpLeaveInfo {
	
	private String leaveId;		// 请假编号
	private String empId;		// 员工编号
	private String empName;
	private Date startTime;		// 开始时间
	private Date endTime;		// 结束时间
	private Date leaveDay;		// 提交时间
	private String des;			// 请假描述
	private int status;			// 状态
	private int firstLevel;		// 直属上司审核
	private int secondLevel;	// 老板审核
	private int pass;			// 通过状态
	private BigInteger leaveCount; //请假天数
	
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getLeaveId() {
		return leaveId;
	}
	public void setLeaveId(String leaveId) {
		this.leaveId = leaveId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Date getLeaveDay() {
		return leaveDay;
	}
	public void setLeaveDay(Date leaveDay) {
		this.leaveDay = leaveDay;
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
	public BigInteger getLeaveCount() {
		return leaveCount;
	}
	public void setLeaveCount(BigInteger leaveCount) {
		this.leaveCount = leaveCount;
	}
	
	
	

}
