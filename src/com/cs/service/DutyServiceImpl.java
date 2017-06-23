package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Duty;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.DutyDAO;

public class DutyServiceImpl implements DutyService{
	
	private DutyDAO dutyDAO;
	
	public DutyDAO getDutyDAO() {
		return dutyDAO;
	}

	public void setDutyDAO(DutyDAO dutyDAO) {
		this.dutyDAO = dutyDAO;
	}

	@Override
	public Duty save(Duty t) {
		return dutyDAO.save(t);
	}

	@Override
	public void delete(Duty t) {
		dutyDAO.delete(t);
	}

	@Override
	public void update(Duty t) {
		dutyDAO.update(t);
	}

	@Override
	public Duty queryById(Class<?> clazz, Serializable id) {
		return dutyDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Duty> queryByPager(String beanName, Pager4EasyUI<Duty> pager, String sql) {
		return dutyDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return dutyDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pager4EasyUI<Duty> queryByDay(Pager4EasyUI<Duty> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return dutyDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<Duty> blurredAllQueryPager(String string, Pager4EasyUI<Duty> pager, String value, String name) {
		return dutyDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return dutyDAO.queryPrevillige(roleId, actionName);
	}

}
