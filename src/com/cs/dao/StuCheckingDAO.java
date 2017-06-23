package com.cs.dao;

import java.util.List;

import com.cs.bean.StuChecking;
import com.cs.commom.bean.Pager4EasyUI;

/**
 * 学生考勤DAO
 * @author 张文星
 *
 */
public interface StuCheckingDAO extends BaseDAO<StuChecking> {
	public Pager4EasyUI<StuChecking> queryStuChecking(Pager4EasyUI<StuChecking> pager, String gradeId);
	public List<StuChecking> queryAll(String gradeId);
	public List<StuChecking> queryByMonth(String gradeId, String year, String month);
}
