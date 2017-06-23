package com.cs.service;

import java.io.Serializable;

import com.cs.bean.EmpAppeal;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.EmpAppealDAO;

public class EmpAppealServiceImpl implements EmpAppealService {
	
	private EmpAppealDAO empAppealDAO;
	
	public EmpAppealDAO getEmpAppealDAO() {
		return empAppealDAO;
	}

	public void setEmpAppealDAO(EmpAppealDAO empAppealDAO) {
		this.empAppealDAO = empAppealDAO;
	}

	@Override
	public EmpAppeal save(EmpAppeal t) {
		return empAppealDAO.save(t);
	}

	@Override
	public void delete(EmpAppeal t) {
		empAppealDAO.delete(t);
	}

	@Override
	public void update(EmpAppeal t) {
		empAppealDAO.update(t);
	}

	@Override
	public EmpAppeal queryById(Class<?> clazz, Serializable id) {
		return empAppealDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<EmpAppeal> queryByPager(String beanName, Pager4EasyUI<EmpAppeal> pager, String sql) {
		return empAppealDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return empAppealDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		empAppealDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<EmpAppeal> queryByDay(Pager4EasyUI<EmpAppeal> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<EmpAppeal> blurredAllQueryPager(String string, Pager4EasyUI<EmpAppeal> pager, String value,
			String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		// TODO Auto-generated method stub
		return empAppealDAO.queryPrevillige(roleId, actionName);
	}

}
