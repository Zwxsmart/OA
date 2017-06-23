package com.cs.bean;

import java.sql.Timestamp;
import java.util.Date;
/**
 * 课程进度表
 * @author 王怡
 *
 */
public class Progress {
	private String progressId;
	private String empId;
	private String gradeId;
	private String des;
	private Timestamp progressDay;
	private int status;
	
	//配置用于课程进度和员工之间的关联关系
	private Emp emp;
	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	//配置用于课程进度和班级之间的关联关系
	private Grade grade;
	
	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	public String getProgressId() {
		return progressId;
	}
	public void setProgressId(String progressId) {
		this.progressId = progressId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public Timestamp getProgressDay() {
		return progressDay;
	}
	public void setProgressDay(Timestamp progressDay) {
		this.progressDay = progressDay;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Progress [progressId=" + progressId + ", empId=" + empId + ", gradeId=" + gradeId + ", des=" + des
				+ ", progressDay=" + progressDay + ", status=" + status + ", grade=" + grade + "]";
	}

	
}
