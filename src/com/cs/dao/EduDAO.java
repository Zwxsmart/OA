package com.cs.dao;

import com.cs.bean.Edu;

public interface EduDAO extends BaseDAO<Edu> {

	void updateStatus(String beanName, String beanId, int status, String id);
	
	

}
