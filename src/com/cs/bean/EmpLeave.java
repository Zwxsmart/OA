package com.cs.bean;

import java.util.Date;

// Ա����ٱ�
public class EmpLeave {
	
	private String leaveId;		// ��ٱ��
	private String empId;		// Ա�����
	private Date startTime;		// ��ʼʱ��
	private Date endTime;		// ����ʱ��
	private Date leaveDay;		// �ύʱ��
	private String des;			// �������
	private int status;			// ״̬
	private int firstLevel;		// ֱ����˾���
	private int secondLevel;	// �ϰ����
	private int pass;			// ͨ��״̬
	
	private Emp emp;	// Ա��
	
	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	public String getLeaveId() {
		return leaveId;
	}
	public void setLeaveId(String leaveId) {
		this.leaveId = leaveId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
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
	public int getFirstLevel() {
		return firstLevel;
	}
	public void setFirstLevel(int firstLevel) {
		this.firstLevel = firstLevel;
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
	
	
	

}
