package com.cs.dao;

import com.cs.bean.EmpAppeal;

public interface EmpAppealDAO extends BaseDAO<EmpAppeal>{

	void updateStatus(String beanName, String beanId, int status, String id);

}
