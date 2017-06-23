package com.cs.bean;

import java.util.Date;

// 员工巡查表
public class Check {
	
	private String checkId;		// 巡查编号
	private String empId;		// 员工编号
	private Date checkTime;		// 巡查时间
	private String weekDay;		// 周几
	private String gradeId;		// 班级编号
	private String roomId;		// 宿舍编号
	private String des;			// 巡查描述
	

	private Emp emp;	// 员工
	private Grade grade; // 班级
	private Room room;	// 宿舍

	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	public Room getRoom() {
		return room;
	}
	public void setRoom(Room room) {
		this.room = room;
	}
	public String getCheckId() {
		return checkId;
	}
	public void setCheckId(String checkId) {
		this.checkId = checkId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public Date getCheckTime() {
		return checkTime;
	}
	public void setCheckTime(Date checkTime) {
		this.checkTime = checkTime;
	}
	public String getWeekDay() {
		return weekDay;
	}
	public void setWeekDay(String weekDay) {
		this.weekDay = weekDay;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	@Override
	public String toString() {
		return "Check [checkId=" + checkId + ", empId=" + empId + ", checkTime=" + checkTime + ", weekDay=" + weekDay
				+ ", gradeId=" + gradeId + ", roomId=" + roomId + ", des=" + des + ", emp=" + emp + ", grade=" + grade
				+ ", room=" + room + "]";
	}
	
	
	
}
