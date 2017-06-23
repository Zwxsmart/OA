package com.cs.service;

import com.cs.bean.Dept;
import com.cs.bean.EmpDept;
import com.cs.commom.bean.Pager4EasyUI;

public interface DeptService extends BaseService<Dept> {
	
	/**
	 * 根据depId查询数据
	 * @return
	 */
	public Dept queryByDepId(String id);
	
	public Pager4EasyUI<EmpDept> queryByPager(Pager4EasyUI<EmpDept> pager);
	
	/**
	 * 根据名称查找部门
	 */
	public boolean queryByName(String beanName, String name);

}
