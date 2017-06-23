package com.cs.bean;

import java.util.Date;

/**
 * 学生谈心表
 * @author 张文星
 *
 */
public class Talk {
	private String talkId;//谈心编号
	private String empId;//员工编号
	private String stuId;//学生编号
	private Date talkDay;//谈心时间
	private String des;//谈心详情
	private int status;//状态, 默认可用
	private Stu stu; //一个学生对应多条谈心记录
	private Emp emp; //一个员对应多条谈心记录
	
	public String getTalkId() {
		return talkId;
	}
	public void setTalkId(String talkId) {
		this.talkId = talkId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public Date getTalkDay() {
		return talkDay;
	}
	public void setTalkDay(Date talkDay) {
		this.talkDay = talkDay;
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
		return "Talk [talkId=" + talkId + ", empId=" + empId + ", stuId=" + stuId + ", talkDay=" + talkDay + ", des="
				+ des + ", stauts=" + status + "]";
	}
	public Stu getStu() {
		return stu;
	}
	public void setStu(Stu stu) {
		this.stu = stu;
	}
	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	
}
