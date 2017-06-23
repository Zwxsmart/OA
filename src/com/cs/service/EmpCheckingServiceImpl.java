package com.cs.service;

import java.io.Serializable;
import java.util.List;

import com.cs.bean.EmpChecking;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.EmpCheckingDAO;

public class EmpCheckingServiceImpl implements EmpCheckingService{
	
	
	private EmpCheckingDAO empCheckingDAO;
	
	public EmpCheckingDAO getEmpCheckingDAO() {
		return empCheckingDAO;
	}

	public void setEmpCheckingDAO(EmpCheckingDAO empCheckingDAO) {
		this.empCheckingDAO = empCheckingDAO;
	}

	@Override
	public EmpChecking save(EmpChecking t) {
		return empCheckingDAO.save(t);
	}

	@Override
	public void delete(EmpChecking t) {
		empCheckingDAO.delete(t);
	}

	@Override
	public void update(EmpChecking t) {
		empCheckingDAO.update(t);
	}

	@Override
	public EmpChecking queryById(Class<?> clazz, Serializable id) {
		return empCheckingDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<EmpChecking> queryByPager(String beanName, Pager4EasyUI<EmpChecking> pager, String sql) {
		return empCheckingDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return empCheckingDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		
	}

	@Override
	public Pager4EasyUI<EmpChecking> queryByDay(Pager4EasyUI<EmpChecking> pager, Serializable startDay,
			Serializable endDay, Serializable beanObject, Serializable attrName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<EmpChecking> blurredAllQueryPager(String string, Pager4EasyUI<EmpChecking> pager, String value,
			String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return empCheckingDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public Pager4EasyUI<EmpChecking> queryEmpChecking(Pager4EasyUI<EmpChecking> pager, String depId) {
		return empCheckingDAO.queryEmpChecking(pager, depId);
	}

	@Override
	public List<EmpChecking> queryAll(String depId) {
		return empCheckingDAO.queryAll(depId);
	}

	@Override
	public List<EmpChecking> queryByMonth(String depId, String year, String month) {
		return empCheckingDAO.queryByMonth(depId, year, month);
	}

}
