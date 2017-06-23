package com.cs.service;

import java.io.Serializable;

import com.cs.bean.StuLeave;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.StuLeaveDAO;

/**
 * 学生分数service实现
 * @author 张文星
 *
 */
public class StuLeaveServiceImpl implements StuLeaveService {
	
	private StuLeaveDAO stuLeaveDAO;

	public StuLeaveDAO getStuLeaveDAO() {
		return stuLeaveDAO;
	}

	public void setStuLeaveDAO(StuLeaveDAO stuLeaveDAO) {
		this.stuLeaveDAO = stuLeaveDAO;
	}

	@Override
	public StuLeave save(StuLeave t) {
		return stuLeaveDAO.save(t);
	}

	@Override
	public void delete(StuLeave t) {
		stuLeaveDAO.delete(t);		
	}

	@Override
	public void update(StuLeave t) {
		stuLeaveDAO.update(t);		
	}

	@Override
	public StuLeave queryById(Class<?> clazz, Serializable id) {
		return stuLeaveDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<StuLeave> queryByPager(String beanName, Pager4EasyUI<StuLeave> pager, String sql) {
		return stuLeaveDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return stuLeaveDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		stuLeaveDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<StuLeave> queryByDay(Pager4EasyUI<StuLeave> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return stuLeaveDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<StuLeave> blurredAllQueryPager(String string, Pager4EasyUI<StuLeave> pager, String value,
			String name) {
		return stuLeaveDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return stuLeaveDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public void stuPass(String sql) {
		stuLeaveDAO.stuPass(sql);
	}

}
