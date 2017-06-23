package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Exp;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.ExpDAO;

public class ExpServiceImpl implements ExpService{
	
	private ExpDAO expDAO;
	
	public ExpDAO getExpDAO() {
		return expDAO;
	}

	public void setExpDAO(ExpDAO expDAO) {
		this.expDAO = expDAO;
	}

	@Override
	public Exp save(Exp t) {
		return expDAO.save(t);
	}

	@Override
	public void delete(Exp t) {
		expDAO.delete(t);
	}

	@Override
	public void update(Exp t) {
		expDAO.update(t);
	}

	@Override
	public Exp queryById(Class<?> clazz, Serializable id) {
		return expDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Exp> queryByPager(String beanName, Pager4EasyUI<Exp> pager, String sql) {
		return expDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return expDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		expDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Exp> queryByDay(Pager4EasyUI<Exp> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return expDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<Exp> blurredAllQueryPager(String string, Pager4EasyUI<Exp> pager, String value, String name) {
		return expDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		// TODO Auto-generated method stub
		return expDAO.queryPrevillige(roleId, actionName);
	}

}
