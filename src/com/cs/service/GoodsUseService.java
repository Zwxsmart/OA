package com.cs.service;

import java.io.Serializable;

import com.cs.bean.GoodsUse;

public interface GoodsUseService extends BaseService<GoodsUse>{
	/**
	 * �޸Ĺ黹״̬
	 * @param beanName
	 * @param beanId
	 * @param usestatus
	 * @param id
	 */
	public void updateUseStatus(String beanName, String beanId, int usestatus, String id);
	
	/**
	 * �޸Ĺ黹��Ʒ����
	 */
	public void updateGoodsQuantity(String beanName,String beanId,int quantity,String id);
	
	/**
	 * �޸Ĺ黹ʱ��
	 */
	public void updateUseRequestDate(String beanName,String beanId,Serializable returnday,String id);
}