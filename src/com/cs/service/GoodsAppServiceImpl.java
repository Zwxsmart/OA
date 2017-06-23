package com.cs.service;

import java.io.Serializable;

import com.cs.bean.GoodsApp;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.GoodsAppDAO;

public class GoodsAppServiceImpl implements GoodsAppService{
	
	private GoodsAppDAO goodsAppDAO;
	
	public GoodsAppDAO getGoodsAppDAO() {
		return goodsAppDAO;
	}

	public void setGoodsAppDAO(GoodsAppDAO goodsAppDAO) {
		this.goodsAppDAO = goodsAppDAO;
	}

	@Override
	public GoodsApp save(GoodsApp t) {
		return goodsAppDAO.save(t);
	}

	@Override
	public void delete(GoodsApp t) {
		goodsAppDAO.delete(t);
	}

	@Override
	public void update(GoodsApp t) {
		goodsAppDAO.update(t);
	}

	@Override
	public GoodsApp queryById(Class<?> clazz, Serializable id) {
		return goodsAppDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<GoodsApp> queryByPager(String beanName, Pager4EasyUI<GoodsApp> pager, String sql) {
		return goodsAppDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return goodsAppDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		goodsAppDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public void updateAppStatus(String beanName, String beanId, int appStatus, String id) {
		goodsAppDAO.updateAppStatus(beanName, beanId, appStatus, id);
	}

	@Override
	public Pager4EasyUI<GoodsApp> queryByDay(Pager4EasyUI<GoodsApp> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return goodsAppDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<GoodsApp> blurredAllQueryPager(String string, Pager4EasyUI<GoodsApp> pager, String value,
			String name) {
		return goodsAppDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		// TODO Auto-generated method stub
		return goodsAppDAO.queryPrevillige(roleId, actionName);
	}


	
}
