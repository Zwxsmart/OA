package com.cs.bean;

import java.util.Date;

/**
 * ѧ��̸�ı�
 * @author ������
 *
 */
public class Talk {
	private String talkId;//̸�ı��
	private String empId;//Ա�����
	private String stuId;//ѧ�����
	private Date talkDay;//̸��ʱ��
	private String des;//̸������
	private int status;//״̬, Ĭ�Ͽ���
	private Stu stu; //һ��ѧ����Ӧ����̸�ļ�¼
	private Emp emp; //һ��Ա��Ӧ����̸�ļ�¼
	
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
