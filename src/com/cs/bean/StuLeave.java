package com.cs.bean;

import java.util.Date;

/**
 * ѧ����ٱ�
 * @author ������
 *
 */
public class StuLeave {
	private String leaveId; // ѧ����ٱ��
	private String stuId; //ѧ�����
	private Date startTime; //��ʼʱ��
	private Date endTime; //����ʱ��
	private Date leaveDay; //�ύʱ��
	private String des; //���˵��
	private int status; //״̬, Ĭ��Ϊ����
	private int firlevel; //�ο���ʦ���, Ĭ�ϲ�ͨ��
	private int secondLevel; //���������, Ĭ�ϲ�ͨ��
	private int pass; //ͨ��״̬, Ĭ�ϲ�ͨ��
	
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
