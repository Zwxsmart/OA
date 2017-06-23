package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Course;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.CourseDAO;
/**
 * �γ���ص�serviceʵ����
 * @author ����
 *
 */
public class CourseServicelmpl implements CourseService{

	private CourseDAO courseDAO;
	
	
	public CourseDAO getCourseDAO() {
		return courseDAO;
	}

	public void setCourseDAO(CourseDAO courseDAO) {
		this.courseDAO = courseDAO;
	}

	/**
	 * ��ӿγ�
	 */
	@Override
	public Course save(Course t) {
		return courseDAO.save(t);
	}

	/**
	 * ɾ���γ�
	 */
	@Override
	public void delete(Course t) {
		courseDAO.delete(t);
	}

	/**
	 * ���¿γ�
	 */
	@Override
	public void update(Course t) {
		courseDAO.update(t);
		
	}

	/**
	 * ����id��ѯ�γ�
	 */
	@Override
	public Course queryById(Class<?> clazz, Serializable id) {
		return courseDAO.queryById(clazz,id);
	}

	/**
	 * ��ҳ��ѯ�����пγ���Ϣ
	 */
	@Override
	public Pager4EasyUI<Course> queryByPager(String beanName, Pager4EasyUI<Course> pager, String sql) {
		return courseDAO.queryByPager(beanName, pager, sql);
	}

	/**
	 * ��ѯ���γ̵�����
	 */
	@Override
	public long count(String beanName, String sql) {
		return courseDAO.count(beanName, sql);
	}

	/**
	 *��ѯ�����еĿγ�
	 */
	

	@Override
	public Pager4EasyUI<Course> blurredAllQueryPager(String string, Pager4EasyUI<Course> pager, String value,
			String name) {
		return courseDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public long blurredAllQueryCount(String string, Pager4EasyUI<Course> pager, String value, String name) {
		return courseDAO.blurredAllQueryCount(string, pager, value, name);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		courseDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Course> termSerach(String string, Pager4EasyUI<Course> pager, String term) {
		return courseDAO.termSerach(string, pager,term);
	}

	@Override
	public Pager4EasyUI<Course> queryByDay(Pager4EasyUI<Course> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return courseDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return courseDAO.queryPrevillige(roleId, actionName);
	}

}
