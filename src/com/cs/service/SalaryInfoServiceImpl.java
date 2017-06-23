package com.cs.service;

import java.io.Serializable;

import com.cs.bean.SalaryInfo;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.SalaryInfoDAO;

public class SalaryInfoServiceImpl implements SalaryInfoService{

	private SalaryInfoDAO salaryInfoDAO;
	
	public SalaryInfoDAO getSalaryInfoDAO() {
		return salaryInfoDAO;
	}

	public void setSalaryInfoDAO(SalaryInfoDAO salaryInfoDAO) {
		this.salaryInfoDAO = salaryInfoDAO;
	}

	@Override
	public SalaryInfo save(SalaryInfo t) {
		return salaryInfoDAO.save(t);
	}

	@Override
	public void delete(SalaryInfo t) {
		salaryInfoDAO.delete(t);
	}

	@Override
	public void update(SalaryInfo t) {
		salaryInfoDAO.update(t);
	}

	@Override
	public SalaryInfo queryById(Class<?> clazz, Serializable id) {
		return salaryInfoDAO.queryById(clazz, id);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		salaryInfoDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<SalaryInfo> queryByPager(String beanName, Pager4EasyUI<SalaryInfo> pager, String sql) {
		return salaryInfoDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return salaryInfoDAO.count(beanName, sql);
	}

	@Override
	public Pager4EasyUI<SalaryInfo> queryByDay(Pager4EasyUI<SalaryInfo> pager, Serializable startDay,
			Serializable endDay, Serializable beanObject, Serializable attrName) {
		return salaryInfoDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<SalaryInfo> blurredAllQueryPager(String string, Pager4EasyUI<SalaryInfo> pager, String value,
			String name) {
		return salaryInfoDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return salaryInfoDAO.queryPrevillige(roleId, actionName);
	}

}
