package com.cs.dao;

import com.cs.bean.Dept;
import com.cs.bean.EmpDept;
import com.cs.commom.bean.Pager4EasyUI;

public interface DeptDAO extends BaseDAO<Dept> {
	
	/**
	 * 根据depId查询数据
	 * @return
	 */
	public Dept queryByDepId(String id);

	public void updateStatus(String beanName, String beanId, int status, String id);
	
	/**
	 * dept和emp组装查询分页
	 * @param pager
	 * @return
	 */
	public Pager4EasyUI<EmpDept> queryByPager(Pager4EasyUI<EmpDept> pager);
	
	/**
	 * 根据名字去查询部门
	 */
	public boolean queryByName(String beanName, String name);
	
	
	
}
