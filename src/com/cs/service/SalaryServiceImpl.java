package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Salary;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.SalaryDAO;

public class SalaryServiceImpl implements SalaryService{

	private SalaryDAO salaryDAO;

	
	public SalaryDAO getSalaryDAO() {
		return salaryDAO;
	}

	public void setSalaryDAO(SalaryDAO salaryDAO) {
		this.salaryDAO = salaryDAO;
	}

	@Override
	public Salary save(Salary t) {
		return salaryDAO.save(t);
	}

	@Override
	public void delete(Salary t) {
		salaryDAO.delete(t);		
	}

	@Override
	public void update(Salary t) {
		salaryDAO.update(t);		
	}

	@Override
	public Salary queryById(Class<?> clazz, Serializable id) {
		return salaryDAO.queryById(clazz, id);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		salaryDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Salary> queryByPager(String beanName, Pager4EasyUI<Salary> pager, String sql) {
		return salaryDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return salaryDAO.count(beanName, sql);
	}

	@Override
	public Pager4EasyUI<Salary> queryByDay(Pager4EasyUI<Salary> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return salaryDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<Salary> blurredAllQueryPager(String string, Pager4EasyUI<Salary> pager, String value,
			String name) {
		return salaryDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return salaryDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public double querysalary(String value) {
		return salaryDAO.querysalary(value);
	}
}
