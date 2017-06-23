package com.cs.service;

import java.util.List;

import com.cs.bean.EmpChecking;
import com.cs.commom.bean.Pager4EasyUI;

public interface EmpCheckingService extends BaseService<EmpChecking>{
	public Pager4EasyUI<EmpChecking> queryEmpChecking(Pager4EasyUI<EmpChecking> pager, String depId);
	public List<EmpChecking> queryAll(String depId);
	public List<EmpChecking> queryByMonth(String depId, String year, String month);
}
