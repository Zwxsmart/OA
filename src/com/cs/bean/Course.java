package com.cs.bean;

import java.util.Set;

/**
 *课程表
 * @author 王怡
 */
public class Course {
	//课程编号
	private String courseId;
	//课程名称
	private String name;
	//课程描述
	private String des;
	//课程的总课时数
	private int totalHour;
	//学期
	private int term;
	//课程顺序
	private int courseOrder;
	//课程状态，激活或冻结
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
