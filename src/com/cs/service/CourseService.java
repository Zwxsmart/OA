package com.cs.service;

import com.cs.bean.Course;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * �γ���ص�service�ӿ�
 * @author ����
 *
 */
public interface CourseService extends BaseService<Course>{
	public Pager4EasyUI<Course> blurredAllQueryPager(String string,Pager4EasyUI<Course> pager,String value,String name);
	public long blurredAllQueryCount(String string, Pager4EasyUI<Course> pager, String value, String name);
	public Pager4EasyUI<Course> termSerach(String string,Pager4EasyUI<Course> pager,String term);
}
