package com.cs.dao;

import java.util.List;

import com.cs.bean.EmpCheckingInfo;

public interface EmpCheckingInfoDAO extends BaseDAO<EmpCheckingInfo>{
	
	/**
	 * list集合查询checkinginfo的全部数据
	 * @return
	 */
	public List<EmpCheckingInfo> query();

}
