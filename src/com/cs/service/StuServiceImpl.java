package com.cs.service;

import java.io.Serializable;
import java.util.List;

import com.cs.bean.Stu;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.StuDAO;

/**
 * 学生service层实现
 * @author 张文星
 *
 */
public class StuServiceImpl implements StuService {
	
	private StuDAO stuDAO;

	
	public StuDAO getStuDAO() {
		return stuDAO;
	}

	public void setStuDAO(StuDAO stuDAO) {
		this.stuDAO = stuDAO;
	}

	@Override
	public Stu save(Stu t) {
		return stuDAO.save(t);
	}

	@Override
	public void delete(Stu t) {
		stuDAO.delete(t);		
	}

	@Override
	public void update(Stu t) {
		stuDAO.update(t);		
	}

	@Override
	public Stu queryById(Class<?> clazz, Serializable id) {
		return stuDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Stu> queryByPager(String beanName, Pager4EasyUI<Stu> pager, String sql) {
		return stuDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return stuDAO.count(beanName,sql);
	}

	@Override
	public Pager4EasyUI<Stu> queryFreezeByPager(String string, Pager4EasyUI<Stu> pager) {
		return stuDAO.queryFreezeByPager(string, pager);
	}

	// 模糊查询查询方法
	@Override
	public Pager4EasyUI<Stu> blurredAllQueryPager(String string, Pager4EasyUI<Stu> pager, String value, String name) {
		return stuDAO.blurredAllQueryPager(string,pager, value, name);
	}
	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		stuDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Stu> queryByDay(Pager4EasyUI<Stu> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return stuDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return stuDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public Pager4EasyUI<Stu> queryByPager1(String sql, Pager4EasyUI<Stu> pager) {
		return stuDAO.queryByPager1(pager, sql);
	}
	
	@Override
	public List<Stu> queryPhonePwd(Stu stu) {
		return stuDAO.queryPhonePwd(stu);
	}

	@Override
	public Stu queryById(String id) {
		return stuDAO.queryById(id);
	}

}
