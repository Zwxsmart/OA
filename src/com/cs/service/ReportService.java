package com.cs.service;

import com.cs.bean.Report;
import com.cs.commom.bean.Pager4EasyUI;

public interface ReportService extends BaseService<Report>{
	
	//分页查询所有禁用
		public Pager4EasyUI<Report> queryFreezeByPager(String string, Pager4EasyUI<Report> pager);
			
			
		//分页查询所有禁用人数
		public long freezeCount(String string);
			
			
		//分页查询所有启用
		public Pager4EasyUI<Report> queryFreezeByPager1(String string, Pager4EasyUI<Report> pager);
		
			
		//分页查询所有启用人数
		public long freezeCount1(String string);
}
