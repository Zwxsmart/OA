package com.cs.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.cs.bean.Income;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.IncomeDAO;

public class IncomeServiceImpl implements IncomeService{

	private IncomeDAO incomeDAO;
	
	public IncomeDAO getIncomeDAO() {
		return incomeDAO;
	}

	public void setIncomeDAO(IncomeDAO incomeDAO) {
		this.incomeDAO = incomeDAO;
	}

	@Override
	public Income save(Income t) {
		return incomeDAO.save(t);
	}

	@Override
	public void delete(Income t) {
		incomeDAO.delete(t);
	}

	@Override
	public void update(Income t) {
		incomeDAO.update(t);
	}

	@Override
	public Income queryById(Class<?> clazz, Serializable id) {
		return incomeDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Income> queryByPager(String beanName, Pager4EasyUI<Income> pager, String sql) {
		return incomeDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return incomeDAO.count(beanName, sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		incomeDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Income> queryByDay(Pager4EasyUI<Income> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return incomeDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<Income> blurredAllQueryPager(String string, Pager4EasyUI<Income> pager, String value,
			String name) {
		return incomeDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Income> pager, String value, String name) {
		return incomeDAO.blurredAllQueryCount(string, pager, value, name);
	}
	@Override
	public void updateByStuId(String stuId, double d) {
		incomeDAO.updateByStuId(stuId, d);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return incomeDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public List<Map<String, String>> payQueryTypeName() {
		return incomeDAO.payQueryTypeName();
	}


}
