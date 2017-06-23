package com.cs.dao;

import java.util.List;

import com.cs.bean.Notice;
import com.cs.commom.bean.Pager4EasyUI;

public interface NoticeDAO extends BaseDAO<Notice>{
	
	public Pager4EasyUI<Notice> blurredAllQueryPager(String string,Pager4EasyUI<Notice> pager,String value,String name);
//	public Pager4EasyUI<Notice> termSerach(String string,Pager4EasyUI<Notice> pager,String term);
	public Notice queryNewNotice();
}
