package com.cs.dao;

import com.cs.bean.Dept;
import com.cs.bean.EmpDept;
import com.cs.commom.bean.Pager4EasyUI;

public interface DeptDAO extends BaseDAO<Dept> {
	
	/**
	 * ����depId��ѯ����
	 * @return
	 */
	public Dept queryByDepId(String id);

	public void updateStatus(String beanName, String beanId, int status, String id);
	
	/**
	 * dept��emp��װ��ѯ��ҳ
	 * @param pager
	 * @return
	 */
	public Pager4EasyUI<EmpDept> queryByPager(Pager4EasyUI<EmpDept> pager);
	
	/**
	 * ��������ȥ��ѯ����
	 */
	public boolean queryByName(String beanName, String name);
	
	
	
}
