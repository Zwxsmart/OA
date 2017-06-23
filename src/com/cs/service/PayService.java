package com.cs.service;

import java.util.List;
import java.util.Map;

import com.cs.bean.Pay;
import com.cs.commom.bean.Pager4EasyUI;

public interface PayService extends BaseService<Pay>{
	public long blurredAllQueryCount(String string, Pager4EasyUI<Pay> pager, String value, String name);
	public List<Map<String,String>> payQueryTypeName(); 
}
