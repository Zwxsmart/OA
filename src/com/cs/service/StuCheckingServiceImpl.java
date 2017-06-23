package com.cs.service;

import java.io.Serializable;
import java.util.List;

import com.cs.bean.StuChecking;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.StuCheckingDAO;

/**
 * 学生考勤service实现
 * @author 张文星
 *
 */
public class StuCheckingServiceImpl implements StuCheckingService {
	
	private StuCheckingDAO stuCheckingDAO;

	public StuCheckingDAO getStuCheckingDAO() {
		return stuCheckingDAO;
	}

	public void setStuCheckingDAO(StuCheckingDAO stuCheckingDAO) {
		this.stuCheckingDAO = stuCheckingDAO;
	}

	@Override
	public StuChecking save(StuChecking t) {
		return stuCheckingDAO.save(t);
	}

	@Override
	public void delete(StuChecking t) {
		stuCheckingDAO.delete(t);		
	}

	@Override
	public void update(StuChecking t) {
		stuCheckingDAO.update(t);		
	}

	@Override
	public StuChecking queryById(Class<?> clazz, Serializable id) {
		return stuCheckingDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<StuChecking> queryByPager(String beanName, Pager4EasyUI<StuChecking> pager , String sql) {
		return stuCheckingDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return stuCheckingDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		stuCheckingDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<StuChecking> queryByDay(Pager4EasyUI<StuChecking> pager, Serializable startDay,
			Serializable endDay, Serializable beanObject, Serializable attrName) {
		return stuCheckingDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<StuChecking> blurredAllQueryPager(String string, Pager4EasyUI<StuChecking> pager, String value,
			String name) {
		return stuCheckingDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public Pager4EasyUI<StuChecking> queryStuChecking(Pager4EasyUI<StuChecking> pager, String gradeId) {
		return stuCheckingDAO.queryStuChecking(pager, gradeId);
	}

	@Override
	public List<StuChecking> queryAll(String gradeId) {
		return stuCheckingDAO.queryAll(gradeId);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return stuCheckingDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public List<StuChecking> queryByMonth(String gradeId, String year, String month) {
		return stuCheckingDAO.queryByMonth(gradeId, year, month);
	}

	

}
