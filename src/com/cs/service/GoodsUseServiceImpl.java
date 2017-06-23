package com.cs.service;

import java.io.Serializable;

import com.cs.bean.GoodsUse;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.GoodsUseDAO;

public class GoodsUseServiceImpl implements GoodsUseService{
	
	private GoodsUseDAO goodsUseDAO;
	
	public GoodsUseDAO getGoodsUseDAO() {
		return goodsUseDAO;
	}

	public void setGoodsUseDAO(GoodsUseDAO goodsUseDAO) {
		this.goodsUseDAO = goodsUseDAO;
	}

	@Override
	public GoodsUse save(GoodsUse t) {
		return goodsUseDAO.save(t);
	}

	@Override
	public void delete(GoodsUse t) {
		goodsUseDAO.delete(t);
	}

	@Override
	public void update(GoodsUse t) {
		goodsUseDAO.update(t);
	}

	@Override
	public GoodsUse queryById(Class<?> clazz, Serializable id) {
		return goodsUseDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<GoodsUse> queryByPager(String beanName, Pager4EasyUI<GoodsUse> pager, String sql) {
		return goodsUseDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return goodsUseDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		goodsUseDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<GoodsUse> queryByDay(Pager4EasyUI<GoodsUse> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return goodsUseDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public void updateUseStatus(String beanName, String beanId, int usestatus, String id) {
		goodsUseDAO.updateUseStatus(beanName, beanId, usestatus, id);
	}

	@Override
	public void updateGoodsQuantity(String beanName, String beanId, int quantity, String id) {
		goodsUseDAO.updateGoodsQuantity(beanName, beanId, quantity, id);
	}

	@Override
	public void updateUseRequestDate(String beanName, String beanId, Serializable returnday, String id) {
		goodsUseDAO.updateUseRequestDate(beanName, beanId, returnday, id);		
	}

	@Override
	public Pager4EasyUI<GoodsUse> blurredAllQueryPager(String string, Pager4EasyUI<GoodsUse> pager, String value,
			String name) {
		return goodsUseDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		// TODO Auto-generated method stub
		return goodsUseDAO.queryPrevillige(roleId, actionName);
	}

}
