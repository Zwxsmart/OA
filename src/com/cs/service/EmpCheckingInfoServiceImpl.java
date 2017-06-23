package com.cs.service;

import java.io.Serializable;
import java.util.List;

import com.cs.bean.EmpCheckingInfo;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.EmpCheckingInfoDAO;

public class EmpCheckingInfoServiceImpl implements EmpCheckingInfoService{
	
	private EmpCheckingInfoDAO empCheckingInfoDAO;
	
	public EmpCheckingInfoDAO getEmpCheckingInfoDAO() {
		return empCheckingInfoDAO;
	}

	public void setEmpCheckingInfoDAO(EmpCheckingInfoDAO empCheckingInfoDAO) {
		this.empCheckingInfoDAO = empCheckingInfoDAO;
	}

	@Override
	public EmpCheckingInfo save(EmpCheckingInfo t) {
		return empCheckingInfoDAO.save(t);
	}

	@Override
	public void delete(EmpCheckingInfo t) {
		empCheckingInfoDAO.delete(t);
	}

	@Override
	public void update(EmpCheckingInfo t) {
		empCheckingInfoDAO.update(t);
	}

	@Override
	public EmpCheckingInfo queryById(Class<?> clazz, Serializable id) {
		return empCheckingInfoDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<EmpCheckingInfo> queryByPager(String beanName, Pager4EasyUI<EmpCheckingInfo> pager, String sql) {
		return empCheckingInfoDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return empCheckingInfoDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Pager4EasyUI<EmpCheckingInfo> queryByDay(Pager4EasyUI<EmpCheckingInfo> pager, Serializable startDay,
			Serializable endDay, Serializable beanObject, Serializable attrName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<EmpCheckingInfo> blurredAllQueryPager(String string, Pager4EasyUI<EmpCheckingInfo> pager,
			String value, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		// TODO Auto-generated method stub
		return empCheckingInfoDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public List<EmpCheckingInfo> query() {
		return empCheckingInfoDAO.query();
	}

}
