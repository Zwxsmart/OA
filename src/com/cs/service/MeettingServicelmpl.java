package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Meetting;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.MeettingDAO;

public class MeettingServicelmpl implements MeettingService{

	private MeettingDAO meettingDAO;
	
	public MeettingDAO getMeettingDAO() {
		return meettingDAO;
	}

	public void setMeettingDAO(MeettingDAO meettingDAO) {
		this.meettingDAO = meettingDAO;
	}

	@Override
	public Meetting save(Meetting t) {
		return meettingDAO.save(t);
	}

	@Override
	public void delete(Meetting t) {
		meettingDAO.delete(t);
	}

	@Override
	public void update(Meetting t) {
		meettingDAO.update(t);
	}

	@Override
	public Meetting queryById(Class<?> clazz, Serializable id) {
		return meettingDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Meetting> queryByPager(String beanName, Pager4EasyUI<Meetting> pager, String sql) {
		return meettingDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return meettingDAO.count(beanName,sql);
	}


	@Override
	public Pager4EasyUI<Meetting> blurredAllQueryPager(String string, Pager4EasyUI<Meetting> pager, String value,
			String name) {
		return meettingDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Meetting> pager, String value, String name) {
		return meettingDAO.blurredAllQueryCount(string, pager, value, name);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		meettingDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Meetting> queryByDay(Pager4EasyUI<Meetting> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return meettingDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<Meetting> serachDate(String beginTime, String endTime, Pager4EasyUI<Meetting> pager) {
		return meettingDAO.serachDate(beginTime, endTime, pager);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return meettingDAO.queryPrevillige(roleId, actionName);
	}

}
