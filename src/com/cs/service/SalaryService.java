package com.cs.service;

import com.cs.bean.Salary;

public interface SalaryService extends BaseService<Salary> {
	public double querysalary(String value);
}
