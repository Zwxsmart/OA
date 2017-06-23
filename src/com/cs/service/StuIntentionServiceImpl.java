package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Income;
import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.StuDAO;
import com.cs.dao.StuIntentionDAO;

/**
 * 市场管理service层实现
 * @author 温鑫
 *
 */
public class StuIntentionServiceImpl implements StuIntentionService {
	
	private StuIntentionDAO stuIntentionDAO;

	public StuIntentionDAO getStuIntentionDAO() {
		return stuIntentionDAO;
	}

	public void setStuIntentionDAO(StuIntentionDAO stuIntentionDAO) {
		this.stuIntentionDAO = stuIntentionDAO;
	}

	//添加
	@Override
	public Stu save(Stu stu) {
		return stuIntentionDAO.save(stu);
	}

	//删除
	@Override
	public void delete(Stu stu) {
		stuIntentionDAO.delete(stu);
	}

	//修改
	@Override
	public void update(Stu stu) {
		stuIntentionDAO.update(stu);
	}

	//根据id查询
	@Override
	public Stu queryById(Class<?> clazz, Serializable id) {
		return stuIntentionDAO.queryById(clazz, id);
	}
	
	//分页查询所有意向学生
	@Override
	public Pager4EasyUI<Stu> queryAssignByPager(String string, Pager4EasyUI<Stu> pager){
		return stuIntentionDAO.queryAssignByPager(string, pager);
		
	}
	
	//分页查询所有意向人数
	@Override
	public long assignCount(String string){
		return stuIntentionDAO.assignCount(string);
	}
	
	//分页查询所有学生
	@Override
	public Pager4EasyUI<Stu> queryByPager(String beanName, Pager4EasyUI<Stu> pager, String sql) {
		return stuIntentionDAO.queryByPager(beanName, pager,sql);
	}

	//分页查询所有人数
	@Override
	public long count(String beanName, String sql) {
		return stuIntentionDAO.count(beanName, sql);
	}

	//分页查询所有禁用意向学生
	@Override
	public Pager4EasyUI<Stu> queryFreezeByPager(String string, Pager4EasyUI<Stu> pager) {
		return stuIntentionDAO.queryFreezeByPager(string, pager);
	}

	//分页查询所有禁用意向人数
	@Override
	public long freezeCount(String string) {
		return stuIntentionDAO.freezeCount(string);
	}

	//分页查询所有启用意向学生
	@Override
	public Pager4EasyUI<Stu> queryFreezeByPager1(String string, Pager4EasyUI<Stu> pager) {
		return stuIntentionDAO.queryFreezeByPager1(string, pager);
	}

	//分页查询所有启用意向人数
	@Override
	public long freezeCount1(String string) {
		return stuIntentionDAO.freezeCount1(string);
	}

	//模糊查询
	@Override
	public Pager4EasyUI<Stu> blurredAllQueryPager(String string, Pager4EasyUI<Stu> pager, String value, String name) {
		return stuIntentionDAO.blurredAllQueryPager(string, pager, value, name);
	}

	//模糊查询人数
	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Stu> pager, String value, String name) {
		return stuIntentionDAO.blurredAllQueryCount(string, pager, value, name);
	}

	//禁用启用状态操作
	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		stuIntentionDAO.updateStatus(beanName, beanId, status, id);
	}

	
	//转为预定学生
	@Override
	public void updateIntention(String beanName,String intention, String id) {
		stuIntentionDAO.updateIntention(beanName, intention, id);
	}

	@Override
	public Pager4EasyUI<Stu> queryByDay(Pager4EasyUI<Stu> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return stuIntentionDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	//转为正式
	public void updatePredetermine(String beanName,String predetermine, String id){
		stuIntentionDAO.updatePredetermine(beanName, predetermine, id);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return stuIntentionDAO.queryPrevillige(roleId, actionName);
	}
}
