package com.cs.dao;

import java.util.List;

import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * 学生增删改查DAO
 * @author 张文星
 *
 */
public interface StuDAO extends BaseDAO<Stu> {
	public List<Stu> queryPhonePwd(Stu stu);
	public Stu queryById(String id);
	public Pager4EasyUI<Stu> queryByPager(Pager4EasyUI<Stu> pager, String sql);
	//查询所有被冻结的学生
	Pager4EasyUI<Stu> queryFreezeByPager(String string, Pager4EasyUI<Stu> pager);
	//模糊查询方法
	Pager4EasyUI<Stu> blurredAllQueryPager(String string, Pager4EasyUI<Stu> pager, String value, String name);
	Pager4EasyUI<Stu> queryByPager1(Pager4EasyUI<Stu> pager, String sql);
}
