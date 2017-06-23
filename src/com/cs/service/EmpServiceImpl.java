package com.cs.service;

import java.io.Serializable;
import java.util.List;

import com.cs.bean.DRECommom;
import com.cs.bean.Emp;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.AbstractBaseDAO;
import com.cs.dao.EmpDAO;

public class EmpServiceImpl implements EmpService {
	
	private EmpDAO empDAO;

	public EmpDAO getEmpDAO() {
		return empDAO;
	}

	public void setEmpDAO(EmpDAO empDAO) {
		this.empDAO = empDAO;
	}

	@Override
	public Emp save(Emp t) {
		return empDAO.save(t);
	}

	@Override
	public void delete(Emp t) {
		empDAO.delete(t);
	}

	@Override
	public void update(Emp t) {
		empDAO.update(t);
	}

	@Override
	public Emp queryById(Class<?> clazz, Serializable id) {
		return empDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Emp> queryByPager(String beanName, Pager4EasyUI<Emp> pager, String sql) {
		return empDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return empDAO.count(beanName,sql);
	}




	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<DRECommom> pager, String value, String name) {
		return empDAO.blurredAllQueryCount(string, pager, value, name);
	}

	@Override
	public Emp queryById(String id) {
		return empDAO.queryById(id);
	}

	@Override
	public Pager4EasyUI<DRECommom> queryByPager(Pager4EasyUI<DRECommom> pager, String sql) {
		return empDAO.queryByPager(pager, sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		empDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<DRECommom> queryTermIdPager(String string, Pager4EasyUI<DRECommom> pager, String sql) {
		return empDAO.queryTermIdPager(string, pager, sql);
	}

	@Override
	public List<Emp> queryEmailPwd(Emp emp) {
		return empDAO.queryEmailPwd(emp);
	}

	@Override
	public Pager4EasyUI<Emp> queryByDay(Pager4EasyUI<Emp> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return empDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<Emp> blurredAllQueryPager(String string, Pager4EasyUI<Emp> pager, String value, String name) {
		return empDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public Pager4EasyUI<DRECommom> queryPageAll(String string, Pager4EasyUI<DRECommom> pager, String value,
			String name) {
		return empDAO.queryPageAll(string, pager, value, name);
	}

	@Override
	public Pager4EasyUI<DRECommom> queryByEmpDay(Pager4EasyUI<DRECommom> pager, Serializable startDay,
			Serializable endDay, Serializable beanObject) {
		return empDAO.queryByEmpDay(pager, startDay, endDay, beanObject);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return empDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public void updateByid(String beanName,Emp emp){
		empDAO.updateByid(beanName,emp);
	}

	/**¡¢
	 * ÐÞ¸ÄÃÜÂë
	 */
	@Override
	public void updatePwd(String tableName, String flterId, String id, String pwd) {
		empDAO.updatePwd(tableName, flterId, id, pwd);
	}

}
