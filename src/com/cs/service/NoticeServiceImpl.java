package com.cs.service;

import java.io.Serializable;
import java.util.List;

import com.cs.bean.Notice;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.NoticeDAO;

public class NoticeServiceImpl implements NoticeService{
	
	private NoticeDAO noticeDAO;
	
	
	public NoticeDAO getNoticeDAO() {
		return noticeDAO;
	}

	public void setNoticeDAO(NoticeDAO noticeDAO) {
		this.noticeDAO = noticeDAO;
	}

	@Override
	public Notice save(Notice t) {
		return noticeDAO.save(t);
	}

	@Override
	public void delete(Notice t) {
		noticeDAO.delete(t);
	}

	@Override
	public void update(Notice t) {
		noticeDAO.update(t);
	}

	@Override
	public Notice queryById(Class<?> clazz, Serializable id) {
		return noticeDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Notice> queryByPager(String beanName, Pager4EasyUI<Notice> pager, String sql) {
		return noticeDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return noticeDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		noticeDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Notice> queryByDay(Pager4EasyUI<Notice> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return noticeDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}
	/**
	 * 查询所有的公告栏
	 */
	@Override
	public Pager4EasyUI<Notice> blurredAllQueryPager(String string, Pager4EasyUI<Notice> pager, String value,
			String name) {
		return noticeDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return noticeDAO.queryPrevillige(roleId, actionName);
	}
	public Notice queryNewNotice(){
		return noticeDAO.queryNewNotice();
		
	}
}
