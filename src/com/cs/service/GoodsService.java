package com.cs.service;

import com.cs.bean.Goods;

public interface GoodsService extends BaseService<Goods>{
	public void updateQuantity(String beanName, String beanId, int quantity, String id);
	
	/**
	 * ʵ���깺��������Ʒ�ӷ�
	 */
	public void updateAppQuantity(int appCount, String id);
}
