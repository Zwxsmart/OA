package com.cs.service;

import java.io.Serializable;
import java.util.List;

import com.cs.bean.Dept;
import com.cs.bean.EmpDept;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.DeptDAO;

public class DeptServiceImpl implements DeptService {
	
	private DeptDAO deptDAO;
	
	

	public DeptDAO getDeptDAO() {
		return deptDAO;
	}

	public void setDeptDAO(DeptDAO deptDAO) {
		this.deptDAO = deptDAO;
	}

	@Override
	public Dept save(Dept t) {
		return deptDAO.save(t);
	}

	@Override
	public void delete(Dept t) {
		deptDAO.delete(t);		
	}

	@Override
	public void update(Dept t) {
		deptDAO.update(t);		
	}

	@Override
	public Dept queryById(Class<?> clazz, Serializable id) {
		return deptDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Dept> queryByPager(String beanName, Pager4EasyUI<Dept> pager, String sql) {
		return deptDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return deptDAO.count(beanName, sql);
	}



	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		deptDAO.updateStatus(beanName, beanId, status, id);
	}

	/**
	 * ≤‚ ‘πÿ¡™≤È—Ø
	 */
	@Override
	public Dept queryByDepId(String id) {
		return deptDAO.queryByDepId(id);
	}

	@Override
	public Pager4EasyUI<EmpDept> queryByPager(Pager4EasyUI<EmpDept> pager) {
		return deptDAO.queryByPager(pager);
	}

	@Override
	public Pager4EasyUI<Dept> queryByDay(Pager4EasyUI<Dept> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<Dept> blurredAllQueryPager(String string, Pager4EasyUI<Dept> pager, String value, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		// TODO Auto-generated method stub
		return deptDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public boolean queryByName(String beanName, String name) {
		return deptDAO.queryByName(beanName, name);
	}



	

}
