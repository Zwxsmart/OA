package com.cs.service;

import java.util.List;

import com.cs.bean.EmpCheckingInfo;

public interface EmpCheckingInfoService extends BaseService<EmpCheckingInfo>{

	/**
	 * list集合查询checkinginfo的全部数据
	 * @return
	 */
	public List<EmpCheckingInfo> query();
}
