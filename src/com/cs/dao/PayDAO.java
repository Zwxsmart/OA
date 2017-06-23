package com.cs.dao;

import java.util.List;
import java.util.Map;

import com.cs.bean.Pay;
import com.cs.commom.bean.Pager4EasyUI;

public interface PayDAO extends BaseDAO<Pay>{
	 
	public Pager4EasyUI<Pay> blurredAllQueryPager(String string,Pager4EasyUI<Pay> pager,String value,String name);
	public long blurredAllQueryCount(String string, Pager4EasyUI<Pay> pager, String value, String name);
	public Pager4EasyUI<Pay> serachDate(String beginTime, String endTime,Pager4EasyUI<Pay> pager);
	public List<Map<String,String>> payQueryTypeName();
}
