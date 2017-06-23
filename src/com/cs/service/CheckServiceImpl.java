package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Check;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.CheckDAO;

public class CheckServiceImpl implements CheckService{
	
	private CheckDAO checkDAO;
	
	public CheckDAO getCheckDAO() {
		return checkDAO;
	}

	public void setCheckDAO(CheckDAO checkDAO) {
		this.checkDAO = checkDAO;
	}

	@Override
	public Check save(Check t) {
		return checkDAO.save(t);
	}

	@Override
	public void delete(Check t) {
		checkDAO.delete(t);
	}

	@Override
	public void update(Check t) {
		checkDAO.update(t);
	}

	@Override
	public Check queryById(Class<?> clazz, Serializable id) {
		return checkDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Check> queryByPager(String beanName, Pager4EasyUI<Check> pager, String sql) {
		return checkDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return checkDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pager4EasyUI<Check> queryByDay(Pager4EasyUI<Check> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return checkDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<Check> blurredAllQueryPager(String string, Pager4EasyUI<Check> pager, String value,
			String name) {
		return checkDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return checkDAO.queryPrevillige(roleId, actionName);
	}

}
