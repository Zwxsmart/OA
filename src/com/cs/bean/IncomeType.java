package com.cs.bean;

import java.util.Set;

public class IncomeType {
	
	//�������ͱ�
	
	private String incomeTypeId;	//�������ͱ��
	
	private String name;			//��������
	
	private String des;				//��������
	
	private int status;				//����״̬  ��Ĭ�Ͽ��� ��1����
	
	private Set<Income> incomes;
	

	public Set<Income> getIncomes() {
		return incomes;
	}

	public void setIncomes(Set<Income> incomes) {
		this.incomes = incomes;
	}

	
	//----fengge 
	public String getIncomeTypeId() {
		return incomeTypeId;
	}

	public void setIncomeTypeId(String incomeTypeId) {
		this.incomeTypeId = incomeTypeId;
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

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
