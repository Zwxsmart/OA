package com.cs.service;

import java.util.List;

import com.cs.bean.StuChecking;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * ѧ������service
 * @author ������
 *
 */
public interface StuCheckingService extends BaseService<StuChecking> {
	public Pager4EasyUI<StuChecking> queryStuChecking(Pager4EasyUI<StuChecking> pager, String gradeId);
	public List<StuChecking> queryAll(String gradeId);
	public List<StuChecking> queryByMonth(String gradeId, String year, String month);
}
