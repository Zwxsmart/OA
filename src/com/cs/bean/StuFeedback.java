package com.cs.bean;

import java.util.Date;

/**
 * ѧ��������
 * @author ������
 *
 */
public class StuFeedback {
	private String feedbackId;// �������
	private String stuId; // ѧ�����
	private Date feedbackDay; // ����ʱ��
	private String des;// ��������
	private int status;// ״̬, Ĭ�Ͽ���
	private Stu stu; //���������¼��Ӧһ��ѧ��
	
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
