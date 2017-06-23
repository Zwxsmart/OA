package com.cs.dao;

import com.cs.bean.PayType;
import com.cs.commom.bean.Pager4EasyUI;

public class PayTypeDAOImpl extends AbstractBaseDAO<PayType> implements PayTypeDAO{

	@Override
	public Pager4EasyUI<PayType> blurredAllQueryPager(String string, Pager4EasyUI<PayType> pager, String value,
			String name) {
		return null;
	}
}
