package com.cs.service;

import com.cs.bean.Goods;

public interface GoodsService extends BaseService<Goods>{
	public void updateQuantity(String beanName, String beanId, int quantity, String id);
	
	/**
	 * 实现申购数量的物品加法
	 */
	public void updateAppQuantity(int appCount, String id);
}
