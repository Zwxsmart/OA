package com.cs.service;

import com.cs.bean.GoodsApp;

public interface GoodsAppService extends BaseService<GoodsApp>{
	
	 public void updateAppStatus(String beanName,String beanId,int appStatus,String id);

}
