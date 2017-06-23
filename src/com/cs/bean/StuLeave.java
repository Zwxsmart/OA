package com.cs.bean;

import java.util.Date;

/**
 * 学生请假表
 * @author 张文星
 *
 */
public class StuLeave {
	private String leaveId; // 学生请假编号
	private String stuId; //学生编号
	private Date startTime; //开始时间
	private Date endTime; //结束时间
	private Date leaveDay; //提交时间
	private String des; //请假说明
	private int status; //状态, 默认为可用
	private int firlevel; //任课老师审核, 默认不通过
	private int secondLevel; //班主任审核, 默认不通过
	private int pass; //通过状态, 默认不通过
	
	private Stu stu;

	public String getLeaveId() {
		return leaveId;
	}
	public void setLeaveId(String leaveId) {
		this.leaveId = leaveId;
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
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
	public int getFirlevel() {
		return firlevel;
	}
	public void setFirlevel(int firlevel) {
		this.firlevel = firlevel;
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
	
	public Stu getStu() {
		return stu;
	}
	public void setStu(Stu stu) {
		this.stu = stu;
	}
	
	
}
