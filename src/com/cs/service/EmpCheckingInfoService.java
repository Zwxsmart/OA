package com.cs.service;

import java.util.List;

import com.cs.bean.EmpCheckingInfo;

public interface EmpCheckingInfoService extends BaseService<EmpCheckingInfo>{

	/**
	 * list���ϲ�ѯcheckinginfo��ȫ������
	 * @return
	 */
	public List<EmpCheckingInfo> query();
}
