package com.cs.bean;

import java.util.Date;

/**
 * 学生成绩表
 * @author 张文星
 *
 */
public class Score {

	private String scoreId; // 成绩编号
	private String stuId; // 学生编号
	private String courseId; // 课程编号
	private float score; // 成绩
	private Date testDay; // 考试时间
	
	private Stu stu;
	private Course course;
	
	public String getScoreId() {
		return scoreId;
	}
	public void setScoreId(String scoreId) {
		this.scoreId = scoreId;
	}
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public Date getTestDay() {
		return testDay;
	}
	public void setTestDay(Date testDay) {
		this.testDay = testDay;
	}
	@Override
	public String toString() {
		return "Score [scoreId=" + scoreId + ", stuId=" + stuId + ", courseId=" + courseId + ", score=" + score
				+ ", testDay=" + testDay + "]";
	}
	public Stu getStu() {
		return stu;
	}
	public void setStu(Stu stu) {
		this.stu = stu;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	
	
}
