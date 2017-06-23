package com.cs.bean;

import java.util.Date;

public class Income {
	//收入管理
	private String incomeId;			//收入编号
	private String incomeTypeId;	//收入类型编号
	private Date incomeDay;		//收入时间
	private String des;					//收入介绍
	private double income;			//收入金额
	private String empId;				//员工编号
	private String stuId;				//学生编号
	private IncomeType incomeType; //收入类型
	private Emp emp;//员工
	private Stu stu;//学生

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
//-------分----------割
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
