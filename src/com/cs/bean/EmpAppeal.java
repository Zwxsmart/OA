package com.cs.bean;

import java.util.Date;

// Ա���������߱�
public class EmpAppeal {
	
	private String appealId;	// ��ٱ��
	private String empId;	// Ա�����
	private Date appealDay;	// �ύʱ��
	private String des;		// �������
	private int status;		// ״̬
	private int firstLevel;		// ֱ����˾���
	private int secondLevel;	// �ϰ����
	private int pass;			// ͨ��״̬
	
	public String getAppealId() {
		return appealId;
	}
	public void setAppealId(String appealId) {
		this.appealId = appealId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public Date getAppealDay() {
		return appealDay;
	}
	public void setAppealDay(Date appealDay) {
		this.appealDay = appealDay;
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
