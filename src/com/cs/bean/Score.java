package com.cs.bean;

import java.util.Date;

/**
 * ѧ���ɼ���
 * @author ������
 *
 */
public class Score {

	private String scoreId; // �ɼ����
	private String stuId; // ѧ�����
	private String courseId; // �γ̱��
	private float score; // �ɼ�
	private Date testDay; // ����ʱ��
	
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
