package com.cs.service;

import java.io.Serializable;
import java.util.List;

import com.cs.bean.Edu;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.EduDAO;

public class EduServiceImpl implements EduService {
	
	private EduDAO eduDAO;
	
	

	public EduDAO getEduDAO() {
		return eduDAO;
	}

	public void setEduDAO(EduDAO eduDAO) {
		this.eduDAO = eduDAO;
	}

	@Override
	public Edu save(Edu t) {
		return eduDAO.save(t);
	}

	@Override
	public void delete(Edu t) {
		eduDAO.delete(t);
	}

	@Override
	public void update(Edu t) {
		eduDAO.update(t);
	}

	@Override
	public Edu queryById(Class<?> clazz, Serializable id) {
		return eduDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Edu> queryByPager(String beanName, Pager4EasyUI<Edu> pager, String sql) {
		return eduDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return eduDAO.count(beanName,sql);
	}


	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		eduDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Edu> queryByDay(Pager4EasyUI<Edu> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return null;
	}

	@Override
	public Pager4EasyUI<Edu> blurredAllQueryPager(String string, Pager4EasyUI<Edu> pager, String value, String name) {
		return eduDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return eduDAO.queryPrevillige(roleId, actionName);
	}
	

}
