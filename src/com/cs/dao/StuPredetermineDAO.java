package com.cs.dao;

import com.cs.bean.Income;
import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * 市场管理增删改查DAO
 * @author 温鑫
 *
 */
public interface StuPredetermineDAO extends BaseDAO<Stu> {
	
	//分页查询所有预定学生
	public Pager4EasyUI<Stu> queryAssignByPager(String string, Pager4EasyUI<Stu> pager);
	
	
	//分页查询所有预定人数
	public long assignCount(String string);

	
	//分页查询所有禁用预定学生
	public Pager4EasyUI<Stu> queryFreezeByPager(String string, Pager4EasyUI<Stu> pager);
	
	
	//分页查询所有禁用预定人数
	public long freezeCount(String string);
	
	
	//分页查询所有启用预定学生
	public Pager4EasyUI<Stu> queryFreezeByPager1(String string, Pager4EasyUI<Stu> pager);
	
	
	//分页查询所有启用预定人数
	public long freezeCount1(String string);
	
	
	//模糊查询
	public Pager4EasyUI<Stu> blurredAllQueryPager(String string, Pager4EasyUI<Stu> pager, String value, String name);
	
	
	//模糊查询人数
	public long blurredAllQueryCount(String string, Pager4EasyUI<Stu> pager, String value, String name);
	
	
	//禁用启用状态操作
	public void updateStatus(String beanName,String beanId,int status,String id);
	
	
	//转为正式学生
	public void updatePredetermine(String beanName,String intention, String id);
}
