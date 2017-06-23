package com.cs.service;

import java.io.Serializable;

import com.cs.bean.PayType;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.PayTypeDAO;

public class PayTypeServiceImpl implements PayTypeService{

private PayTypeDAO payTypeDAO;
	
	public PayTypeDAO getPayTypeDAO() {
		return payTypeDAO;
	}

	public void setPayTypeDAO(PayTypeDAO payTypeDAO) {
		this.payTypeDAO = payTypeDAO;
	}

	@Override
	public PayType save(PayType t) {
		return payTypeDAO.save(t);
	}

	@Override
	public void delete(PayType t) {
		payTypeDAO.delete(t);
	}

	@Override
	public void update(PayType t) {
		payTypeDAO.update(t);
	}

	@Override
	public PayType queryById(Class<?> clazz, Serializable id) {
		return payTypeDAO.queryById(clazz, id);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		payTypeDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<PayType> queryByPager(String beanName, Pager4EasyUI<PayType> pager, String sql) {
		return payTypeDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return payTypeDAO.count(beanName, sql);
	}

	@Override
	public Pager4EasyUI<PayType> queryByDay(Pager4EasyUI<PayType> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return payTypeDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<PayType> blurredAllQueryPager(String string, Pager4EasyUI<PayType> pager, String value,
			String name) {
		return payTypeDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return payTypeDAO.queryPrevillige(roleId, actionName);
	}
}
