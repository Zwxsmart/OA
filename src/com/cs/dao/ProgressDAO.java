package com.cs.dao;

import com.cs.bean.Progress;
import com.cs.commom.bean.Pager4EasyUI;

public interface ProgressDAO extends BaseDAO<Progress>{
	public Pager4EasyUI<Progress> blurredAllQueryPager(String string,Pager4EasyUI<Progress> pager,String value,String name);
	public long blurredAllQueryCount(String string, Pager4EasyUI<Progress> pager, String value, String name);
}
