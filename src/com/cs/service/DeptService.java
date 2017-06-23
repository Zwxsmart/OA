package com.cs.service;

import com.cs.bean.Dept;
import com.cs.bean.EmpDept;
import com.cs.commom.bean.Pager4EasyUI;

public interface DeptService extends BaseService<Dept> {
	
	/**
	 * ����depId��ѯ����
	 * @return
	 */
	public Dept queryByDepId(String id);
	
	public Pager4EasyUI<EmpDept> queryByPager(Pager4EasyUI<EmpDept> pager);
	
	/**
	 * �������Ʋ��Ҳ���
	 */
	public boolean queryByName(String beanName, String name);

}
