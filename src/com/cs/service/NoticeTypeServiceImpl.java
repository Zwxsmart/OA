package com.cs.service;

import java.io.Serializable;

import com.cs.bean.NoticeType;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.NoticeTypeDAO;

public class NoticeTypeServiceImpl implements NoticeTypeService{
	
	private NoticeTypeDAO noticeTypeDAO;

	public NoticeTypeDAO getNoticeTypeDAO() {
		return noticeTypeDAO;
	}

	public void setNaticeTypeDAO(NoticeTypeDAO noticeTypeDAO) {
		this.noticeTypeDAO = noticeTypeDAO;
	}

	@Override
	public NoticeType save(NoticeType t) {
		return noticeTypeDAO.save(t);
	}

	@Override
	public void delete(NoticeType t) {
		noticeTypeDAO.delete(t);
	}

	@Override
	public void update(NoticeType t) {
		noticeTypeDAO.update(t);
	}

	@Override
	public NoticeType queryById(Class<?> clazz, Serializable id) {
		return noticeTypeDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<NoticeType> queryByPager(String beanName, Pager4EasyUI<NoticeType> pager, String sql) {
		return noticeTypeDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return noticeTypeDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		noticeTypeDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<NoticeType> queryByDay(Pager4EasyUI<NoticeType> pager, Serializable startDay,
			Serializable endDay, Serializable beanObject, Serializable attrName) {
		return noticeTypeDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<NoticeType> blurredAllQueryPager(String string, Pager4EasyUI<NoticeType> pager, String value,
			String name) {
		return noticeTypeDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {

		return noticeTypeDAO.queryPrevillige(roleId, actionName);
	}
	
	
	
}
