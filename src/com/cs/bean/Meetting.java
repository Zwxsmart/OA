package com.cs.bean;

import java.sql.Timestamp;
/**
 * ���ֻ��
 * @author ����
 */
public class Meetting {
	//���ֻ���
	private String meettingId;
	//�����˱��
	private String empId;
	//���ֻ�ʱ��
	private Timestamp meettingDay;
	//���ʱ��
	private Timestamp createdDay;
	//���ֻ�������Ϣ
	private String des;
	//״̬
	private int status;
	
	//��emp�������
	private Emp emp;
	
	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	
	public Timestamp getMeettingDay() {
		return meettingDay;
	}
	public void setMeettingDay(Timestamp meettingDay) {
		this.meettingDay = meettingDay;
	}
	public Timestamp getCreatedDay() {
		return createdDay;
	}
	public void setCreatedDay(Timestamp createdDay) {
		this.createdDay = createdDay;
	}
	public String getMeettingId() {
		return meettingId;
	}
	public void setMeettingId(String meettingId) {
		this.meettingId = meettingId;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
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
		return "Meetting [meettingId=" + meettingId + ", empId=" + empId + ", meettingDay=" + meettingDay
				+ ", createdDay=" + createdDay + ", des=" + des + ", status=" + status + ", emp=" + emp + "]";
	}
	
}
