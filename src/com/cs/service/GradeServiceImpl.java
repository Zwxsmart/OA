package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Grade;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.GradeDAO;

public class GradeServiceImpl implements GradeService {
	
	private GradeDAO gradeDAO;

	public GradeDAO getGradeDAO() {
		return gradeDAO;
	}

	public void setGradeDAO(GradeDAO gradeDAO) {
		this.gradeDAO = gradeDAO;
	}

	@Override
	public Grade save(Grade t) {
		return gradeDAO.save(t);
	}

	@Override
	public void delete(Grade t) {
		gradeDAO.delete(t);		
	}

	@Override
	public void update(Grade t) {
		gradeDAO.update(t);		
	}

	@Override
	public Grade queryById(Class<?> clazz, Serializable id) {
		return gradeDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Grade> queryByPager(String beanName, Pager4EasyUI<Grade> pager, String sql) {
		return gradeDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return gradeDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		gradeDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public void addStuByIds(String gradeId, String[] split) {
		gradeDAO.addStuByIds(gradeId,split);
	}

	@Override
	public void delStuByIds(String gradeId, String[] split) {
		gradeDAO.delStuByIds(gradeId, split);
	}

	@Override
	public Pager4EasyUI<Grade> queryByDay(Pager4EasyUI<Grade> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return gradeDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<Grade> blurredAllQueryPager(String string, Pager4EasyUI<Grade> pager, String value,
			String name) {
		return gradeDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return gradeDAO.queryPrevillige(roleId, actionName);
	}

}
