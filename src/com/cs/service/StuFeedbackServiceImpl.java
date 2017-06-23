package com.cs.service;

import java.io.Serializable;

import com.cs.bean.StuFeedback;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.StuFeedbackDAO;

/**
 * 学生反馈service实现
 * @author 张文星
 *
 */
public class StuFeedbackServiceImpl implements StuFeedbackService {
	
	private StuFeedbackDAO stuFeedbackDAO;

	public StuFeedbackDAO getStuFeedbackDAO() {
		return stuFeedbackDAO;
	}

	public void setStuFeedbackDAO(StuFeedbackDAO stuFeedbackDAO) {
		this.stuFeedbackDAO = stuFeedbackDAO;
	}

	@Override
	public StuFeedback save(StuFeedback t) {
		return stuFeedbackDAO.save(t);
	}

	@Override
	public void delete(StuFeedback t) {
		stuFeedbackDAO.delete(t);		
	}

	@Override
	public void update(StuFeedback t) {
		stuFeedbackDAO.update(t);		
	}

	@Override
	public StuFeedback queryById(Class<?> clazz, Serializable id) {
		return stuFeedbackDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<StuFeedback> queryByPager(String beanName, Pager4EasyUI<StuFeedback> pager, String sql) {
		return stuFeedbackDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return stuFeedbackDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		stuFeedbackDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<StuFeedback> queryByDay(Pager4EasyUI<StuFeedback> pager, Serializable startDay,
			Serializable endDay, Serializable beanObject, Serializable attrName) {
		return stuFeedbackDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<StuFeedback> blurredAllQueryPager(String string, Pager4EasyUI<StuFeedback> pager, String value,
			String name) {
		return stuFeedbackDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return stuFeedbackDAO.queryPrevillige(roleId, actionName);
	}

}
