package com.cs.service;

import java.util.List;
import java.util.Map;

import com.cs.bean.Income;
import com.cs.commom.bean.Pager4EasyUI;

public interface IncomeService extends BaseService<Income> {

	long blurredAllQueryCount(String string, Pager4EasyUI<Income> pager, String value, String name);
	public void updateByStuId(String stuId, double d);
	public List<Map<String, String>> payQueryTypeName();

}
