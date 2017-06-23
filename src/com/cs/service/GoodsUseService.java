package com.cs.service;

import java.io.Serializable;

import com.cs.bean.GoodsUse;

public interface GoodsUseService extends BaseService<GoodsUse>{
	/**
	 * 修改归还状态
	 * @param beanName
	 * @param beanId
	 * @param usestatus
	 * @param id
	 */
	public void updateUseStatus(String beanName, String beanId, int usestatus, String id);
	
	/**
	 * 修改归还物品数量
	 */
	public void updateGoodsQuantity(String beanName,String beanId,int quantity,String id);
	
	/**
	 * 修改归还时间
	 */
	public void updateUseRequestDate(String beanName,String beanId,Serializable returnday,String id);
}
