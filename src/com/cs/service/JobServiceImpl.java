package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Job;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.JobDAO;

/**
 * 学生就业service实现
 * @author 张文星
 *
 */
public class JobServiceImpl implements JobService {
	
	private JobDAO jobDAO;

	public JobDAO getJobDAO() {
		return jobDAO;
	}

	public void setJobDAO(JobDAO JobDAO) {
		this.jobDAO = JobDAO;
	}

	@Override
	public Job save(Job t) {
		return jobDAO.save(t);
	}

	@Override
	public void delete(Job t) {
		jobDAO.delete(t);		
	}

	@Override
	public void update(Job t) {
		jobDAO.update(t);		
	}

	@Override
	public Job queryById(Class<?> clazz, Serializable id) {
		return jobDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Job> queryByPager(String beanName, Pager4EasyUI<Job> pager, String sql) {
		return jobDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return jobDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		jobDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Job> queryByDay(Pager4EasyUI<Job> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return jobDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<Job> blurredAllQueryPager(String string, Pager4EasyUI<Job> pager, String value, String name) {
		return jobDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return jobDAO.queryPrevillige(roleId, actionName);
	}

}
