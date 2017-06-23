package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Goods;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.GoodsDAO;

public class GoodsServiceImpl implements GoodsService {
	
	private GoodsDAO goodsDAO;
	
	public GoodsDAO getGoodsDAO() {
		return goodsDAO;
	}

	public void setGoodsDAO(GoodsDAO goodsDAO) {
		this.goodsDAO = goodsDAO;
	}

	@Override
	public Goods save(Goods t) {
		return goodsDAO.save(t);
	}

	@Override
	public void delete(Goods t) {
		goodsDAO.delete(t);
	}

	@Override
	public void update(Goods t) {
		goodsDAO.update(t);
	}

	@Override
	public Goods queryById(Class<?> clazz, Serializable id) {
		return goodsDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Goods> queryByPager(String beanName, Pager4EasyUI<Goods> pager, String sql) {
		return goodsDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return goodsDAO.count(beanName,sql);
	}


	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		goodsDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Goods> queryByDay(Pager4EasyUI<Goods> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return goodsDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public void updateQuantity(String beanName, String beanId, int quantity, String id) {
		goodsDAO.updateQuantity(beanName, beanId, quantity, id);		
	}

	@Override
	public Pager4EasyUI<Goods> blurredAllQueryPager(String string, Pager4EasyUI<Goods> pager, String value,
			String name) {
		return goodsDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		// TODO Auto-generated method stub
		return goodsDAO.queryPrevillige(roleId, actionName);
	}

	@Override
	public void updateAppQuantity(int appCount, String id) {
		goodsDAO.updateAppQuantity(appCount, id);
	}

}
