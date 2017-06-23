package com.cs.service;

import java.util.List;

import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.BaseDAO;

/**
 * 学生service层
 * @author 张文星
 *
 */
public interface StuService extends BaseDAO<Stu>{
	List<Stu> queryPhonePwd(Stu stu);
	Stu queryById(String id);
	 //查询所有被冻结的分页学生 
	public Pager4EasyUI<Stu> queryFreezeByPager(String string, Pager4EasyUI<Stu> pager);
	//模糊查询方法
	public Pager4EasyUI<Stu> blurredAllQueryPager(String string, Pager4EasyUI<Stu> pager, String value, String name);
	public Pager4EasyUI<Stu> queryByPager1(String sql, Pager4EasyUI<Stu> pager);
}
