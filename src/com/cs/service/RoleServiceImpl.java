package com.cs.service;

import java.io.Serializable;
import java.util.List;

import com.cs.bean.Role;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.RoleDAO;

public class RoleServiceImpl implements RoleService {
	
	private RoleDAO roleDAO;

	public RoleDAO getRoleDAO() {
		return roleDAO;
	}

	public void setRoleDAO(RoleDAO roleDAO) {
		this.roleDAO = roleDAO;
	}

	@Override
	public Role save(Role t) {
		return roleDAO.save(t);
	}

	@Override
	public void delete(Role t) {
		roleDAO.delete(t);		
	}

	@Override
	public void update(Role t) {
		roleDAO.update(t);		
	}

	@Override
	public Role queryById(Class<?> clazz, Serializable id) {
		return roleDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Role> queryByPager(String beanName, Pager4EasyUI<Role> pager, String sql) {
		return roleDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return roleDAO.count(beanName,sql);
	}


	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		roleDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Role> queryByDay(Pager4EasyUI<Role> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<Role> blurredAllQueryPager(String string, Pager4EasyUI<Role> pager, String value, String name) {
		return roleDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		// TODO Auto-generated method stub
		return roleDAO.queryPrevillige(roleId, actionName);
	}

}
