package com.cs.dao;

import java.util.List;

import com.cs.bean.EmpCheckingInfo;

public interface EmpCheckingInfoDAO extends BaseDAO<EmpCheckingInfo>{
	
	/**
	 * list���ϲ�ѯcheckinginfo��ȫ������
	 * @return
	 */
	public List<EmpCheckingInfo> query();

}
