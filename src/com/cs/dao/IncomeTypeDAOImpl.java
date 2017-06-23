package com.cs.dao;

import com.cs.bean.IncomeType;
import com.cs.commom.bean.Pager4EasyUI;

public class IncomeTypeDAOImpl extends AbstractBaseDAO<IncomeType> implements IncomeTypeDAO{

	@Override
	public Pager4EasyUI<IncomeType> blurredAllQueryPager(String string, Pager4EasyUI<IncomeType> pager, String value,
			String name) {
		return null;
	}
}
