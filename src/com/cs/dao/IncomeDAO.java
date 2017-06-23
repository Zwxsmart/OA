package com.cs.dao;

import java.util.List;
import java.util.Map;

import com.cs.bean.Income;
import com.cs.commom.bean.Pager4EasyUI;

public interface IncomeDAO extends BaseDAO<Income>{
	public Pager4EasyUI<Income> blurredAllQueryPager(String string,Pager4EasyUI<Income> pager,String value,String name);
	public long blurredAllQueryCount(String string, Pager4EasyUI<Income> pager, String value, String name);
	public Pager4EasyUI<Income> serachDate(String beginTime, String endTime,Pager4EasyUI<Income> pager);
	public void updateByStuId(String stuId, double d);
	public List<Map<String,String>> payQueryTypeName();
}
