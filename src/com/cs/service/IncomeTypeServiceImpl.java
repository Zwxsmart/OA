package com.cs.service;

import java.io.Serializable;

import com.cs.bean.IncomeType;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.IncomeTypeDAO;

public class IncomeTypeServiceImpl implements IncomeTypeService{

	private IncomeTypeDAO incomeTypeDAO;
	
	public IncomeTypeDAO getIncomeTypeDAO() {
		return incomeTypeDAO;
	}

	public void setIncomeTypeDAO(IncomeTypeDAO incomeTypeDAO) {
		this.incomeTypeDAO = incomeTypeDAO;
	}

	@Override
	public IncomeType save(IncomeType t) {
		return incomeTypeDAO.save(t);
	}

	@Override
	public void delete(IncomeType t) {
		incomeTypeDAO.delete(t);
	}

	@Override
	public void update(IncomeType t) {
		incomeTypeDAO.update(t);
	}

	@Override
	public IncomeType queryById(Class<?> clazz, Serializable id) {
		return incomeTypeDAO.queryById(clazz, id);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		incomeTypeDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<IncomeType> queryByPager(String beanName, Pager4EasyUI<IncomeType> pager, String sql) {
		return incomeTypeDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return incomeTypeDAO.count(beanName, sql);
	}

	@Override
	public Pager4EasyUI<IncomeType> queryByDay(Pager4EasyUI<IncomeType> pager, Serializable startDay,
			Serializable endDay, Serializable beanObject, Serializable attrName) {
		return incomeTypeDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<IncomeType> blurredAllQueryPager(String string, Pager4EasyUI<IncomeType> pager, String value,
			String name) {
		return incomeTypeDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return incomeTypeDAO.queryPrevillige(roleId, actionName);
	}

}
