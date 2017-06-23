package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Talk;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.TalkDAO;

/**
 * 学生谈心service实现
 * @author 张文星
 *
 */
public class TalkServiceImpl implements TalkService {
	
	private TalkDAO talkDAO;

	public TalkDAO getTalkDAO() {
		return talkDAO;
	}

	public void setTalkDAO(TalkDAO talkDAO) {
		this.talkDAO = talkDAO;
	}

	@Override
	public Talk save(Talk t) {
		return talkDAO.save(t);
	}

	@Override
	public void delete(Talk t) {
		talkDAO.delete(t);		
	}

	@Override
	public void update(Talk t) {
		talkDAO.update(t);		
	}

	@Override
	public Talk queryById(Class<?> clazz, Serializable id) {
		return talkDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Talk> queryByPager(String beanName, Pager4EasyUI<Talk> pager, String sql) {
		return talkDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return talkDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		talkDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Talk> queryByDay(Pager4EasyUI<Talk> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return talkDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<Talk> blurredAllQueryPager(String string, Pager4EasyUI<Talk> pager, String value, String name) {
		return talkDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		return talkDAO.queryPrevillige(roleId, actionName);
	}

}
