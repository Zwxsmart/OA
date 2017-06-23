package com.cs.dao;

import com.cs.bean.Course;
import com.cs.commom.bean.Pager4EasyUI;

public interface CourseDAO extends BaseDAO<Course>{
	public Pager4EasyUI<Course> blurredAllQueryPager(String string,Pager4EasyUI<Course> pager,String value,String name);
	public long blurredAllQueryCount(String string, Pager4EasyUI<Course> pager, String value, String name);
	public Pager4EasyUI<Course> termSerach(String string,Pager4EasyUI<Course> pager,String term);
}
