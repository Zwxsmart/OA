package com.cs.bean;

import java.util.Date;

public class Income {
	//�������
	private String incomeId;			//������
	private String incomeTypeId;	//�������ͱ��
	private Date incomeDay;		//����ʱ��
	private String des;					//�������
	private double income;			//������
	private String empId;				//Ա�����
	private String stuId;				//ѧ�����
	private IncomeType incomeType; //��������
	private Emp emp;//Ա��
	private Stu stu;//ѧ��

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

	
	public IncomeType getIncomeType() {
		return incomeType;
	}

	public void setIncomeType(IncomeType incomeType) {
		this.incomeType = incomeType;
	}
//-------��----------��
	public String getIncomeId() {
		return incomeId;
	}

	public void setIncomeId(String incomeId) {
		this.incomeId = incomeId;
	}

	public String getIncomeTypeId() {
		return incomeTypeId;
	}

	public void setIncomeTypeId(String incomeTypeId) {
		this.incomeTypeId = incomeTypeId;
	}

	public Date getIncomeDay() {
		return incomeDay;
	}

	public void setIncomeDay(Date incomeDay) {
		this.incomeDay = incomeDay;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public double getIncome() {
		return income;
	}

	public void setIncome(double income) {
		this.income = income;
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

	
}
