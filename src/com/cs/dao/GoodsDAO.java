package com.cs.dao;

import com.cs.bean.Goods;

public interface GoodsDAO extends BaseDAO<Goods>{
	
	public void updateQuantity(String beanName,String beanId,int quantity,String id);
	
	/**
	 * 实现申购数量的物品加法
	 */
	public void updateAppQuantity(int appCount, String id);

}
