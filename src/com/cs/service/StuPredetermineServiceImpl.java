package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Income;
import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.StuDAO;
import com.cs.dao.StuPredetermineDAO;

/**
 * 市场管理service层实现
 * @author 温鑫
 *
 */
public class StuPredetermineServiceImpl implements StuPredetermineService {
	
	private StuPredetermineDAO stuPredetermineDAO;

	public StuPredetermineDAO getStuPredetermineDAO() {
		return stuPredetermineDAO;
	}

	public void setStuPredetermineDAO(StuPredetermineDAO stuPredetermineDAO) {
		this.stuPredetermineDAO = stuPredetermineDAO;
	}

	//添加
	@Override
	public Stu save(Stu stu) {
		return stuPredetermineDAO.save(stu);
	}

	//删除
	@Override
	public void delete(Stu stu) {
		stuPredetermineDAO.delete(stu);
	}

	//修改
	@Override
	public void update(Stu stu) {
		stuPredetermineDAO.update(stu);
	}

	//根据id查询
	@Override
	public Stu queryById(Class<?> clazz, Serializable id) {
		return stuPredetermineDAO.queryById(clazz, id);
	}
	
	//分页查询所有预定学生
	@Override
	public Pager4EasyUI<Stu> queryAssignByPager(String string, Pager4EasyUI<Stu> pager){
		return stuPredetermineDAO.queryAssignByPager(string, pager);
		
	}
	
	//分页查询所有预定人数
	@Override
	public long assignCount(String string){
		return stuPredetermineDAO.assignCount(string);
	}
	
	//分页查询所有学生
	@Override
	public Pager4EasyUI<Stu> queryByPager(String beanName, Pager4EasyUI<Stu> pager, String sql) {
		return stuPredetermineDAO.queryByPager(beanName, pager, sql);
	}

	//分页查询所有人数
	@Override
	public long count(String beanName, String sql) {
		return stuPredetermineDAO.count(beanName, sql);
	}

	//分页查询所有禁用预定学生
	@Override
	public Pager4EasyUI<Stu> queryFreezeByPager(String string, Pager4EasyUI<Stu> pager) {
		return stuPredetermineDAO.queryFreezeByPager(string, pager);
	}

	//分页查询所有禁用预定人数
	@Override
	public long freezeCount(String string) {
		return stuPredetermineDAO.freezeCount(string);
	}

	//分页查询所有启用预定学生
	@Override
	public Pager4EasyUI<Stu> queryFreezeByPager1(String string, Pager4EasyUI<Stu> pager) {
		return stuPredetermineDAO.queryFreezeByPager1(string, pager);
	}

	//分页查询所有启用预定人数
	@Override
	public long freezeCount1(String string) {
		return stuPredetermineDAO.freezeCount1(string);
	}

	//模糊查询
	@Override
	public Pager4EasyUI<Stu> blurredAllQueryPager(String string, Pager4EasyUI<Stu> pager, String value, String name) {
		return stuPredetermineDAO.blurredAllQueryPager(string, pager, value, name);
	}

	//模糊查询人数
	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Stu> pager, String value, String name) {
		return stuPredetermineDAO.blurredAllQueryCount(string, pager, value, name);
	}

	//禁用启用状态操作
	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		stuPredetermineDAO.updateStatus(beanName, beanId, status, id);
	}

	//转为正式学生
	@Override
	public void updatePredetermine(String beanName,String predetermine, String id) {
		stuPredetermineDAO.updatePredetermine(beanName, predetermine, id);
	}

	@Override
	public Pager4EasyUI<Stu> queryByDay(Pager4EasyUI<Stu> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return stuPredetermineDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return stuPredetermineDAO.queryPrevillige(roleId, actionName);
	}
}
