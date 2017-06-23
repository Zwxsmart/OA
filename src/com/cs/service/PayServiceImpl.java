package com.cs.service;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.cs.bean.Pay;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.PayDAO;

public class PayServiceImpl implements PayService{

	private PayDAO payDAO;
	
	
	public PayDAO getPayDAO() {
		return payDAO;
	}

	public void setPayDAO(PayDAO payDAO) {
		this.payDAO = payDAO;
	}


	@Override
	public void delete(Pay t) {
		payDAO.delete(t);
	}

	@Override
	public void update(Pay t) {
		payDAO.update(t);
	}

	@Override
	public Pay save(Pay t) {
		return payDAO.save(t);
	}

	@Override
	public Pay queryById(Class<?> clazz, Serializable id) {
		return payDAO.queryById(clazz, id);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
			payDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Pay> queryByPager(String beanName, Pager4EasyUI<Pay> pager, String sql) {
		return payDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return payDAO.count(beanName, sql);
	}

	@Override
	public Pager4EasyUI<Pay> queryByDay(Pager4EasyUI<Pay> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return payDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<Pay> blurredAllQueryPager(String string, Pager4EasyUI<Pay> pager, String value, String name) {
		return payDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Pay> pager, String value, String name) {
		return payDAO.blurredAllQueryCount(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return payDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public List<Map<String,String>> payQueryTypeName() {
		return payDAO.payQueryTypeName();
	}

}
