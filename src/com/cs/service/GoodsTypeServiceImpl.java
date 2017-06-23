package com.cs.service;

import java.io.Serializable;
import java.util.List;

import com.cs.bean.GoodsType;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.GoodsTypeDAO;

public class GoodsTypeServiceImpl implements GoodsTypeService{
	
	private GoodsTypeDAO goodsTypeDAO;
	
	

	public GoodsTypeDAO getGoodsTypeDAO() {
		return goodsTypeDAO;
	}

	public void setGoodsTypeDAO(GoodsTypeDAO goodsTypeDAO) {
		this.goodsTypeDAO = goodsTypeDAO;
	}

	@Override
	public GoodsType save(GoodsType t) {
		return goodsTypeDAO.save(t);
	}

	@Override
	public void delete(GoodsType t) {
		goodsTypeDAO.delete(t);
	}

	@Override
	public void update(GoodsType t) {
		goodsTypeDAO.update(t);
	}

	@Override
	public GoodsType queryById(Class<?> clazz, Serializable id) {
		return goodsTypeDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<GoodsType> queryByPager(String beanName, Pager4EasyUI<GoodsType> pager, String sql) {
		return goodsTypeDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return goodsTypeDAO.count(beanName,sql);
	}


	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		goodsTypeDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<GoodsType> queryByDay(Pager4EasyUI<GoodsType> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Pager4EasyUI<GoodsType> blurredAllQueryPager(String string, Pager4EasyUI<GoodsType> pager, String value,
			String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		// TODO Auto-generated method stub
		return goodsTypeDAO.queryPrevillige(roleId, actionName);
	}

}
