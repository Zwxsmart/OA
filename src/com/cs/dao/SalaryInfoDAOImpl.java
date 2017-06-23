package com.cs.dao;

import com.cs.bean.SalaryInfo;
import com.cs.commom.bean.Pager4EasyUI;

public class SalaryInfoDAOImpl extends AbstractBaseDAO<SalaryInfo> implements SalaryInfoDAO{

	@Override
	public Pager4EasyUI<SalaryInfo> blurredAllQueryPager(String string, Pager4EasyUI<SalaryInfo> pager, String value,
			String name) {
		return null;
	}
}
