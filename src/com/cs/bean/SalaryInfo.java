package com.cs.bean;

public class SalaryInfo {
	
	private String salaryInfoId; //工资情况编号
	
	private String empId;//员工编号
	
	private double basicSalary;//基本工资
	
	private double jobSalary;//岗位工资
	
	private Emp emp;//empName
	

	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public String getSalaryInfoId() {
		return salaryInfoId;
	}

	public void setSalaryInfoId(String salaryInfoId) {
		this.salaryInfoId = salaryInfoId;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public double getBasicSalary() {
		return basicSalary;
	}

	public void setBasicSalary(double basicSalary) {
		this.basicSalary = basicSalary;
	}

	public double getJobSalary() {
		return jobSalary;
	}

	public void setJobSalary(double jobSalary) {
		this.jobSalary = jobSalary;
	}
}