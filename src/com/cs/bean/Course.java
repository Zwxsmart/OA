package com.cs.bean;

import java.util.Set;

/**
 *�γ̱�
 * @author ����
 */
public class Course {
	//�γ̱��
	private String courseId;
	//�γ�����
	private String name;
	//�γ�����
	private String des;
	//�γ̵��ܿ�ʱ��
	private int totalHour;
	//ѧ��
	private int term;
	//�γ�˳��
	private int courseOrder;
	//�γ�״̬������򶳽�
	private int status;
	
	private Set<Score> scores;
	
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public int getTotalHour() {
		return totalHour;
	}
	public void setTotalHour(int totalHour) {
		this.totalHour = totalHour;
	}
	public int getTerm() {
		return term;
	}
	public void setTerm(int term) {
		this.term = term;
	}
	public int getCourseOrder() {
		return courseOrder;
	}
	public void setCourseOrder(int courseOrder) {
		this.courseOrder = courseOrder;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", name=" + name + ", des=" + des + ", totalHour=" + totalHour
				+ ", term=" + term + ", courseOrder=" + courseOrder + ", status=" + status + "]";
	}
	public Set<Score> getScores() {
		return scores;
	}
	public void setScores(Set<Score> scores) {
		this.scores = scores;
	}
	
}
