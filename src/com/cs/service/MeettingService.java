package com.cs.service;

import com.cs.bean.Meetting;
import com.cs.commom.bean.Pager4EasyUI;

public interface MeettingService extends BaseService<Meetting>{
	public Pager4EasyUI<Meetting> blurredAllQueryPager(String string,Pager4EasyUI<Meetting> pager,String value,String name);
	public long blurredAllQueryCount(String string, Pager4EasyUI<Meetting> pager, String value, String name);
	public Pager4EasyUI<Meetting> serachDate(String beginTime, String endTime,Pager4EasyUI<Meetting> pager);
}
