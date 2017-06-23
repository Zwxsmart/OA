package com.cs.bean;

import java.util.Date;

/**
 * 学生反馈表
 * @author 张文星
 *
 */
public class StuFeedback {
	private String feedbackId;// 反馈编号
	private String stuId; // 学生编号
	private Date feedbackDay; // 反馈时间
	private String des;// 反馈详情
	private int status;// 状态, 默认可用
	private Stu stu; //多个反馈记录对应一个学生
	
	public String getFeedbackId() {
		return feedbackId;
	}
	public void setFeedbackId(String feedbackId) {
		this.feedbackId = feedbackId;
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public Date getFeedbackDay() {
		return feedbackDay;
	}
	public void setFeedbackDay(Date feedbackDay) {
		this.feedbackDay = feedbackDay;
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
	public Stu getStu() {
		return stu;
	}
	public void setStu(Stu stu) {
		this.stu = stu;
	}
	
}
