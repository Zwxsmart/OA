package com.cs.service;

import java.io.Serializable;

import com.cs.bean.EmpFeedBack;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.EmpFeedBackDAO;

public class EmpFeedBackServiceImpl implements EmpFeedBackService{
	
	private EmpFeedBackDAO empFeedBackDAO;
	
	public EmpFeedBackDAO getEmpFeedBackDAO() {
		return empFeedBackDAO;
	}

	public void setEmpFeedBackDAO(EmpFeedBackDAO empFeedBackDAO) {
		this.empFeedBackDAO = empFeedBackDAO;
	}

	@Override
	public EmpFeedBack save(EmpFeedBack t) {
		return empFeedBackDAO.save(t);
	}

	@Override
	public void delete(EmpFeedBack t) {
		empFeedBackDAO.delete(t);
	}

	@Override
	public void update(EmpFeedBack t) {
		empFeedBackDAO.update(t);
	}

	@Override
	public EmpFeedBack queryById(Class<?> clazz, Serializable id) {
		return empFeedBackDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<EmpFeedBack> queryByPager(String beanName, Pager4EasyUI<EmpFeedBack> pager, String sql) {
		return empFeedBackDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return empFeedBackDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		empFeedBackDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<EmpFeedBack> queryByDay(Pager4EasyUI<EmpFeedBack> pager, Serializable startDay,
			Serializable endDay, Serializable beanObject, Serializable attrName) {
		return empFeedBackDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<EmpFeedBack> blurredAllQueryPager(String string, Pager4EasyUI<EmpFeedBack> pager, String value,
			String name) {
		return empFeedBackDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		// TODO Auto-generated method stub
		return empFeedBackDAO.queryPrevillige(roleId, actionName);
	}

}
