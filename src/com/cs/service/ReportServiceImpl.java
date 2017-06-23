package com.cs.service;

import java.io.Serializable;

import com.cs.bean.Report;
import com.cs.commom.bean.Pager4EasyUI;
import com.cs.dao.ReportDAO;

public class ReportServiceImpl implements ReportService {
	
	private ReportDAO reportDAO;
	
	public ReportDAO getReportDAO() {
		return reportDAO;
	}

	public void setReportDAO(ReportDAO reportDAO) {
		this.reportDAO = reportDAO;
	}

	@Override
	public Report save(Report t) {
		return reportDAO.save(t);
	}

	@Override
	public void delete(Report t) {
		reportDAO.delete(t);
	}

	@Override
	public void update(Report t) {
		reportDAO.update(t);
	}

	@Override
	public Report queryById(Class<?> clazz, Serializable id) {
		return reportDAO.queryById(clazz, id);
	}

	@Override
	public Pager4EasyUI<Report> queryByPager(String beanName, Pager4EasyUI<Report> pager, String sql) {
		return reportDAO.queryByPager(beanName, pager, sql);
	}

	@Override
	public long count(String beanName, String sql) {
		return reportDAO.count(beanName,sql);
	}

	@Override
	public void updateStatus(String beanName, String beanId, int status, String id) {
		reportDAO.updateStatus(beanName, beanId, status, id);
	}

	@Override
	public Pager4EasyUI<Report> queryByDay(Pager4EasyUI<Report> pager, Serializable startDay, Serializable endDay,
			Serializable beanObject, Serializable attrName) {
		return reportDAO.queryByDay(pager, startDay, endDay, beanObject, attrName);
	}

	@Override
	public Pager4EasyUI<Report> blurredAllQueryPager(String string, Pager4EasyUI<Report> pager, String value,
			String name) {
		return reportDAO.blurredAllQueryPager(string, pager, value, name);
	}

	@Override
	public Pager4EasyUI<Report> queryFreezeByPager(String string, Pager4EasyUI<Report> pager) {
		return reportDAO.queryFreezeByPager(string, pager);
	}

	@Override
	public long freezeCount(String string) {
		return reportDAO.freezeCount(string);
	}

	@Override
	public Pager4EasyUI<Report> queryFreezeByPager1(String string, Pager4EasyUI<Report> pager) {
		return reportDAO.queryFreezeByPager1(string, pager);
	}

	@Override
	public long freezeCount1(String string) {
		return reportDAO.freezeCount1(string);
	}

	@Override
	public boolean queryPrevillige(String roleId, String actionName) {
		// TODO Auto-generated method stub
		return reportDAO.queryPrevillige(roleId, actionName);
	}

	

}
