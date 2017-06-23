package com.cs.service;

import java.io.Serializable;
import java.util.List;

import com.cs.bean.Progress;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.ProgressDAO;

public class ProgressServicelmpl implements ProgressService{
	
	private ProgressDAO progressDAO;

	public ProgressDAO getProgressDAO() {
		return progressDAO;
	}

	public void setProgressDAO(ProgressDAO progressDAO) {
		this.progressDAO = progressDAO;
	}

	@Override
	public Progress save(Progress t) {
		return progressDAO.save(t);
	}

	@Override
	public void delete(Progress t) {
		progressDAO.delete(t);
	}

	@Override
	public void update(Progress t) {
		progressDAO.update(t);
	}

	@Override
	public Progress queryById(Class<?> clazz, Serializable id) {
		return progressDAO.queryById(clazz,id);
	}

	@Override
	public Pager4EasyUI<Progress> queryByPager(String beanName, Pager4EasyUI<Progress> pager, String sql) {
		return progressDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return progressDAO.count(beanName,sql);
	}


	@Override
	public Pager4EasyUI<Progress> blurredAllQueryPager(String string, Pager4EasyUI<Progress> pager, String value,
			String name) {
		return progressDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Progress> pager, String value, String name) {
		return progressDAO.blurredAllQueryCount(string, pager, value, name);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		progressDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Progress> queryByDay(Pager4EasyUI<Progress> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return progressDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return progressDAO.queryPrevillige(roleId, actionName);
	}
}
