package com.cs.bean;

import java.sql.Timestamp;
/**
 * 研讨会表
 * @author 王怡
 */
public class Meetting {
	//研讨会编号
	private String meettingId;
	//主持人编号
	private String empId;
	//研讨会时间
	private Timestamp meettingDay;
	//添加时间
	private Timestamp createdDay;
	//研讨会描述信息
	private String des;
	//状态
	private int status;
	
	//和emp表相关联
	private Emp emp;
	
	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	
	public Timestamp getMeettingDay() {
		return meettingDay;
	}
	public void setMeettingDay(Timestamp meettingDay) {
		this.meettingDay = meettingDay;
	}
	public Timestamp getCreatedDay() {
		return createdDay;
	}
	public void setCreatedDay(Timestamp createdDay) {
		this.createdDay = createdDay;
	}
	public String getMeettingId() {
		return meettingId;
	}
	public void setMeettingId(String meettingId) {
		this.meettingId = meettingId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
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

	@Override
	public String toString() {
		return "Meetting [meettingId=" + meettingId + ", empId=" + empId + ", meettingDay=" + meettingDay
				+ ", createdDay=" + createdDay + ", des=" + des + ", status=" + status + ", emp=" + emp + "]";
	}
	
}
