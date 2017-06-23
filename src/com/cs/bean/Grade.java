package com.cs.bean;

import java.util.Set;

public class Grade {
	
	private String gradeId; //�༶���
	private String name; //�༶����
	private String empId1; //������
	private String empId2; //�ο���ʦ
	private String empId3; //������ʦ
	private String des; //����
	private int quantity; //�༶�������
	private int status; //״̬
	private String empId1Name;//����������
	private String empId2Name;
	private String empId3Name;

	private Emp emp1; //������
	private Emp emp2; //�ο���ʦ
	private Emp emp3; //������ʦ
	
	//���ð༶�Ϳγ̽��ȵĹ�����ϵ
	private Set<Progress> progresss;
	private Progress progress;
	
	private Set<Check> checks;	// ���Ѳ��
	
	public Set<Check> getChecks() {
		return checks;
	}
	public void setChecks(Set<Check> checks) {
		this.checks = checks;
	}
	public Set<Progress> getProgresss() {
		return progresss;
	}
	public void setProgresss(Set<Progress> progresss) {
		this.progresss = progresss;
	}
	public Progress getProgress() {
		return progress;
	}
	public void setProgress(Progress progress) {
		this.progress = progress;
	}
	
	public Emp getEmp1() {
		return emp1;
	}
	public void setEmp1(Emp emp1) {
		this.emp1 = emp1;
	}
	public Emp getEmp2() {
		return emp2;
	}
	public void setEmp2(Emp emp2) {
		this.emp2 = emp2;
	}
	public Emp getEmp3() {
		return emp3;
	}
	public void setEmp3(Emp emp3) {
		this.emp3 = emp3;
	}
	public String getEmpId1() {
		return empId1;
	}
	public void setEmpId1(String empId1) {
		this.empId1 = empId1;
	}
	public String getEmpId2() {
		return empId2;
	}
	public void setEmpId2(String empId2) {
		this.empId2 = empId2;
	}
	public String getEmpId3() {
		return empId3;
	}
	public void setEmpId3(String empId3) {
		this.empId3 = empId3;
	}
	
	public String getEmpId1Name() {
		return empId1Name;
	}
	public void setEmpId1Name(String empId1Name) {
		this.empId1Name = empId1Name;
	}
	public String getEmpId2Name() {
		return empId2Name;
	}
	public void setEmpId2Name(String empId2Name) {
		this.empId2Name = empId2Name;
	}
	public String getEmpId3Name() {
		return empId3Name;
	}
	public void setEmpId3Name(String empId3Name) {
		this.empId3Name = empId3Name;
	}
	private Set<Stu> stus;
	
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Set<Stu> getStus() {
		return stus;
	}
	public void setStus(Set<Stu> stus) {
		this.stus = stus;
	}
	
	
}
