package com.cs.service;

import java.io.Serializable;

import com.cs.bean.EmpLeave;
import com.cs.bean.EmpLeaveInfo;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.EmpLeaveDAO;

public class EmpLeaveServiceImpl implements EmpLeaveService{
	
	private EmpLeaveDAO empLeaveDAO;
	

	public EmpLeaveDAO getEmpLeaveDAO() {
		return empLeaveDAO;
	}

	public void setEmpLeaveDAO(EmpLeaveDAO empLeaveDAO) {
		this.empLeaveDAO = empLeaveDAO;
	}

	@Override
	public EmpLeave save(EmpLeave t) {
		return empLeaveDAO.save(t);
	}

	@Override
	public void delete(EmpLeave t) {
		empLeaveDAO.delete(t);
	}

	@Override
	public void update(EmpLeave t) {
		empLeaveDAO.update(t);
	}

	@Override
	public EmpLeave queryById(Class<?> clazz, Serializable id) {
		return empLeaveDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<EmpLeave> queryByPager(String beanName, Pager4EasyUI<EmpLeave> pager, String sql) {
		return empLeaveDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return empLeaveDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		empLeaveDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<EmpLeave> queryByDay(Pager4EasyUI<EmpLeave> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return empLeaveDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<EmpLeave> blurredAllQueryPager(String string, Pager4EasyUI<EmpLeave> pager, String value,
			String name) {
		return empLeaveDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		// TODO Auto-generated method stub
		return empLeaveDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public long queryCountLeave(String beanName, String id) {
		return empLeaveDAO.queryCountLeave(beanName, id);
	}

	@Override
	public Pager4EasyUI<EmpLeaveInfo> queryPager(Pager4EasyUI<EmpLeaveInfo> pager, String sql) {
		return empLeaveDAO.queryPager(pager, sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String fieldName, String id) {
		empLeaveDAO.updateStatus(beanName, beanId, status, fieldName, id);		
	}

	@Override
	public Pager4EasyUI<EmpLeaveInfo> queryPageAll(String string, Pager4EasyUI<EmpLeaveInfo> pager, String value,
			String name) {
		return empLeaveDAO.queryPageAll(string, pager, value, name);
	}

	@Override
	public Pager4EasyUI<EmpLeaveInfo> queryByEmpLeaveDay(Pager4EasyUI<EmpLeaveInfo> pager, Serializable startDay,
			Serializable endDay, Serializable beanObject) {
		return empLeaveDAO.queryByEmpLeaveDay(pager, startDay, endDay, beanObject);
	}

}
