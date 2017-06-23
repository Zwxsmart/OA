package com.cs.dao;


import com.cs.bean.GoodsApp;

public interface GoodsAppDAO extends BaseDAO<GoodsApp>{
	
	  public void updateAppStatus(String beanName,String beanId,int appStatus,String id);
}
