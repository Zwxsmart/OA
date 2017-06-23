package com.cs.bean;

import java.util.Date;

/**
 * 学生考勤表
 * @author 张文星
 *
 */
public class StuChecking {
	private String checkingId;//学生考勤编号 
	private String stuId;//学生编号
	private Date checkingDay;// 考勤日期
	private String checking1;// 上午
	private String checking2;// 中午
	private String checking3;// 下午
	private Stu stu;//一个学生对应多个考勤
	
	public String getCheckingId() {
		return checkingId;
	}
	public void setCheckingId(String checkingId) {
		this.checkingId = checkingId;
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public Date getCheckingDay() {
		return checkingDay;
	}
	public void setCheckingDay(Date checkingDay) {
		this.checkingDay = checkingDay;
	}
	public String getChecking1() {
		return checking1;
	}
	public void setChecking1(String checking1) {
		this.checking1 = checking1;
	}
	public String getChecking2() {
		return checking2;
	}
	public void setChecking2(String checking2) {
		this.checking2 = checking2;
	}
	public String getChecking3() {
		return checking3;
	}
	public void setChecking3(String checking3) {
		this.checking3 = checking3;
	}
	public Stu getStu() {
		return stu;
	}
	public void setStu(Stu stu) {
		this.stu = stu;
	}
	@Override
	public String toString() {
		return "StuChecking [checkingId=" + checkingId + ", stuId=" + stuId + ", checkingDay=" + checkingDay
				+ ", checking1=" + checking1 + ", checking2=" + checking2 + ", checking3=" + checking3 + ", stu=" + stu
				+ "]";
	}
	
	
	
}
