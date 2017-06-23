package com.cs.dao;

import com.cs.bean.Salary;
import com.cs.commom.bean.Pager4EasyUI;

public interface SalaryDAO extends BaseDAO<Salary>{
	public Pager4EasyUI<Salary> blurredAllQueryPager(String string,Pager4EasyUI<Salary> pager,String value,String name);
	public double querysalary(String value);
}
