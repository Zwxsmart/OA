package com.cs.dao;

import com.cs.bean.Goods;

public interface GoodsDAO extends BaseDAO<Goods>{
	
	public void updateQuantity(String beanName,String beanId,int quantity,String id);
	
	/**
	 * ʵ���깺��������Ʒ�ӷ�
	 */
	public void updateAppQuantity(int appCount, String id);

}
