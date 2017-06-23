package com.cs.service;

import com.cs.bean.Course;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * 课程相关的service接口
 * @author 王怡
 *
 */
public interface CourseService extends BaseService<Course>{
	public Pager4EasyUI<Course> blurredAllQueryPager(String string,Pager4EasyUI<Course> pager,String value,String name);
	public long blurredAllQueryCount(String string, Pager4EasyUI<Course> pager, String value, String name);
	public Pager4EasyUI<Course> termSerach(String string,Pager4EasyUI<Course> pager,String term);
}
